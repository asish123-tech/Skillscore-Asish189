package com.skillscore.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skillscore.portal.entity.User;
import com.skillscore.portal.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {

    @Autowired
    private UserService userService;

    // 🔹 Splash Page
    @GetMapping("/")
    public String splash() {
        return "splash";
    }
    @GetMapping("/home")
    public String homePage() {
        return "home";
    }
    

    // 🔹 Login Page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // 🔹 Register Page
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }
    
    @GetMapping("/technical")
    public String technicalPage() {
        return "technical";
    }
    @GetMapping("/communication")
    public String communicationPage() {
        return "communication";
    }
    @GetMapping("/aptitude")
    public String aptitudePage() {
        return "aptitude";
    }
    @GetMapping("/hr")
    public String hrPage() {
        return "hr";
    }


    // ✅ 🔥 HANDLE REGISTER FORM SUBMIT
    @PostMapping("/register")
    public String registerUser(User user, Model model) {

        userService.registerUser(user); // SAVE USER

        model.addAttribute("success", "Registration successful. Please login.");
        return "login";
    }

    // 🔹 Handle Login
    @PostMapping("/login")
    public String loginUser(User user, Model model, HttpSession session) {

        User loggedUser = userService.login(user.getEmail(), user.getPassword());

        if (loggedUser == null) {
            model.addAttribute("error", "Invalid email or password");
            return "login";
        }

        // save logged user in session
        session.setAttribute("loggedUser", loggedUser);

        if ("ADMIN".equalsIgnoreCase(loggedUser.getRole())) {
            return "redirect:/admin/dashboard";
        }

        return "redirect:/student/dashboard";
    }
    @GetMapping("/student/dashboard")
    public String studentDashboard(HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        return "dashboard-student";
    }



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

}
