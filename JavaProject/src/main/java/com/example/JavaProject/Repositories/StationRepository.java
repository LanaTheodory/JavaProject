package com.example.JavaProject.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.JavaProject.Models.Station;


@Repository
public interface StationRepository extends CrudRepository<Station, Long>  {
	List<Station> findall();
}
