package com.skillscore.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuantitativeController {

    @GetMapping("/quantitative")
    public String quantitative() {
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
