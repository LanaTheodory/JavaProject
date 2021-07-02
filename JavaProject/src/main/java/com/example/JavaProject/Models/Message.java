package com.example.JavaProject.Models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "messages")
public class Message {
	@Id
	@GeneratedValue
	private Long id;
	@Size(min = 3, message = "Title must be greater than 3 characters")
	private String title;
	@Size(min = 100, message = "Content must be greater than 100 characters")
	private String content;
	@Size(min = 3, message = "Name must be greater than 3 characters")
	private String name;
	@Size(min = 3, message = "Email must be greater than 3 characters")
	private String email;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	public Message() {
		
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
