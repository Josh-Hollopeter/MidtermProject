package com.skilldistillery.HealthApp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HealthApp.data.HealthAppDAOImpl;
import com.skilldistillery.HealthApp.entities.User;

@Controller
public class UserController {
	
	HealthAppDAOImpl dao = new HealthAppDAOImpl();
	
	@RequestMapping(path = {"/", "index.do"} )
	public String home() {
		return "index";
	}
	
	@RequestMapping(path = {"login.do"}, method = RequestMethod.GET)
	public String loginView(Model model, HttpSession session, User user) {
		if (session.getAttribute("user") != null) {
			return "userhome";
		}
		return "index";
	}
	
	@RequestMapping(path = {"login.do"}, method = RequestMethod.POST)
	public String loginPostView(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, Model model) {
		if (session.getAttribute("user") != null) {
			return "userhome";
		}
		User user = null;
		try {
			user = dao.findByLogin(username, password);
		}catch(Exception e) {
			
		}
		
		if ( user == null) {
			model.addAttribute("error", "No user Found");
			return "index";
		}
		session.setAttribute("user", user);
		return "userhome";
		
	}


}
