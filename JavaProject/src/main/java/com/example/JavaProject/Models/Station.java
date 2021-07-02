package com.example.JavaProject.Models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "stations")
public class Station {
	@Id
	@GeneratedValue
	private Long id;
	@Size(min = 3, message = "Name must be greater than 3 characters")
	private String name;
	@Size(min = 3, message = "Location must be greater than 3 characters")
	private String location;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	@OneToMany(mappedBy="stations", fetch = FetchType.LAZY)
    private List<Substation> substations;
	public Station() {
		
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
	public List<Substation> getSubstations() {
		return substations;
	}
	public void setSubstations(List<Substation> substations) {
		this.substations = substations;
	}
	public Long getId() {
		return id;
	}
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}
