package com.skilldistillery.HealthApp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
	// F I E L D S

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		
		private String street;
		private String city;
		private String state;
		
		@Column(name = "zip_code")
		private int zip;
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getStreet() {
			return street;
		}

		public void setStreet(String street) {
			this.street = street;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public int getZip() {
			return zip;
		}

		public void setZip(int zip) {
			this.zip = zip;
		}


		// C O N S T R U C T O R S
		
		public Address() {
			super();
		}
		
		
		public Address(int id, String street, String city, String state, int zip) {
			super();
			this.id = id;
			this.street = street;
			this.city = city;
			this.state = state;
			this.zip = zip;
		}



		
		// M E T H O D S
		
		
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((city == null) ? 0 : city.hashCode());
			result = prime * result + id;
			result = prime * result + ((state == null) ? 0 : state.hashCode());
			result = prime * result + ((street == null) ? 0 : street.hashCode());
			result = prime * result + zip;
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
			Address other = (Address) obj;
			if (city == null) {
				if (other.city != null)
					return false;
			} else if (!city.equals(other.city))
				return false;
			if (id != other.id)
				return false;
			if (state == null) {
				if (other.state != null)
					return false;
			} else if (!state.equals(other.state))
				return false;
			if (street == null) {
				if (other.street != null)
					return false;
			} else if (!street.equals(other.street))
				return false;
			if (zip != other.zip)
				return false;
			return true;
		}

}
