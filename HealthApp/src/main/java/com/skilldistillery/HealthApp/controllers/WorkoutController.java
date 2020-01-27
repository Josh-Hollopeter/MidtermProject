package com.skilldistillery.HealthApp.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RequestMethod;
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
		return "workoutsearchresult";

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
//		if(workout == null) {
//			return "error";
//		}else {
		List<Workout> workout1 = dao.findAll();
		session.setAttribute("workout", workout1);
		return "workoutshowallresult";
	}

	@RequestMapping(path = "newworkout.do")
	public ModelAndView createNewWorkout(@RequestParam("workoutdate") String date,
			@RequestParam("activity") String name, Workout workout, HttpSession session, ModelAndView mv) {
		mv = new ModelAndView();

		LocalDate ld = LocalDate.parse(date);
		Workout newWorkout = dao.CreateWorkOut(workout);

		Activity activity = dao2.findActivityByName(name);
		newWorkout.setActivity(activity);

		mv.addObject("newworkout", newWorkout);

		mv.setViewName("userhome");

		return mv;
	}

	@RequestMapping(path = "locationchoice.do")

	public String chooseLocation(int id, Model model) {

		Location newLocation;
		newLocation = dao.findLocationById(id);

		model.addAttribute("location", newLocation);

		return "createworkout";

	}

	@RequestMapping(path = "newLocation.do", method = RequestMethod.POST)
	public ModelAndView newLocation(@RequestParam("name") String locationName, Address address, ModelAndView mv) {
		Location location = new Location();
		location.setName(locationName);
		location.setAddress(address);
		dao.addLocation(location);
		List<Location> locations = dao.allLocation();
		mv.addObject("location", locations);
		mv.addObject("location", location);

		mv.setViewName("createworkout");

		return mv;

	}

}
