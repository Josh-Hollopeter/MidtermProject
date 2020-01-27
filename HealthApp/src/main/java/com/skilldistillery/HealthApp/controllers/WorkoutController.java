package com.skilldistillery.HealthApp.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import com.skilldistillery.HealthApp.data.HealthAppDAO;
import com.skilldistillery.HealthApp.entities.Activity;
import com.skilldistillery.HealthApp.entities.Location;
import com.skilldistillery.HealthApp.entities.User;
import com.skilldistillery.HealthApp.entities.Workout;

@Controller
public class WorkoutController {

	@Autowired
	HealthAppDAO dao;
	
	@RequestMapping(path = "workoutbyid.do")
	public String workoutSearchById(HttpSession session, User user, Integer id) {
		Workout workout = dao.findWorkoutById(id);
		session.setAttribute("workout", workout);
		return "workoutsearchresult";
		
	}
	
	@RequestMapping(path = "workoutsearchresults.do")
	public String workoutSearchMapToButton(HttpSession session, User user, Workout workout, Activity activity, @RequestParam("searchterm") String search,Model model){
		
			List<Workout> workout1 = dao.searchByActivity(search);
			model.addAttribute("workouts", workout1);
			System.err.println(workout1);
			return "workoutsearchresult";
		
	}
	
	@RequestMapping(path = "workoutlistallresults.do")
	public String workoutListAllMapToButton(HttpSession session, User user, Workout workout, Activity activity){
//		if(workout == null) {
//			return "error";
//		}else {
			List<Workout>workout1 = dao.findAll();
			session.setAttribute("workout", workout1);
			return "workoutshowallresult";
		}
	@RequestMapping (path="newworkout.do")
	public ModelAndView createNewWorkout(Workout workout, HttpSession session ,ModelAndView mv) {
		mv=new ModelAndView();
		
		Workout newWorkout=dao.CreateWorkOut(workout);
		
		mv.addObject("newworkout",newWorkout);
		
		mv.setViewName("userhome");
		
		return mv;
	}
	
	@RequestMapping (path="locationchoice.do")
	
	public String chooseLocation (int id, Model model) {
		 
		Location newLocation;
		newLocation=dao.findLocationById(id);
		
		
		
		model.addAttribute("location", newLocation);
		
		return "createworkout";
	
	
	
	
	}
	
	
}
