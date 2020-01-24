package com.skilldistillery.HealthApp;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.HealthApp.data.HealthAppDAOImpl;
import com.skilldistillery.HealthApp.entities.Workout;

@SpringBootTest
class HealthAppApplicationTests {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("HealthDb");
	EntityManager em = emf.createEntityManager();
	HealthAppDAOImpl happ = new HealthAppDAOImpl(em);
	Workout workout = new Workout();

	@BeforeEach
	void beforeEach() {
		em = emf.createEntityManager();
		new HealthAppDAOImpl(em);
	}

	@Test
	void searchTest() {
		assertEquals("Freinds punching each other in the face. Is fun?",
				happ.searchByActivity("Boxing").get(0).getDescription());

	}

	@Test
	void findAllTest() {
		assertEquals("Boxing", happ.findAll().get(0).getActivity().getTitle());

	}
	
	@Test
	void findAllUserTest() {
		assertEquals(2, happ.findAllUser().size());
		
	}
	
	@Test
	void findUserByIdTest() {
		assertEquals("Mike", happ.findById(2).getFirstName());
		
	}
	@Test
	void findByLoginTest() {
		assertEquals("Tyson", happ.findByLogin("Mike", "Mike").getLastName());
		
	}
}
