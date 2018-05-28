package com.newminiproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class Login {
	
	@RequestMapping
	public String doLogin(Model model, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout){
		if(error != null){
			model.addAttribute("error", "user or password invalid..!!");
		} 
		if(logout != null){
			model.addAttribute("logout", "anda sudah keluar..!!");
		}
		
		return "login";
	}
	
	@RequestMapping(value="/welcome", method=RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		return model;

	}
	
}
