package com.skilldistillery.HealthApp.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Workout {
//FIELD
	@Id
	private int Id;

//CONSTRUCTOR
	public Workout() {

	}

	public Workout(int id, int creatorId, LocalDate workoutDate, String titel, String description,
			LocalDateTime postday, boolean active, int activityId, int locationId) {
		super();
		Id = id;
		this.creatorId = creatorId;
		this.workoutDate = workoutDate;
		this.titel = titel;
		this.description = description;
		this.postday = postday;
		this.active = active;
		this.activityId = activityId;
		this.locationId = locationId;
	}

	@Column(name = "creator_id")
	private int creatorId;

	@Column(name = "workout_date")
	private LocalDate workoutDate;

	private String titel;

	private String description;

	@Column(name = "post_day")
	private LocalDateTime postday;

	private boolean active;

	@Column(name = "activity_id")
	private int activityId;

	@Column(name = "location_id")
	private int locationId;

	
//METHOD

	@Override
	public String toString() {
		return "Workout [Id=" + Id + ", creatorId=" + creatorId + ", workoutDate=" + workoutDate + ", titel=" + titel
				+ ", description=" + description + ", postday=" + postday + ", active=" + active + ", activityId="
				+ activityId + ", locationId=" + locationId + "]";
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public LocalDate getWorkoutDate() {
		return workoutDate;
	}

	public void setWorkoutDate(LocalDate workoutDate) {
		this.workoutDate = workoutDate;
	}

	public String getTitel() {
		return titel;
	}

	public void setTitel(String titel) {
		this.titel = titel;
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

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Id;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + activityId;
		result = prime * result + creatorId;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + locationId;
		result = prime * result + ((postday == null) ? 0 : postday.hashCode());
		result = prime * result + ((titel == null) ? 0 : titel.hashCode());
		result = prime * result + ((workoutDate == null) ? 0 : workoutDate.hashCode());
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
		if (active != other.active)
			return false;
		if (activityId != other.activityId)
			return false;
		if (creatorId != other.creatorId)
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (locationId != other.locationId)
			return false;
		if (postday == null) {
			if (other.postday != null)
				return false;
		} else if (!postday.equals(other.postday))
			return false;
		if (titel == null) {
			if (other.titel != null)
				return false;
		} else if (!titel.equals(other.titel))
			return false;
		if (workoutDate == null) {
			if (other.workoutDate != null)
				return false;
		} else if (!workoutDate.equals(other.workoutDate))
			return false;
		return true;
	}
}
