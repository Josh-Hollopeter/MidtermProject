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

	public HealthAppDAOImpl() {
		
	}
	public HealthAppDAOImpl(EntityManager em) {
		this.em = em;
	}
	@Override
	public Workout searchByActivity(String activity) {
		String query = "select w from Workout w where w.activity.title=:title";

		Workout workout=new Workout();
		workout = em.createQuery(query, Workout.class).setParameter("title", activity).getSingleResult();

		return workout;
	}

	@Override
	public Workout CreateWorkOut(Workout workout) {
		
		em.persist(workout);

		em.flush();

		return workout;		
	}

	@Override
	public Workout UpdateWorkOut(Workout workout, int id) {
		Workout workoutToChangeFromDB = em.find(Workout.class, id);
		
		workoutToChangeFromDB.setTitle(workout.getTitle());
		workoutToChangeFromDB.setActivity(workout.getActivity());;
		workoutToChangeFromDB.setCreatorId(workout.getCreatorId());
		workoutToChangeFromDB.setDescription(workout.getDescription());
		workoutToChangeFromDB.setLocation(workout.getLocation());
		workoutToChangeFromDB.setPostdate(workout.getPostdate());
		workoutToChangeFromDB.setUser(workout.getUser());
		workoutToChangeFromDB.setWorkoutDate(workout.getWorkoutDate());
		workoutToChangeFromDB.setActive(workout.isActive());
		
		em.flush();
		
		return workoutToChangeFromDB;
	}

	@Override
	public boolean deletWorkout(Integer id) {
		
		Workout workout = em.find(Workout.class, id);
		em.remove(workout);
		
		boolean status = !em.contains(workout);
		
		return status;

	}

	@Override
	public List<Workout> findAll() {
		String jpql = "SELECT workout FROM Workout workout";
		List<Workout> results = em.createQuery(jpql, Workout.class).getResultList();
		return results;
	}

}
