package com.skillscore.portal.controller;

import java.util.*;

import jakarta.servlet.http.HttpSession;

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

    // ---------- LOAD TEST ----------
    @GetMapping("/test")
    public String loadTest(
            @RequestParam Long subtopicId,
            @RequestParam(defaultValue = "0") int index,
            Model model,
            HttpSession session) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElse(null);
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        // start timer once
        if (index == 0) {
            session.setAttribute("startTime", System.currentTimeMillis());
            session.setAttribute("answers", new HashMap<Long, Long>());
        }

        if (index < 0) index = 0;
        if (index >= questions.size()) index = questions.size() - 1;

        Map<Long, Long> savedAnswers =
                (Map<Long, Long>) session.getAttribute("answers");

        model.addAttribute("subtopicName", subtopic.getName());
        model.addAttribute("subtopicId", subtopicId);
        model.addAttribute("question", questions.get(index));
        model.addAttribute("currentIndex", index);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("savedAnswers", savedAnswers);

        return "user/test";
    }

    // ---------- SAVE ANSWER ----------
    @PostMapping("/save-answer")
    public String saveAnswer(
            @RequestParam Long questionId,
            @RequestParam Long selectedOption,
            @RequestParam Long subtopicId,
            @RequestParam int index,
            HttpSession session) {

        Map<Long, Long> answers =
                (Map<Long, Long>) session.getAttribute("answers");

        answers.put(questionId, selectedOption);

        return "redirect:/user/quantitative/test?subtopicId=" +
                subtopicId + "&index=" + (index + 1);
    }

    // ---------- SUBMIT TEST ----------
    @PostMapping("/submit")
    public String submitTest(@RequestParam Long subtopicId,
                             Model model,
                             HttpSession session) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElse(null);
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        Map<Long, Long> answers =
                (Map<Long, Long>) session.getAttribute("answers");

        int score = 0;
        List<ReviewModel> reviewList = new ArrayList<>();

        for (Question q : questions) {

            Long selectedId = answers.get(q.getId());

            ReviewModel rm = new ReviewModel();
            rm.setQuestionText(q.getQuestionText());

            boolean correct = false;
            String correctText = "";
            String selectedText = null;

            for (Option opt : q.getOptions()) {
                if (opt.isCorrect()) {
                    correctText = opt.getOptionText();
                }
                if (selectedId != null && opt.getId().equals(selectedId)) {
                    selectedText = opt.getOptionText();
                    if (opt.isCorrect()) {
                        correct = true;
                        score++;
                    }
                }
            }

            rm.setSelectedOptionText(selectedText);
            rm.setCorrectOptionText(correctText);
            rm.setCorrect(correct);

            reviewList.add(rm);
        }

        // ---------- METRICS ----------
        int total = questions.size();
        int wrong = total - score;
        int accuracy = (int) ((score * 100.0) / total);

        long startTime = (long) session.getAttribute("startTime");
        long timeTaken = (System.currentTimeMillis() - startTime) / 1000;

        // ---------- BADGE ----------
        String badge;
        if (accuracy >= 90) badge = "🏆 Master";
        else if (accuracy >= 75) badge = "🥇 Advanced";
        else if (accuracy >= 50) badge = "🥈 Beginner";
        else badge = "📘 Keep Practicing";

        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", total);
        model.addAttribute("correct", score);
        model.addAttribute("wrong", wrong);
        model.addAttribute("accuracy", accuracy);
        model.addAttribute("timeTaken", timeTaken);
        model.addAttribute("badge", badge);
        model.addAttribute("reviewList", reviewList);

        session.invalidate(); // clear session

        return "user/review";
    }
}
