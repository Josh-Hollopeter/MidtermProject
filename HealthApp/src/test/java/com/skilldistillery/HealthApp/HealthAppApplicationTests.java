package com.skilldistillery.HealthApp;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.HealthApp.data.HealthAppDAOImpl;

@SpringBootTest
class HealthAppApplicationTests {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("HealthDb");
	EntityManager em = emf.createEntityManager();
	HealthAppDAOImpl happ = new HealthAppDAOImpl(em);

	@Test
	void searchTest() {
		assertEquals("Freinds punching each other in the face. Is fun?",
				happ.searchByActivity("Boxing").getDescription());

	}

}
