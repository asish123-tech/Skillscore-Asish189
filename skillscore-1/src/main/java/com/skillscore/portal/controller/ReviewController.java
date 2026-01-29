package com.skillscore.portal.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skillscore.portal.model.ReviewModel;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @GetMapping("/test/review")
    public String showReview(Model model, HttpSession session) {

        // Get data from session (set during test submit)
        List<ReviewModel> reviewList =
                (List<ReviewModel>) session.getAttribute("reviewList");

        Integer score = (Integer) session.getAttribute("score");
        Integer totalQuestions = (Integer) session.getAttribute("totalQuestions");
        Integer timeTaken = (Integer) session.getAttribute("timeTaken"); // seconds

        if (reviewList == null) {
            return "redirect:/quantitative";
        }

        // -------- ACCURACY ----------
        int accuracy = (int) ((score * 100.0) / totalQuestions);

        // -------- BADGE LOGIC ----------
        String badge;
        String badgeIcon;

        if (accuracy >= 90) {
            badge = "Master";
            badgeIcon = "🏆";
        } else if (accuracy >= 80) {
            badge = "Expert";
            badgeIcon = "🥇";
        } else if (accuracy >= 65) {
            badge = "Intermediate";
            badgeIcon = "🥈";
        } else if (accuracy >= 50) {
            badge = "Beginner";
            badgeIcon = "🥉";
        } else {
            badge = "Keep Practicing";
            badgeIcon = "💪";
        }

        // -------- MODEL ----------
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", totalQuestions);
        model.addAttribute("accuracy", accuracy);
        model.addAttribute("timeTaken", timeTaken);
        model.addAttribute("badge", badge);
        model.addAttribute("badgeIcon", badgeIcon);

        return "review";
    }
}
