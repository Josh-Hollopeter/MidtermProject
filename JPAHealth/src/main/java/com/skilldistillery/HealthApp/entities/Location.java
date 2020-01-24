package com.skilldistillery.HealthApp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Location {
//FIELD
	@Id
	private int id;

	private String name;

	@Column(name = "address_id")
	private int addressId;

	public int getId() {
		return id;
	}

//CONSTRUCTOR
	public Location() {
	}

	public Location(int id, String name, int addressId) {
		super();
		this.id = id;
		this.name = name;
		this.addressId = addressId;
	}

//METHOD

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + addressId;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Location other = (Location) obj;
		if (addressId != other.addressId)
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "location [id=" + id + ", name=" + name + ", addressId=" + addressId + "]";
	}

}
