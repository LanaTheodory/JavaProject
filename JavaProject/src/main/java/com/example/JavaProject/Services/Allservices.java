package com.example.JavaProject.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.JavaProject.Models.Bicycle;
import com.example.JavaProject.Models.Role;
import com.example.JavaProject.Models.Station;
import com.example.JavaProject.Models.Substation;
import com.example.JavaProject.Models.User;
import com.example.JavaProject.Repositories.BicycleRepository;
import com.example.JavaProject.Repositories.RoleRepository;
import com.example.JavaProject.Repositories.StationRepository;
import com.example.JavaProject.Repositories.SubstationRepository;
import com.example.JavaProject.Repositories.UserRepository;

@Service
public class Allservices {
	private StationRepository stationrepo;
	private UserRepository userrepo;
	private BicycleRepository bicyclerepo;
	private final SubstationRepository substationRepo;
	private final RoleRepository rolerepo;

	public Allservices(StationRepository stationrepo, UserRepository userrepo, BicycleRepository bicyclerepo,
			SubstationRepository substationRepo, RoleRepository rolerepo) {
		this.stationrepo = stationrepo;
		this.userrepo = userrepo;
		this.bicyclerepo = bicyclerepo;
		this.substationRepo = substationRepo;
		this.rolerepo=rolerepo;
	}

	public List<Station> allstation() {
		// TODO Auto-generated method stub
		return stationrepo.findAll();
	}

	public List<User> allusers() {
		// TODO Auto-generated method stub
		return userrepo.findAll();
	}

	public List<Bicycle> allbicycles() {
		// TODO Auto-generated method stub
		return bicyclerepo.findAll();
	}

	public int timerat(User user) {

		String asd = user.getUpdatedAt().toString();
		String[] hezkel = asd.split(":");
		String nano = hezkel[0];
		int val = Integer.parseInt(nano);

		int asds = user.getthelastupdate();

		int osod = val - asds;
		return osod;

	}

	public Bicycle findBicycleid(Long id) {
		// TODO Auto-generated method stub
		Optional<Bicycle> b = bicyclerepo.findById(id);
		if (b != null)
			return b.get();
		else
			return null;
	}

	public void delete(Bicycle username) {
		// TODO Auto-generated method stub
		bicyclerepo.delete(username);
	}

	public Station findstationid(Long id) {
		// TODO Auto-generated method stub
		Optional<Station> b = stationrepo.findById(id);
		if (b != null)
			return b.get();
		else
			return null;
	}

	public void deletestation(Station username) {
		// TODO Auto-generated method stub
		stationrepo.delete(username);
	}

	public List<Station> findStations() {
		return stationrepo.findAll();
	}

	public Station findStationById(Long id) {
		return stationrepo.findById(id).orElse(null);
	}

	public Substation findSubstationById(Long id) {
		return substationRepo.findById(id).orElse(null);
	}

	public Bicycle updateBicycle(Bicycle bike) {
		return bicyclerepo.save(bike);
	}

	public void editbicycle(Bicycle b, Bicycle editBicycle) {
		// TODO Auto-generated method stub
		b.setType(editBicycle.getType());
		bicyclerepo.save(b);
	}

	public void editstation(Station b, Station editStation) {
		// TODO Auto-generated method stub
		b.setLat(editStation.getLat());
		b.setLng(editStation.getLng());
		b.setLocation(editStation.getLocation());
		b.setName(editStation.getName());
		stationrepo.save(b);
	}

	public List<Role> allroles() {
		// TODO Auto-generated method stub
		return rolerepo.findAll();
	}

	public void deletesubstation(Substation username) {
		// TODO Auto-generated method stub
		substationRepo.delete(username);
	}

	public void editsubstation(Substation b, Substation editSubStation) {
		// TODO Auto-generated method stub
		b.setName(editSubStation.getName());
		b.setStation(editSubStation.getStation());
		substationRepo.save(b);
	}

	public void createbicycle(Bicycle newBicycle) {
		// TODO Auto-generated method stub
		bicyclerepo.save(newBicycle);
	}

	public void createstation(Station newStation) {
		// TODO Auto-generated method stub
		stationrepo.save(newStation);
		
	}

	public void newsubstation(Substation newSubStation) {
		// TODO Auto-generated method stub
		substationRepo.save(newSubStation);
	}

	public List<Substation> allsubstationsnotempty() {
		
		return substationRepo.findAllByBicycleNull();
	}
	
	public List<Station> allnotnull(){
		return stationrepo.findAllBySubstationsBicycleNotNull();
	}
	
	public List<Station> allnull(){
		return stationrepo.findAllBySubstationsBicycleNull();
	}

}
