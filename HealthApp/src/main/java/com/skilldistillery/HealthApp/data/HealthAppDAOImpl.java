package com.skilldistillery.HealthApp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HealthApp.entities.Workout;




@Service
@Transactional
public class HealthAppDAOImpl implements HealthAppDAO {

	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Workout searchByActivity(String activity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Workout CreateWorkOut(Workout workout) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Workout UpdateWorkOut(Workout workout, int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletWorkout(Workout workout) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Workout> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
