package com.example.JavaProject.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.JavaProject.Models.Substation;
@Repository
public interface SubstationRepository extends CrudRepository<Substation, Long> {
	
	List<Substation> findAll();

	List<Substation> findAllByBicycleNull();

}
