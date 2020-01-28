package com.skilldistillery.HealthApp.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HealthApp.entities.Location;
import com.skilldistillery.HealthApp.entities.User;
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
	public List<Workout> searchByActivity(String activity) {

		List<Workout> workouts = new ArrayList<>();

		String query = "select w from Workout w where w.activity.title LIKE :title";

		workouts = em.createQuery(query, Workout.class).setParameter("title", "%" + activity + "%").getResultList();

		return workouts;
	}

	@Override
	public Workout CreateWorkOut(Workout workout) {

		workout.setActive(true);
		em.persist(workout);

		em.flush();

		return workout;
	}

	@Override
	public Workout UpdateWorkOut(Workout workout, Integer id) {

		Workout workoutToChangeFromDB = em.find(Workout.class, id);

		workoutToChangeFromDB.setTitle(workout.getTitle());
		workoutToChangeFromDB.setActivity(workout.getActivity());
		workoutToChangeFromDB.setCreatorId(workout.getCreatorId());
		workoutToChangeFromDB.setDescription(workout.getDescription());
		workoutToChangeFromDB.setLocation(workout.getLocation());
		workoutToChangeFromDB.setPostdate(workout.getPostdate());
		workoutToChangeFromDB.setUser(workout.getUser());
		workoutToChangeFromDB.setWorkoutDate(workout.getWorkoutDate());
		workoutToChangeFromDB.setActive(workout.getActive());

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

	@Override
	public List<User> findAllUser() {

		String jpql = "SELECT user FROM User user";

		List<User> results = em.createQuery(jpql, User.class).getResultList();

		return results;
	}

	@Override
	public User findById(Integer id) {

		return em.find(User.class, id);

	}

	@Override
	public User findByLogin(String username, String password) {

		String jpql = "Select user from User user where user.username = :username AND user.password = :password";

		User user;
		try {
			user = em.createQuery(jpql, User.class).setParameter("username", username)
					.setParameter("password", password).getResultList().get(0);
		} catch (IndexOutOfBoundsException e) {
			user = null;
		}

		return user;
	}

	@Override
	public Workout findWorkoutById(Integer id) {

		return em.find(Workout.class, id);

	}

	@Override
	public List<Location> allLocation() {
		String query = "Select l from Location l";
		List<Location> allLocation = em.createQuery(query, Location.class).getResultList();
		return allLocation;
	}

	@Override
	public Location findLocationById(int id) {
		Location location;
		location = em.find(Location.class, id);

		return location;
	}

	@Override
	public Location addLocation(Location location) {
		em.persist(location);
		em.flush();
		return location;
	}

}
