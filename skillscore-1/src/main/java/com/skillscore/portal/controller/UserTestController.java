package com.skillscore.portal.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.skillscore.portal.entity.Option;
import com.skillscore.portal.entity.Question;
import com.skillscore.portal.entity.Subtopic;
import com.skillscore.portal.model.ReviewModel;
import com.skillscore.portal.repository.QuestionRepository;
import com.skillscore.portal.repository.SubtopicRepository;

@Controller
@RequestMapping("/user/quantitative")
public class UserTestController {

    @Autowired
    private SubtopicRepository subtopicRepository;

    @Autowired
    private QuestionRepository questionRepository;

    // Stores answers: questionId → optionId
    private Map<Long, Long> selectedAnswers = new HashMap<>();

    // ---------- SAVE SELECTED OPTION ----------
    @PostMapping("/save-answer")
    public String saveAnswer(
            @RequestParam Long questionId,
            @RequestParam Long selectedOption,
            @RequestParam Long subtopicId,
            @RequestParam int index) {

        selectedAnswers.put(questionId, selectedOption);

        return "redirect:/user/quantitative/test?subtopicId=" + subtopicId + "&index=" + (index + 1);
    }

    // ---------- LOAD TEST PAGE ----------
    @GetMapping("/test")
    public String loadTest(
            @RequestParam Long subtopicId,
            @RequestParam(defaultValue = "0") int index,
            Model model) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElse(null);
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        if (index < 0) index = 0;
        if (index >= questions.size()) index = questions.size() - 1;

        Question q = questions.get(index);

        model.addAttribute("subtopicName", subtopic.getName());
        model.addAttribute("subtopicId", subtopicId);
        model.addAttribute("question", q);
        model.addAttribute("questions", questions);
        model.addAttribute("currentIndex", index);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("savedAnswers", selectedAnswers);

        return "user/test";
    }

    // ---------- SUBMIT TEST ----------
    @PostMapping("/submit")
    public String submitTest(@RequestParam Long subtopicId, Model model) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElse(null);
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        int score = 0;
        List<ReviewModel> reviewList = new ArrayList<>();

        for (Question q : questions) {

            Long selectedOptionId = selectedAnswers.get(q.getId());

            ReviewModel rm = new ReviewModel();
            rm.setQuestionText(q.getQuestionText());
            rm.setSelectedOption(selectedOptionId);

            String correctText = "";
            String selectedText = null;
            boolean isCorrect = false;

            for (Option opt : q.getOptions()) {

                if (opt.isCorrect()) {
                    correctText = opt.getOptionText();
                }

                if (selectedOptionId != null && opt.getId().equals(selectedOptionId)) {
                    selectedText = opt.getOptionText();
                    if (opt.isCorrect()) {
                        isCorrect = true;
                        score++;
                    }
                }
            }

            rm.setCorrectOptionText(correctText);
            rm.setSelectedOptionText(selectedText);
            rm.setCorrect(isCorrect);

            reviewList.add(rm);
        }

        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("reviewList", reviewList);

        // clear answers for next test
        selectedAnswers.clear();

        return "user/review";
    }
}
