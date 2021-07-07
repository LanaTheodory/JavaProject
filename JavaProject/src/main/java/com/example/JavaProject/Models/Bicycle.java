package com.example.JavaProject.Models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "bicycles")
public class Bicycle {
	@Id
	@GeneratedValue
	private Long id;
	@Size(min = 3, message = "First name must be greater than 3 characters")
	private String type;
	@OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User users;
	@OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="substation_id")
    private Substation substations;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	public Bicycle() {
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public User getUsers() {
		return users;
	}
	public void setUsers(User user) {
		this.users = user;
	}
	public Substation getSubstations() {
		return substations;
	}
	public void setSubstations(Substation substation) {
		this.substations = substation;
	}
	public Long getId() {
		return id;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public void setId(Long id) {
		this.id = id;
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
