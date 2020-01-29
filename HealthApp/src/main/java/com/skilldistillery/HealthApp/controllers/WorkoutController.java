package com.skilldistillery.HealthApp.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.HealthApp.data.AdminDAO;
import com.skilldistillery.HealthApp.data.HealthAppDAO;
import com.skilldistillery.HealthApp.entities.Activity;
import com.skilldistillery.HealthApp.entities.Address;
import com.skilldistillery.HealthApp.entities.Location;
import com.skilldistillery.HealthApp.entities.User;
import com.skilldistillery.HealthApp.entities.Workout;

@Controller
public class WorkoutController {

	@Autowired
	HealthAppDAO dao;

	@Autowired
	AdminDAO dao2;

	@RequestMapping(path = "workoutbyid.do")
	public String workoutSearchById(HttpSession session, User user, Integer id) {
		Workout workout = dao.findWorkoutById(id);
		session.setAttribute("workout", workout);
		return "singleworkoutdetails";

	}

	@RequestMapping(path = "workoutsearchresults.do")
	public String workoutSearchMapToButton(HttpSession session, User user, Workout workout, Activity activity,
			@RequestParam("searchterm") String search, Model model) {

		List<Workout> workout1 = dao.searchByActivity(search);
		model.addAttribute("workouts", workout1);
		System.err.println(workout1);
		return "workoutsearchresult";

	}

	@RequestMapping(path = "workoutlistallresults.do")
	public String workoutListAllMapToButton(HttpSession session, User user, Workout workout, Activity activity) {

		List<Workout> workout1 = dao.findAll();
		session.setAttribute("workout", workout1);
		return "workoutshowallresult";
	}

	@RequestMapping(path = "newworkout.do")
	public ModelAndView createNewWorkout(@RequestParam("workoutdate") String date,
			@RequestParam("activityparam") String name, Workout workout, HttpSession session, ModelAndView mv,
			@RequestParam("locationid") Integer id) {
		mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Activity activity = dao2.findActivityByName(name);
		LocalDate ld = LocalDate.parse(date);
		workout.setActivity(activity);
		workout.setLocation(dao.findLocationById(id));
		workout.setCreatorId(user);
		workout.setWorkoutDate(ld);
		Workout newWorkout = dao.CreateWorkOut(workout);

		newWorkout.setActivity(activity);

		mv.addObject("newworkout", newWorkout);

		mv.setViewName("userhome");

		user.addWorkout(newWorkout);

		return mv;
	}

	@RequestMapping(path = "locationchoice.do")

	public String chooseLocation(int id, Model model) {

		Location newLocation;
		newLocation = dao.findLocationById(id);
		model.addAttribute("locationid", newLocation.getId());
		model.addAttribute("location", newLocation);
		List<Location> locations = dao.allLocation();
		model.addAttribute("locations", locations);


		return "createworkout";

	}
	@RequestMapping(path = "updatelocation.do")
	
	public String updateLocation(int id, Model model, @RequestParam(name="woid") Integer woid) {
		
		Location newLocation;
		newLocation = dao.findLocationById(id);
		model.addAttribute("locationid", newLocation.getId());
		model.addAttribute("location", newLocation);
		List<Location> locations = dao.allLocation();
		model.addAttribute("locations", locations);
		model.addAttribute("workout", dao.findWorkoutById(woid));
		
		return "editworkout";
		
	}

	@RequestMapping(path = "newLocation.do")
	public ModelAndView newLocation(@RequestParam("name") String locationName, Address address, ModelAndView mv) {
		Location location = new Location();
		location.setName(locationName);
		address = dao2.createAddress(address);
		location.setAddress(address);
		dao.addLocation(location);
		List<Location> locations = dao.allLocation();
		mv.addObject("locations", locations);
		mv.addObject("location", location);

		mv.setViewName("createworkout");

		return mv;

	}
	
<<<<<<< HEAD
	@RequestMapping(path = "editworkout.do")
	public String editWorkout(HttpSession session, @RequestParam("wid")Integer wid, Model model) {
		Workout workout = dao.findWorkoutById(wid);
		List <Location> locations = dao.allLocation();
		model.addAttribute("locations", locations);
		model.addAttribute("workout", workout);
		
		return"editworkout";
	}
	@RequestMapping(path = "updateworkout.do")
	public String updateWorkout(@RequestParam("workoutdate") String date,
			@RequestParam("activityparam") String name, @RequestParam("workoutid") Integer wid, Workout workoutupdate, HttpSession session, Model model, @RequestParam("locationid") Integer id) {
		User user = (User) session.getAttribute("user");
		Workout workout = dao.findWorkoutById(wid);
		System.err.println(workoutupdate.getTitle());
		Activity activity = dao2.findActivityByName(name);
		LocalDate ld = LocalDate.parse(date);
		workoutupdate.setActivity(activity);
		workoutupdate.setLocation(dao.findLocationById(id));
		workoutupdate.setWorkoutDate(ld);
		Workout newWorkout = dao.UpdateWorkOut(workoutupdate, workout.getId());

		newWorkout.setActivity(activity);

		model.addAttribute("newworkout", newWorkout);

		
		session.setAttribute("user", dao.findById(user.getId()));
		
		return"userhome";
=======
	@RequestMapping(path = "addguesttoworkout.do")
	public String guestJoinWorkout( @RequestParam("workout")String id, HttpSession session) {
		User user1 = (User) session.getAttribute("user");
		Integer id1 = Integer.parseInt(id);
		Workout workout = dao.findWorkoutById(id1);
		workout = dao2.joinWorkout(user1, workout);
//		model.addAttribute(user);
		session.setAttribute("user", dao.findById(id1));
		return "userhome";
		

	}
	

	@RequestMapping(path = "deleteworkout.do")
	public ModelAndView deleteWorkout(int wid, ModelAndView mv, HttpSession session) {
//		int id = workout.getId();
		mv = new ModelAndView();
		if (dao2.deleteWorkout(wid)) {
			mv.setViewName("userhome");
		}
		session.setAttribute("user", dao.findById(((User)session.getAttribute("user")).getId()));

		return mv;

>>>>>>> 6f14891124c2f890bcc7d461d0741f13e29de695
	}

}
