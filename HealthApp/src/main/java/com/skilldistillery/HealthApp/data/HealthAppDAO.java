package com.skilldistillery.HealthApp.data;

import java.util.List;

import com.skilldistillery.HealthApp.entities.Workout;

public interface HealthAppDAO {
	public List <Workout> findAll();
	
	public Workout searchByActivity(String activity);

	public Workout CreateWorkOut(Workout workout);

	public Workout UpdateWorkOut(Workout workout, int id);

	public void deletWorkout(Workout workout);

	
	
}
