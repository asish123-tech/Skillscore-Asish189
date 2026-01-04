package com.skillscore.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TechnicalController {


	    @GetMapping("/dsa")
	    public String dsa() {
	        return "dsa";
	    }
	    @GetMapping("/core-java")
	    public String java() {
	        return "core-java";
	    }
	    @GetMapping("/dbms-sql")
	    public String dbms() {
	        return "dbms-sql";
	    }
	    @GetMapping("/computer-networks")
	    public String cn() {
	        return "computer-networks";
	    }
	    @GetMapping("/os")
	    public String os() {
	        return "os";
	    }

}
