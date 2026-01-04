package com.skillscore.portal.controller;

import com.skillscore.portal.repository.QuestionRepository;
import com.skillscore.portal.repository.TestAttemptRepository;
import com.skillscore.portal.repository.UserRepository;
import com.skillscore.portal.entity.User;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminDashboardController {

    private final QuestionRepository questionRepo;
    private final UserRepository userRepo;
    private final TestAttemptRepository testAttemptRepo;

    public AdminDashboardController(
            QuestionRepository questionRepo,
            UserRepository userRepo,
            TestAttemptRepository testAttemptRepo
    ) {
        this.questionRepo = questionRepo;
        this.userRepo = userRepo;
        this.testAttemptRepo = testAttemptRepo;
    }

    @GetMapping
    public String dashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        model.addAttribute("totalQuestions", questionRepo.countQuestions());
        model.addAttribute("totalStudents", userRepo.countStudents());
        model.addAttribute("totalTests", testAttemptRepo.countTests());

        Double avg = testAttemptRepo.averageScore();
        model.addAttribute("averageScore", avg == null ? 0 : Math.round(avg));

        return "dashboard-admin";
    }
}
