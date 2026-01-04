package com.skillscore.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.skillscore.portal.entity.User;
import com.skillscore.portal.service.UserService;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    // ✅ Register API
    @PostMapping("/register")
    public User register(@RequestBody User user) {
        return userService.registerUser(user);
    }

    // ✅ Login API (simple)
    @PostMapping("/login")
    public String login(@RequestBody User user) {

        User loggedInUser = userService.login(
                user.getEmail(),
                user.getPassword()
        );

        if (loggedInUser != null) {
            return "Login successful! Welcome " + loggedInUser.getName();
        } else {
            return "Invalid email or password";
        }
    }
}
