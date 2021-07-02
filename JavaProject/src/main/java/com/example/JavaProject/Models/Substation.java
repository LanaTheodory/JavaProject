package com.example.JavaProject.Models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "substations")
public class Substation {
	@Id
	@GeneratedValue
	private Long id;
	@Size(min = 3, message = "Name must be greater than 3 characters")
	private String name;
	@OneToOne(mappedBy="substations", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Bicycle bicycle;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="station_id")
    private Station station;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	public Substation() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Bicycle getBicycle() {
		return bicycle;
	}
	public void setBicycle(Bicycle bicycle) {
		this.bicycle = bicycle;
	}
	public Station getStation() {
		return station;
	}
	public void setStation(Station station) {
		this.station = station;
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
