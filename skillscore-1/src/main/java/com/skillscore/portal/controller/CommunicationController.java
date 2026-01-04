package com.skillscore.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunicationController {
	@GetMapping("/basic-communication")
    public String bc() {
        return "basic-communication";
    }
	
	@GetMapping("/group-discussion")
    public String gd() {
        return "group-discussion";
    }
	@GetMapping("/public-speaking")
    public String ps() {
        return "public-speaking";
    }
	@GetMapping("/p-email")
    public String pe() {
        return "p-email";
    }

}
