package com.example.JavaProject.Controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.JavaProject.Models.Bicycle;
import com.example.JavaProject.Models.Station;
import com.example.JavaProject.Models.Substation;
import com.example.JavaProject.Models.User;
import com.example.JavaProject.Services.Allservices;
import com.example.JavaProject.Services.UserService;
import com.example.JavaProject.Validator.UserValidator;

@Controller
public class Users {

	private UserService userService;
	private UserValidator userValidator;
	private Allservices allservices;

	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "home.jsp";
		}
//		userService.saveUserWithAdminRole(user);
		userService.saveWithUserRole(user);
		return "redirect:/home";
	}

	public Users(UserService userservice, UserValidator uservalidator, Allservices allservices) {
		this.userService = userservice;
		this.userValidator = uservalidator;
		this.allservices = allservices;
	}

	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminPage.jsp";
	}

	@RequestMapping("/admin/users")
	public String adminPageusers(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("users", allservices.allusers());
		return "adminuser.jsp";
	}

	@RequestMapping("/admin/user/delete/{id}")
	public String sdgsre(Principal principal, Model model, @PathVariable("id") Long id) {
		User username = userService.findByid(id);
		userService.delete(username);
		return "redirect:/admin/users";
	}

	@RequestMapping("/admin/bicycle/delete/{id}")
	public String bic(Principal principal, Model model, @PathVariable("id") Long id) {
		Bicycle username = allservices.findBicycleid(id);
		allservices.delete(username);
		return "redirect:/admin/users";
	}

	@RequestMapping("/admin/station/delete/{id}")
	public String sta(Principal principal, Model model, @PathVariable("id") Long id) {
		Station username = allservices.findstationid(id);
		allservices.deletestation(username);
		return "redirect:/admin/users";
	}

	@RequestMapping("/admin/bicycles")
	public String adminPagebicycles(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("users", allservices.allbicycles());
		return "adminbicycle.jsp";
	}

	@RequestMapping("/admin/stations")
	public String adminPagestations(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("users", allservices.allstation());
		return "adminstation.jsp";
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute("user") User user,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}
		return "loginPage.jsp";
	}

	@RequestMapping(value = { "/", "/home" })
	public String home(Principal principal, Model model) {
		// 1
		String username = principal.getName();
		System.out.println(username);
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("locations", allservices.allstation());
		return "home.jsp";
	}

	@RequestMapping("/stations")
	public String stations(Model model) {
		List<Station> stations = allservices.findStations();
		model.addAttribute("stations", stations);
		return "stationsPage.jsp";
	}

	@RequestMapping("/aboutus")
	public String aboutus() {
		return "aboutUs.jsp";
	}

	@RequestMapping("/instation/{id}")
	public String instation(@PathVariable("id") Long id, Principal principal, Model model,
			@ModelAttribute("bike") Bicycle bike, @ModelAttribute("bike1") Bicycle bike1) {

		String username = principal.getName();
		model.addAttribute("user", userService.findByEmail(username));
		System.out.println(username);
		model.addAttribute("station", allservices.findStationById(id));

		return "instation.jsp";
	}

	@RequestMapping("rent/instation/{id}")
	public String rentBike(@PathVariable("id") Long id, Principal principal, Model model,@ModelAttribute("bike") Bicycle bike) {
		
		String username = principal.getName();
		User user1 = userService.findByEmail(username);

		bike.setUser(user1);
		System.out.println(user1);
		
		bike.setSubstation(null);
		allservices.updateBicycle(bike);
		
		return"redirect:/instation/"+ id;

	}
	@RequestMapping("return/instation/{id}")
	public String returnBike(@PathVariable("id") Long id, Principal principal, Model model,@ModelAttribute("bike1") Bicycle bike) {
		
		String username = principal.getName();
		User user1 = userService.findByEmail(username);
		Substation sub = allservices.findSubstationById(bike.getSubstation().getId());
		System.out.println(sub.getId());

		bike.setUser(null);
		bike.setSubstation(sub);
		
		
		allservices.updateBicycle(bike);

		return"redirect:/instation/"+ id;

	}
	/*
	 * @GetMapping("/asd/{id}") public String mohazkel(Model model, @PathVariable
	 * Long id) { User hezkel = userService.findByid(id); model =
	 * model.addAttribute("hezkel", hezkel); model = model.addAttribute("osod",
	 * userService.timerat(hezkel)); return "counter.jsp"; }
	 */
}
