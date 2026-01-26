package com.skillscore.portal.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.skillscore.portal.entity.Question;
import com.skillscore.portal.entity.Subtopic;
import com.skillscore.portal.repository.QuestionRepository;
import com.skillscore.portal.repository.SubtopicRepository;

@Controller
@RequestMapping("/user/test")
public class UserTestController {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private SubtopicRepository subtopicRepository;

    // Temporary memory to store answers (later store in DB)
    private Map<Long, String> userAnswers = new HashMap<>();

    // ---------------------------------------------------------
    // 1️⃣ LOAD TEST PAGE PER SUBTOPIC
    // ---------------------------------------------------------
    @GetMapping("/start")
    public String startTest(@RequestParam("subtopicId") Long subtopicId, Model model) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId)
                .orElseThrow(() -> new RuntimeException("Subtopic not found"));

        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        model.addAttribute("subtopic", subtopic);
        model.addAttribute("questions", questions);

        return "user/test";   // test.jsp
    }

    // ---------------------------------------------------------
    // 2️⃣ AUTO-SAVE ANSWER (AJAX)
    // ---------------------------------------------------------
    @PostMapping("/saveAnswer")
    @ResponseBody
    public String saveAnswer(@RequestBody Map<String, Object> payload) {

        Long questionId = Long.valueOf(payload.get("questionId").toString());
        String answer = payload.get("answer").toString();

        userAnswers.put(questionId, answer);

        return "saved";
    }

    // ---------------------------------------------------------
    // 3️⃣ SUBMIT TEST (AJAX)
    // ---------------------------------------------------------
    @PostMapping("/submit")
    @ResponseBody
    public Map<String, Object> submitTest(@RequestBody Map<String, Object> payload) {

        int score = 0;
        int total = 0;

        List<Question> questions = questionRepository.findAll();   // use only the subtopic ones in DB version

        for (Question q : questions) {
            total++;

            String userSelected = (String) payload.get(q.getId().toString());
            String rightAnswer = q.getCorrectAnswerText();

            if (userSelected != null && userSelected.equals(rightAnswer)) {
                score++;
            }
        }

        return Map.of(
                "score", score,
                "total", total
        );
    }

    // ---------------------------------------------------------
    // 4️⃣ REVIEW PAGE
    // ---------------------------------------------------------
    @GetMapping("/review")
    public String review(@RequestParam("score") int score,
                         @RequestParam("total") int total,
                         Model model) {

        model.addAttribute("score", score);
        model.addAttribute("total", total);
        model.addAttribute("answers", userAnswers);

        return "user/review"; // review.jsp
    }
}
