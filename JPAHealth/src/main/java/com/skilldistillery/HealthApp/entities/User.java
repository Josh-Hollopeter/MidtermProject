package com.skilldistillery.HealthApp.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

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
	private String email;
	private String gender;
	private String photo;
	
	
	@Column(name="birth_date")
	private LocalDate birthDate;

	@Column(name="create_date")
	private LocalDate createDate;
	
	@ManyToMany(fetch = FetchType.EAGER )
	@JoinTable(name="user_workout",
	joinColumns=@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="workout_id"))
	private List<Workout> guestWorkouts;
	
	@OneToMany(mappedBy="user", fetch = FetchType.EAGER )
	private List<Workout> workouts;
	
	
	public List<Workout> getGuestWorkouts() {
		return guestWorkouts;
	}
	public void setGuestWorkouts(List<Workout> guestWorkouts) {
		this.guestWorkouts = guestWorkouts;
	}
	
	public void addWorkout(Workout workout) {
		if (this.workouts == null) {
			workouts = new ArrayList<>();
		}
		
		if(!workouts.contains(workout)) {
			workouts.add(workout);
			workout.setCreatorId(this);
		}
	}
	
	public void removeWorkout(Workout workout) {
		if(workouts != null && workouts.contains(workout)) {
			workouts.remove(workout);
			workout.setCreatorId(this);
		}
	}
	
	
	public void addGuestWorkout(Workout workout) {
		if (this.guestWorkouts == null) {
			guestWorkouts = new ArrayList<>();
		}
		
		if(!guestWorkouts.contains(workout)) {
			guestWorkouts.add(workout);
			workout.addGuest(this);
		}
	}
	
	public void removeGuestWorkout(Workout workout) {
		if(guestWorkouts != null && guestWorkouts.contains(workout)) {
			guestWorkouts.remove(workout);
			workout.removeGuest(this);
			
		}
	}
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
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public LocalDate getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}
	public LocalDate getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}
	public List<Workout> getWorkouts() {
		return workouts;
	}
	public void setWorkouts(List<Workout> workouts) {
		this.workouts = workouts;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", active=" + active + ", role=" + role + ", email=" + email + ", gender="
				+ gender + ", birthDate=" + birthDate + ", createDate=" + createDate + "]";
	}

	

}
