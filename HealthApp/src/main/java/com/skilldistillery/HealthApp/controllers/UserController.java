package com.skilldistillery.HealthApp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.HealthApp.data.HealthAppDAOImpl;
import com.skilldistillery.HealthApp.entities.User;

@Controller
public class UserController {

	@Autowired
	HealthAppDAOImpl dao;

	@RequestMapping(path = { "/", "index.do" })
	public String home(Model model, HttpSession session, User user) {

		return "index";
	}

	@RequestMapping(path = { "login.do" })
	public String loginPostView(HttpSession session, User user, Model model) {
		user = dao.findByLogin(user.getUsername(), user.getPassword());

		if (user == null) {
			model.addAttribute("error", "No user Found");
			return "index";
		} else {
			session.setAttribute("user", user);
		}

		return "userhome";

	}

	@RequestMapping(path = { "createUpdateUser.do" })
	public String createUser(HttpSession session, User user, Model model) {
		if (user == null) {
			User user1 = new User();
			session.setAttribute("user", user1);
			return "createUpdateUser";
		} else {
			return "createUpdateUser";
		}
	}

}
