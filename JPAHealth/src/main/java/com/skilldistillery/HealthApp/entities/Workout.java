package com.skilldistillery.HealthApp.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Workout {
//FIELD
	@Id
	private int Id;

//CONSTRUCTOR
	public Workout() {

	}

//	public Workout(int id, int creatorId, LocalDate workoutDate, String titel, String description,
//			LocalDateTime postday, boolean active, int activityId, int locationId) {
//		super();
//		Id = id;
//		this.user = creatorId;
//		this.workoutDate = workoutDate;
//		this.title = titel;
//		this.description = description;
//		this.postday = postday;
//		this.active = active;
//		this.activityId = activityId;
//		this.locationId = locationId;
//	}
	@ManyToOne
	@JoinColumn(name = "activity_id")
	private Activity activity;
	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;

	@Column(name = "workout_date")
	private LocalDate workoutDate;

	private String title;

	private String description;

	@Column(name = "post_date")
	private LocalDateTime postday;

	private boolean active;


	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@ManyToMany(mappedBy="guestWorkouts")
	private List<User> users;
	
//METHOD

	@Override
	public String toString() {
		return "Workout [Id=" + Id + ", activity=" + activity + ", user=" + user + ", workoutDate=" + workoutDate
				+ ", title=" + title + ", description=" + description + ", postday=" + postday + ", active=" + active
				+ ", location=" + location + ", users=" + users + "]";
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public User getCreatorId() {
		return user;
	}

	public void setCreatorId(User user) {
		this.user = user;
	}

	public LocalDate getWorkoutDate() {
		return workoutDate;
	}

	public void setWorkoutDate(LocalDate workoutDate) {
		this.workoutDate = workoutDate;
	}

	public String getTitel() {
		return title;
	}

	public void setTitel(String titel) {
		this.title = titel;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getPostday() {
		return postday;
	}

	public void setPostday(LocalDateTime postday) {
		this.postday = postday;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}



	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}


	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Id;
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
		Workout other = (Workout) obj;
		if (Id != other.Id)
			return false;
		return true;
	}

	


}
