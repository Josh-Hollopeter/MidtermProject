package com.skilldistillery.HealthApp.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.HealthApp.data.HealthAppDAO;
import com.skilldistillery.HealthApp.entities.Activity;
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
	public String workoutSearchMapToButton(HttpSession session, User user, Workout workout, Activity activity){
		if(workout == null) {
			return "noresults";
		}else {
			List<Workout> workout1 = dao.searchByActivity("activity");
			session.setAttribute("workout", workout1);
			return "workoutsearchresult";
		}
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
	}
	
	
//}
