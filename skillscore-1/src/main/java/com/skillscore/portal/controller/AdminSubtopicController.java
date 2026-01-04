package com.skillscore.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skillscore.portal.entity.Subtopic;
import com.skillscore.portal.entity.Topic;
import com.skillscore.portal.repository.SubtopicRepository;
import com.skillscore.portal.repository.TopicRepository;

@Controller
@RequestMapping("/admin")
public class AdminSubtopicController {

    @Autowired
    private SubtopicRepository subtopicRepository;

    @Autowired
    private TopicRepository topicRepository;   // 🔥 THIS WAS MISSING

    @GetMapping("/subtopics")
    public String subtopicsPage(
            @RequestParam Long topicId,
            Model model) {

        Topic topic = topicRepository.findById(topicId)
                .orElseThrow(() -> new RuntimeException("Topic not found"));

        List<Subtopic> subtopics = subtopicRepository.findByTopic_Id(topicId);

        model.addAttribute("topic", topic);          // 🔥 SEND TOPIC
        model.addAttribute("subtopics", subtopics);

        return "admin/subtopics";
    }
}
