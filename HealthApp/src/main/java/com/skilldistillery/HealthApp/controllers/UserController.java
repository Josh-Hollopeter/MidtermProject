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
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.HealthApp.data.AdminDAO;
import com.skilldistillery.HealthApp.data.HealthAppDAO;
import com.skilldistillery.HealthApp.entities.Location;
import com.skilldistillery.HealthApp.entities.User;
import com.skilldistillery.HealthApp.entities.Workout;

@Controller
public class UserController {

	@Autowired
	HealthAppDAO dao;
	@Autowired
	AdminDAO userdao;

	@RequestMapping(path = { "/", "index.do" })
	public String home(Model model, HttpSession session, User user) {
//		if(
//		model.getAttribute("error")!=null) {
//			model.addAttribute("error", "No user Found");
//		}
		return "index";
	}

	@RequestMapping(path = { "login.do" })
	public String loginPostView(HttpSession session, User user, Model model) {
		user = dao.findByLogin(user.getUsername(), user.getPassword());

		if (user == null || !user.getActive() || user.getId() == 0) {
			model.addAttribute("error", "No user Found");
			return "index";
		} else {
			session.setAttribute("user", user);
		}

		return "redirect:userhome.do";

	}

	@RequestMapping(path = { "createupdateuser.do" })
	public String editForm(HttpSession session, User user, Model model) {
		if (session.getAttribute("user") == null) {
			session.setAttribute("user", user);
			return "createupdateuser";
		} else {
			return "createupdateuser";
		}
	}

	@RequestMapping(path = "updateuserinfo.do", method = RequestMethod.POST)
	public String updateCreateUser(HttpSession session, User user, Model model,
			@RequestParam(name = "userDate") String date1) {
		LocalDate uDate = LocalDate.parse(date1);
		user.setBirthDate(uDate);
		User user1 = (User) session.getAttribute("user");

		if (user1 == null || user1.getId() == 0) {
			userdao.createUser(user);
			session.setAttribute("user", user);
		} else {
			session.setAttribute("user", userdao.updateUser(user1.getId(), user));
		}

		return "redirect:userhome.do";

	}

	@RequestMapping(path = "createworkout.do")

	public String createWorkoutMapToButton(HttpSession session, User user, Model model, Workout workout) {
		User user1 = (User) session.getAttribute("user");
		List<Location> locations = dao.allLocation();
		model.addAttribute("locations", locations);

		if (user1 == null || user1.getId() == 0) {

			return "redirect:createupdateuser.do";
		} else {
			return "createworkout";
		}

	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session, User user, Model model) {
		session.setAttribute("user", null);
		return "redirect:index.do";

	}

	@RequestMapping(path = "userhome.do")
	public String userHome(HttpSession session, User user, Model model) {
		User user1 = (User) session.getAttribute("user");
		user1 =  dao.findById(user1.getId());
		List<Workout> guestworkouts = user1.getGuestWorkouts();
		
		;
		if(guestworkouts != null) {
			
		for (Workout workout : guestworkouts) {
			if (workout.getActive() == true) {
				int workCount = 0;
				workCount +=1;
				if (workCount > 0) {
					model.addAttribute("activeGuestWorkout", "activeGuestWorkouts");
				}
			}
		}
		}
		List<Workout> workouts = user1.getWorkouts();
		if(workouts != null) {
			
		for (Workout workout : workouts) {
			if (workout.getActive() == true) {
				int workCount1 = 0;
				workCount1 +=1;
				if (workCount1 > 0) {
					model.addAttribute("activeWorkout", "activeWorkouts");
				}
			}
		}
		}
		if (user1.getId() > 0) {
			return "userhome";
		} else {
			return "index";
		}

	}


	@RequestMapping(path = "admin.do")
	public String admin(HttpSession session, Model model) {
		List<User> allUser = dao.findAllUser();
		model.addAttribute("allUser", allUser);

		return "admin";

	}
	
	@RequestMapping(path="deleteuser.do")
	public  ModelAndView deleteUser(Integer userid,HttpSession session, ModelAndView mv) {
		
		userdao.deletedUser(userid);
		mv.setViewName("redirect:admin.do");
		return mv;
	}
	@RequestMapping(path="retriveuser.do")
	public  ModelAndView retriveUser(Integer userid,HttpSession session, ModelAndView mv) {
		userdao.retrieveUser(userid);
		mv.setViewName("redirect:admin.do");
		return mv;
		
		
	}


}
