package com.skillscore.portal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    // Temporary in-memory storage for answers (you can convert to DB later)
    private Map<Long, String> userAnswers = new HashMap<>();

    // -----------------------------------------
    // 1️⃣ Start Test
    // -----------------------------------------
    @GetMapping("/start")
    public String startTest(@RequestParam("subtopicId") Long subtopicId, Model model) {

        Subtopic subtopic = subtopicRepository.findById(subtopicId)
                .orElseThrow(() -> new RuntimeException("Subtopic not found"));

        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        model.addAttribute("subtopic", subtopic);
        model.addAttribute("questions", questions);

        return "user/test";  // LOADS SAME UI FOR EVERY SUBTOPIC
    }


    // -----------------------------------------
    // 2️⃣ Auto-Save Answer (AJAX)
    // -----------------------------------------
    @PostMapping("/saveAnswer")
    @ResponseBody
    public String saveAnswer(@RequestBody Map<String, Object> payload) {

        Long questionId = Long.valueOf(payload.get("questionId").toString());
        String answer = payload.get("answer").toString();

        userAnswers.put(questionId, answer);

        return "saved";
    }

    // -----------------------------------------
    // 3️⃣ Submit Test (AJAX)
    // -----------------------------------------
    @PostMapping("/submit")
    @ResponseBody
    public Map<String, Object> submitTest(@RequestBody Map<String, Object> payload) {

        int score = 0;

        List<Question> questions = questionRepository.findAll();

        for (Question q : questions) {
            String userSelected = (String) payload.get(q.getId().toString());

            if (userSelected != null && userSelected.equals(q.getCorrectAnswerText())) {
                score++;
            }
        }

        return Map.of("score", score);
    }

    // -----------------------------------------
    // 4️⃣ Review Page
    // -----------------------------------------
    @GetMapping("/review")
    public String review(@RequestParam("score") int score, Model model) {

        model.addAttribute("score", score);
        model.addAttribute("answers", userAnswers);

        return "user/review"; // review.jsp
    }
}
