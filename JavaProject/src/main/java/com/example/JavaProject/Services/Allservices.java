package com.example.JavaProject.Services;

import java.util.List;

import com.example.JavaProject.Models.Station;
import com.example.JavaProject.Repositories.StationRepository;

public class Allservices {
	private StationRepository stationrepo;

	public List<Station> allstation() {
		// TODO Auto-generated method stub
		return stationrepo.findall();
	}

}
