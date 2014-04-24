package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EventModel")
public class EventModel {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;
	private String location;
	private String date;
	private String email;
	
	@Column(name = "guestEvent")
	private boolean guestEvent;
	
	@Column(name = "approved")
	public boolean approved = false;

	private String description;
	
	public EventModel() {}
	
	public EventModel(final String name) {
		this.name = name;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return this.id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isGuestEvent() {
		return guestEvent;
	}

	public void setGuestEvent(boolean guestEvent) {
		this.guestEvent = guestEvent;
	}

	public boolean isApproved() {
		return approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}
	
	
	
}
