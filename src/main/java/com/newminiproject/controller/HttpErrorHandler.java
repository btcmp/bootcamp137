package com.newminiproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HttpErrorHandler {

	 @RequestMapping(value="/403")
	 public String error404(){

	  return "pagenotfound";
	 }
}