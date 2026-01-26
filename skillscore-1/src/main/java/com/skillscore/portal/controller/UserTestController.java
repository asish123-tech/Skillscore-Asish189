package com.skillscore.portal.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.skillscore.portal.entity.Option;
import com.skillscore.portal.entity.Question;
import com.skillscore.portal.entity.Subtopic;
import com.skillscore.portal.repository.QuestionRepository;
import com.skillscore.portal.repository.SubtopicRepository;

@Controller
@RequestMapping("/user/quantitative")
public class UserTestController {

    @Autowired
    private SubtopicRepository subtopicRepository;

    @Autowired
    private QuestionRepository questionRepository;

    private Map<Long, Long> selectedAnswers = new HashMap<>();


    // ---------- LOAD TEST PAGE ----------
    @GetMapping("/test")
    public String loadTest(
            @RequestParam Long subtopicId,
            @RequestParam(defaultValue = "0") int index,
            Model model) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElse(null);
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        if (questions == null || questions.isEmpty()) {
            model.addAttribute("error", "No Questions Found");
            return "user/test";
        }

        if (index < 0) index = 0;
        if (index >= questions.size()) index = questions.size() - 1;

        Question currentQuestion = questions.get(index);

        model.addAttribute("subtopicName", subtopic.getName());
        model.addAttribute("subtopicId", subtopicId);
        model.addAttribute("question", currentQuestion);
        model.addAttribute("questions", questions);
        model.addAttribute("currentIndex", index);
        model.addAttribute("totalQuestions", questions.size());

        return "user/test";
    }


    // ---------- SUBMIT TEST ----------
    @PostMapping("/submit")
    public String submit(
            @RequestParam Long subtopicId,
            Model model) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElse(null);
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        int score = 0;

        for (Question q : questions) {
            Long markedOption = selectedAnswers.get(q.getId());
            if (markedOption == null) continue;

            for (Option opt : q.getOptions()) {
                if (opt.isCorrect() && opt.getId().equals(markedOption)) {
                    score++;
                }
            }
        }

        model.addAttribute("score", score);
        model.addAttribute("total", questions.size());
        model.addAttribute("selected", selectedAnswers);

        return "review";
    }


    // ---------- SAVE SELECTED OPTION ----------
    @PostMapping("/save")
    @ResponseBody
    public void saveAnswer(@RequestParam Long questionId,
                           @RequestParam Long optionId) {
        selectedAnswers.put(questionId, optionId);
    }
}
