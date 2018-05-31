package com.newminiproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/welcome")
public class Welcome {
	@RequestMapping
	public String index() {
		
		return "welcome";
	}
}
