package com.skilldistillery.HealthApp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping(path = {"/", "home.do"} )
	public String home() {
		return "index";
	}

}