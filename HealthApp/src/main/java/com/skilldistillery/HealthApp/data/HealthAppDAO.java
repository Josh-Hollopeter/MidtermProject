package com.skilldistillery.HealthApp.data;

import java.util.List;

import com.skilldistillery.HealthApp.entities.Location;
import com.skilldistillery.HealthApp.entities.User;
import com.skilldistillery.HealthApp.entities.Workout;

public interface HealthAppDAO {
	
	public List <Workout> findAll();
	
	public List <Workout> searchByActivity(String activity);

	public Workout CreateWorkOut(Workout workout);

	public Workout UpdateWorkOut(Workout workout, Integer id);

	public boolean deletWorkout(Integer id);
	
	public List<User> findAllUser();
	
	public User findById(Integer id);
	
	public User findByLogin(String username, String password);

	public List<Location> allLocation();
	
}
