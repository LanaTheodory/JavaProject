package com.example.JavaProject.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.JavaProject.Models.Bicycle;

@Repository
public interface BicycleRepository extends CrudRepository<Bicycle, Long>  {
	List<Bicycle> findAll();
}
