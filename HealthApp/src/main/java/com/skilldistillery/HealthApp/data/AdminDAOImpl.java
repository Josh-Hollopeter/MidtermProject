package com.skilldistillery.HealthApp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HealthApp.entities.Activity;
import com.skilldistillery.HealthApp.entities.Address;
import com.skilldistillery.HealthApp.entities.User;

@Service
@Transactional
public class AdminDAOImpl implements AdminDAO {

	@PersistenceContext
	public EntityManager em;

	public AdminDAOImpl() {

	}

	public AdminDAOImpl(EntityManager em) {
		this.em = em;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);

		em.flush();

		return user;
	}

	@Override
	public Address createAddress(Address address) {

		em.persist(address);

		em.flush();

		return address;
	}

	@Override
	public boolean deletedUser(Integer id) {
		User user;
		user = em.find(User.class, id);
		user.setActive(false);
		boolean status = !user.getActive();
		return status;
	}

	@Override
	public User updateUser(Integer id, User newUser) {
		User user;
		user = em.find(User.class, id);
		user.setBirthDate(newUser.getBirthDate());
		user.setEmail(newUser.getEmail());
		user.setFirstName(newUser.getFirstName());
		user.setLastName(newUser.getLastName());
		user.setGender(newUser.getGender());
		em.flush();
		return user;
	}

	@Override
	public Address updateAddress(Address newAddress, Integer id) {
		Address address;
		address = em.find(Address.class, id);
		address.setCity(newAddress.getCity());
		address.setState(newAddress.getState());
		address.setStreet(newAddress.getStreet());
		address.setZip(newAddress.getZip());
		em.flush();
		return address;
	}

	@Override
	public Activity findActivityByName(String name) {
		String query = "select a from Activity a where a.title=:name";
		Activity activity;
		activity = em.createQuery(query, Activity.class).setParameter("name", name).getSingleResult();

		return activity;
	}

}
