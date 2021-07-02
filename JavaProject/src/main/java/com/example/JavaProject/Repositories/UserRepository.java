package com.example.JavaProject.Repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.JavaProject.Models.User;


@Repository
public interface UserRepository extends CrudRepository<User, Long>  {
	User findByUsername(String username);
}
