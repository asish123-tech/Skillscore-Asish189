package com.skillscore.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/quantitative")
public class AptitudeController {

    @GetMapping("/test")
    public String test() {
        return "user/test";
    }

 
}
