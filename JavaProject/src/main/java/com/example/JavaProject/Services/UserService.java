package com.example.JavaProject.Services;


import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.JavaProject.Models.Station;
import com.example.JavaProject.Models.User;
import com.example.JavaProject.Repositories.RoleRepository;
import com.example.JavaProject.Repositories.UserRepository;


@Service
public class UserService {
	 private UserRepository userRepository;
	    private RoleRepository roleRepository;
	    private BCryptPasswordEncoder bCryptPasswordEncoder;
	    
	    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
	        this.userRepository = userRepository;
	        this.roleRepository = roleRepository;
	        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	    }
	    
	    
	    // 1
	    public void saveWithUserRole(User user) {
	        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setRoles(roleRepository.findByName("ROLE_USER"));
	        userRepository.save(user);
	    }
	     
	     // 2 
	    public void saveUserWithAdminRole(User user) {
	        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
	        userRepository.save(user);
	    }    
	    
	    // 3
	    public User findByUsername(String username) {
	        return userRepository.findByUsername(username);
	    }
	    public User findByid(Long id) {
	    	Optional<User> s = userRepository.findById(id);
	    	if(s!=null) return s.get();
	    	else return null;
	    }


		public void delete(User username) {
			// TODO Auto-generated method stub
			userRepository.delete(username);
		}


		public User findByEmail(String username) {
	        return userRepository.findByEmail(username);
	    }

		 public User updateUser(User user) {
			 return userRepository.save(user);
		 }
		 




		public void edituser(User b, User editUser) {
			// TODO Auto-generated method stub
			b.setAge(editUser.getAge());
			b.setEmail(editUser.getEmail());
			b.setFirstname(editUser.getFirstname());
			b.setLastname(editUser.getLastname());
			b.setPassword(editUser.getPassword());
			b.setRoles(editUser.getRoles());
			b.setUsername(editUser.getUsername());
			userRepository.save(b);
		}



}
