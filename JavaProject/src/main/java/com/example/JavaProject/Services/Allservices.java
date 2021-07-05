package com.example.JavaProject.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.JavaProject.Models.Bicycle;
import com.example.JavaProject.Models.Station;
import com.example.JavaProject.Models.Substation;
import com.example.JavaProject.Models.User;
import com.example.JavaProject.Repositories.BicycleRepository;
import com.example.JavaProject.Repositories.StationRepository;
import com.example.JavaProject.Repositories.SubstationRepository;
import com.example.JavaProject.Repositories.UserRepository;
@Service
public class Allservices {
	private StationRepository stationrepo;
	private UserRepository userrepo;
	private BicycleRepository bicyclerepo;
	private final SubstationRepository substationRepo;
	
	public Allservices(StationRepository stationrepo, UserRepository userrepo, BicycleRepository bicyclerepo,SubstationRepository substationRepo)     {
        this.stationrepo=stationrepo;
        this.userrepo=userrepo;
        this.bicyclerepo = bicyclerepo;
        this.substationRepo=substationRepo;
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
		if(b != null) return b.get();
		else return null;
	}
	public void delete(Bicycle username) {
		// TODO Auto-generated method stub
		bicyclerepo.delete(username);
	}
	public Station findstationid(Long id) {
		// TODO Auto-generated method stub
		Optional<Station> b = stationrepo.findById(id);
		if(b != null) return b.get();
		else return null;
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


}
