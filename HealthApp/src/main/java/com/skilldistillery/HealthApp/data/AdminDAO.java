package com.skilldistillery.HealthApp.data;

import java.util.List;

import com.skilldistillery.HealthApp.entities.Address;
import com.skilldistillery.HealthApp.entities.User;

public interface AdminDAO {

	public User createUser(User user);

	public Address createAddress(Address address);



	public boolean deletedUser(Integer id);

	public User updateUser(Integer id, User user);

	public Address updateAddress(Address address,Integer id );



}
