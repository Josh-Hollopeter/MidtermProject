package com.skilldistillery.HealthApp.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	
	@Column(name = "first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	private Boolean active;
	private String role;
	private Integer age;
	private String email;
	private String gender;
	
	@Column(name = "address_id")
	private Integer addressId;
	
//	@ManyToMany
//	@JoinTable(name="user_workout",
//	joinColumns=@JoinColumn(name="user_id"),
//	inverseJoinColumns=@JoinColumn(name="workout_id"))
//	private List<Workout> workouts;
//	
	
	public User() {
		super();
	}
	public User(int id, String username, String password, Boolean active, String role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.active = active;
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
