package com.skillscore.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    // Start Test
    @GetMapping("/start")
    public String startTest(@RequestParam("subtopicId") Long subtopicId, Model model) {

        // Fetch subtopic first
        Subtopic subtopic = subtopicRepository.findById(subtopicId)
                .orElseThrow(() -> new RuntimeException("Subtopic not found"));

        // Fetch questions by Subtopic object
        List<Question> questions = questionRepository.findBySubtopic(subtopic);

        model.addAttribute("subtopic", subtopic);
        model.addAttribute("questions", questions);

        return "user/test";   // your JSP page
    }

}

