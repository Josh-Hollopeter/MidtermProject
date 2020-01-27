package com.skilldistillery.HealthApp.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HealthApp.data.AdminDAO;
import com.skilldistillery.HealthApp.data.HealthAppDAO;
import com.skilldistillery.HealthApp.entities.Location;
import com.skilldistillery.HealthApp.entities.User;

@Controller
public class UserController {

	@Autowired
	HealthAppDAO dao;
	@Autowired
	AdminDAO userdao;
	


	@RequestMapping(path = { "/", "index.do" })
	public String home(Model model, HttpSession session, User user) {

		return "index";
	}

	@RequestMapping(path = { "login.do" })
	public String loginPostView(HttpSession session, User user, Model model) {
		user = dao.findByLogin(user.getUsername(), user.getPassword());
		
		if (user == null || !user.getActive() || user.getId() == 0) {
			model.addAttribute("error", "No user Found");
			return "redirect:index.do";
		} else {
			session.setAttribute("user", user);
		}

		return "userhome";

	}

	
	@RequestMapping(path = {"createupdateuser.do"})
	public String editForm ( HttpSession session, User user, Model model) {
		if (session.getAttribute("user") == null ) {
			session.setAttribute("user",user);
			return "createupdateuser";
		}else {
			return "createupdateuser";
		}
	}

	
	@RequestMapping(path="updateuserinfo.do" , method = RequestMethod.POST)
	public String updateCreateUser( HttpSession session, User user, Model model, @RequestParam(name = "userDate") String date1) {
		LocalDate uDate = LocalDate.parse(date1);
		user.setBirthDate(uDate);
		

		if(user.getId() == 0 ) {
			userdao.createUser(user);
			session.setAttribute("user", user);
		}else {
			User user1 = (User) session.getAttribute("user");
			userdao.updateUser(user1.getId(), user);
		}
		
		return "userhome";
		
	}
	
	@RequestMapping(path = "createworkout.do")
		public String createWorkoutMapToButton( HttpSession session, User user, Model model) {
		User user1 = (User)session.getAttribute("user");
		List<Location> locations = dao.allLocation();
		model.addAttribute("locations", locations);
		if(user1 == null ||user1.getId() == 0) {
			return "redirect:createupdateuser.do";
		}else {
			return "createworkout";
		}
		
	}
	


@RequestMapping(path = "logout.do")
public String logout( HttpSession session, User user, Model model) {
	session.setAttribute("user", null);
	
	
	return "redirect:index.do";
}


@RequestMapping(path = "userhome.do")
public String userHome( HttpSession session, User user, Model model) {
	User user1 = (User) session.getAttribute("user");
	if(user1.getId() > 0) {
		return"userhome";
	}else {
		return"index";
	}
}

}