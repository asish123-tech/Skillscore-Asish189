package com.skillscore.portal.controller;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuantitativeController {

    @GetMapping("/quantitative")
    public String quantitative(Model model, HttpSession session) {

        // Progress stored as: subtopicId -> percentage
        @SuppressWarnings("unchecked")
        Map<Long, Integer> progress =
                (Map<Long, Integer>) session.getAttribute("progress");

        if (progress == null) {
            progress = new HashMap<>();
            progress.put(21L, 0); // Percentages
            progress.put(22L, 0); // Profit & Loss
            progress.put(23L, 0); // Time & Work
            progress.put(24L, 0); // TSD
            session.setAttribute("progress", progress);
        }

        model.addAttribute("progress", progress);
        return "quantitative";
    }

    @GetMapping("/logical")
    public String logical() {
        return "logical-reasoning";
    }

    @GetMapping("/verbal")
    public String verbal() {
        return "verbal-ability";
    }

    @GetMapping("/mixed")
    public String mixed() {
        return "mixed-aptitude";
    }
}
