package com.skilldistillery.HealthApp.data;

import java.util.List;

import com.skilldistillery.HealthApp.entities.Activity;
import com.skilldistillery.HealthApp.entities.Address;
import com.skilldistillery.HealthApp.entities.User;
import com.skilldistillery.HealthApp.entities.Workout;

public interface AdminDAO {

	public User createUser(User user);

	public Address createAddress(Address address);

	public boolean deletedUser(Integer id);
	public boolean retrieveUser(Integer id);

	public User updateUser(Integer id, User user);

	public Address updateAddress(Address address, Integer id);

	public Activity findActivityByName(String name);
	

	public Workout joinWorkout(User user, Workout workout);

	public boolean deleteWorkout(int id);
	
	public Workout deleteWorkout2(int id);
	
	public List<User> showAllUser();


}
