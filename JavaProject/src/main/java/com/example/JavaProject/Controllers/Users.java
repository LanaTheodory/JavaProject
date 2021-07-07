package com.example.JavaProject.Controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
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
			return "loginPage.jsp";
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
		return "redirect:/admin/bicycles";
	}

	@RequestMapping("/admin/station/delete/{id}")
	public String sta(Principal principal, Model model, @PathVariable("id") Long id) {
		Station username = allservices.findstationid(id);
		allservices.deletestation(username);
		return "redirect:/admin/stations";
	}

	@RequestMapping("/admin/substation/delete/{ids}/{id}")
	public String sub(Principal principal, Model model, @PathVariable("id") Long id, @PathVariable("ids") Long ids) {
		Substation username = allservices.findSubstationById(id);
		allservices.deletesubstation(username);
		return "redirect:/admin/substations/" + ids;
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

	@RequestMapping("/admin/substations/{id}")
	public String adminPagestations(Principal principal, Model model, @PathVariable("id") Long id) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("station", allservices.findStationById(id));

		model.addAttribute("substations", allservices.findStationById(id).getSubstations());
		return "adminsubstations.jsp";
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
		/*
		 * String username = principal.getName(); System.out.println(username);
		 * model.addAttribute("currentUser", userService.findByUsername(username));
		 */
		model.addAttribute("stations", allservices.allnotnull());
		model.addAttribute("station", allservices.allnull());
		model.addAttribute("locations", allservices.allstation());
		return "home.jsp";
	}

	@RequestMapping("/stations")
	public String stations(Model model, Principal principal) {
		List<Station> stations = allservices.findStations();
		model.addAttribute("stations", stations);
		String username = principal.getName();
		model.addAttribute("user", userService.findByUsername(username));
		return "stationsPage.jsp";
	}

	@RequestMapping("/aboutus")
	public String aboutus(Model model, Principal principal) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "aboutUs.jsp";
	}

	@RequestMapping("/instation/{id}")
	public String instation(@PathVariable("id") Long id, Principal principal, Model model,
			@ModelAttribute("bike") Bicycle bike, @ModelAttribute("bike1") Bicycle bike1) {


		String username = principal.getName();
		System.out.println(username + "vbvbvbvbvbvbvbvbvbvbvbbvvbbvbvbvbvbvb");
		model.addAttribute("user", userService.findByUsername(username));
		System.out.println(username);

		model.addAttribute("station", allservices.findStationById(id));

		return "instation.jsp";
	}


	@RequestMapping("rent/instation/{id}")
	public String rentBike(@PathVariable("id") Long id, Principal principal, Model model,@ModelAttribute("bike") Bicycle bike) {
		
		String email = principal.getName();
		User user1 = userService.findByUsername(email);
        System.out.println(bike.getId() + "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
		System.out.println(user1.getBicycle() + "sssssssssssssssssssssssssssssssssssssssss");
		
		
		bike.setUsers(user1);
		user1.setAge(user1.getAge());
		user1.setCreatedAt(user1.getCreatedAt());
		user1.setCurrent(user1.getCurrent());
		user1.setEmail(user1.getEmail());
		user1.setFirstname(user1.getFirstname());
		user1.setId(user1.getId());
		user1.setLastname(user1.getLastname());
		user1.setPassword(user1.getPassword());
		user1.setRoles(user1.getRoles());
		user1.setTotal(user1.getTotal());
		user1.setUpdatedAt(user1.getUpdatedAt());
		user1.setUsername(user1.getUsername());
		user1.setBonus(user1.getBonus());
		
		user1.setTotalmin(user1.getTotalmin());
		
		user1.setBicycle(bike);
		userService.updateUser(user1);
		
		System.out.println(user1.getBicycle().getId() + "sssssssssssssssssssssssssssssssssssssssss");
		System.out.println(bike.getUsers() + "aaaaaaaaaaaaaa");
		System.out.println(bike.getSubstations().getId());
		
		
		bike.setSubstations(null);
		
		
		System.out.println(bike.getSubstations());
		
		
		allservices.updateBicycle(bike);
		
		return"redirect:/instation/"+ id;

	}




	@RequestMapping("return/instation/{id}")
	public String returnBike(@PathVariable("id") Long id, Principal principal, Model model,
			@ModelAttribute("bike1") Bicycle bike) {


		String username = principal.getName();
		User user1 = userService.findByUsername(username);
		System.out.println(username);
		
		Bicycle bicycle = allservices.findBicycleid(bike1.getId());
		Substation sub = allservices.findSubstationById(bike1.getSubstations().getId());
		bike1.setUsers(null);
		bike1.setSubstations(sub);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("mm");
		


		
		Date firstUpdatedAt = bicycle.getUpdatedAt();
		System.out.println(firstUpdatedAt + "1111111111111111111111111111111111111111111111");
		allservices.updateBicycle(bike1);
		Date lastUpdatedAt = bicycle.getUpdatedAt();
		System.out.println(lastUpdatedAt + "22222222222222222222222222222222222222222222222222");
		
		int newdate =  dateFormat.format(lastUpdatedAt).compareTo(dateFormat.format(firstUpdatedAt));
		
		
		user1.setCurrent(newdate);
		user1.setAge(user1.getAge());
		user1.setCreatedAt(user1.getCreatedAt());
		
		user1.setEmail(user1.getEmail());
		user1.setFirstname(user1.getFirstname());
		user1.setId(user1.getId());
		user1.setLastname(user1.getLastname());
		user1.setPassword(user1.getPassword());
		user1.setRoles(user1.getRoles());
		user1.count();
		user1.setTotal(user1.getTotal());
		user1.setBonus(user1.getBonus());
		user1.setUpdatedAt(user1.getUpdatedAt());
		user1.setUsername(user1.getUsername());
		
		user1.setTotalmin(user1.getTotalmin()+ newdate);
		
		user1.setBicycle(null);
		userService.updateUser(user1);
		System.out.println(user1.getTotal());
		System.out.println(newdate + "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");

			
		return"redirect:/instation/"+ id;

	}
	
	@GetMapping("/account/{id}")
	public String mohazkel(Model model, @PathVariable Long id) {
		User hezkel = userService.findByid(id);
		model.addAttribute("hezkel", hezkel); 
		model.addAttribute("osod", hezkel.getCurrent());
		int bonus = hezkel.getBonus();
		int totalmin = hezkel.getTotalmin();
		
			hezkel.setBonus(bonus =totalmin %2);
			userService.updateUser(hezkel);
		
		
	
		return "counter.jsp"; }
	 
=======
		bike.setUser(null);
		bike.setSubstation(sub);

		allservices.updateBicycle(bike);

		return "redirect:/instation/" + id;

	}

	/*
	 * @GetMapping("/asd/{id}") public String mohazkel(Model model, @PathVariable
	 * Long id) { User hezkel = userService.findByid(id); model =
	 * model.addAttribute("hezkel", hezkel); model = model.addAttribute("osod",
	 * userService.timerat(hezkel)); return "counter.jsp"; }
	 */
	@GetMapping("/admin/bicycles/edit/{id}")
	public String adminPageeditbicycles(Principal principal, Model model,
			@ModelAttribute("editBicycle") Bicycle editBicycle, BindingResult result, @PathVariable("id") Long id) {
		Bicycle b = allservices.findBicycleid(id);
		model.addAttribute("bicycle", b);
		return "admineditbicycle.jsp";
	}

	@PostMapping("/admin/bicycles/edit/{id}")
	public String adminPageeditbicycles(Principal principal, @ModelAttribute("editBicycle") Bicycle editBicycle,
			BindingResult result, @PathVariable("id") Long id) {
		if (result.hasErrors())
			return "admineditbicycle.jsp";
		Bicycle b = allservices.findBicycleid(id);
		allservices.editbicycle(b, editBicycle);
		return "redirect:/admin/bicycles";
	}

	@GetMapping("/admin/stations/edit/{id}")
	public String adminPageeditstations(Principal principal, Model model,
			@ModelAttribute("editStation") Station editStation, BindingResult result, @PathVariable("id") Long id) {
		Station b = allservices.findStationById(id);
		model.addAttribute("station", b);
		return "admineditstation.jsp";
	}

	@PostMapping("/admin/stations/edit/{id}")
	public String adminPageeditsatations(Principal principal, @ModelAttribute("editStation") Station editStation,
			BindingResult result, @PathVariable("id") Long id) {
		if (result.hasErrors())
			return "admineditstation.jsp";
		Station b = allservices.findStationById(id);
		allservices.editstation(b, editStation);
		return "redirect:/admin/stations";
	}

	@GetMapping("/admin/user/edit/{id}")
	public String adminPageedituser(Principal principal, Model model, @ModelAttribute("editUser") User editUser,
			BindingResult result, @PathVariable("id") Long id) {
		User b = userService.findByid(id);
		model.addAttribute("user", b);
		model.addAttribute("roll", allservices.allroles());
		return "adminedituser.jsp";
	}

	@PostMapping("/admin/user/edit/{id}")
	public String adminPageedituser(Principal principal, @ModelAttribute("editUser") User editUser,
			BindingResult result, @PathVariable("id") Long id) {
		if (result.hasErrors())
			return "adminedituser.jsp";
		User b = userService.findByid(id);
		userService.edituser(b, editUser);
		return "redirect:/admin/users";
	}

	@GetMapping("/admin/substation/edit/{id}")
	public String adminPageeditsubstations(Principal principal, Model model,
			@ModelAttribute("editSubStation") Substation editSubStation, BindingResult result,
			@PathVariable("id") Long id) {
		Substation b = allservices.findSubstationById(id);
		model.addAttribute("roll", allservices.allstation());
		model.addAttribute("substation", b);
		return "admineditsubstation.jsp";
	}

	@PostMapping("/admin/substation/edit/{id}")
	public String adminPageeditsubstations(Principal principal,
			@ModelAttribute("editSubStation") Substation editSubStation, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors())
			return "admineditsubstation.jsp";
		Substation b = allservices.findSubstationById(id);
		Long a = b.getStation().getId();
		allservices.editsubstation(b, editSubStation);
		return "redirect:/admin/substations/" + a;
	}

	@GetMapping("/admin/bicycles/new")
	public String adminPagenewbicycles(Principal principal, Model model,
			@ModelAttribute("newBicycle") Bicycle newBicycle, BindingResult result) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("sub", allservices.allsubstationsnotempty());
		return "adminnewbicycle.jsp";
	}

	@PostMapping("/admin/bicycles/new")
	public String adminPagenewbicycles(Principal principal, @ModelAttribute("newBicycle") Bicycle newBicycle,
			BindingResult result) {
		if (result.hasErrors())
			return "adminnewbicycle.jsp";
		allservices.createbicycle(newBicycle);
		return "redirect:/admin/bicycles";
	}

	@GetMapping("/admin/stations/new")
	public String adminPagenewstations(Principal principal, Model model,
			@ModelAttribute("newStation") Station newStation, BindingResult result) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminnewstation.jsp";
	}

	@PostMapping("/admin/stations/new")
	public String adminPageeditsatations(Principal principal, @ModelAttribute("newStation") Station newStation,
			BindingResult result) {
		if (result.hasErrors())
			return "adminnewstation.jsp";
		allservices.createstation(newStation);
		return "redirect:/admin/stations";
	}

	@GetMapping("/admin/substation/new/{id}")
	public String adminPagenewsubstations(Principal principal, Model model,
			@ModelAttribute("newSubStation") Substation newSubStation, BindingResult result,
			@PathVariable("id") Long id) {
		String username = principal.getName();
		model.addAttribute("station", allservices.findStationById(id));
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminnewsubstation.jsp";
	}

	@PostMapping("/admin/substation/new/{id}")
	public String adminPagenewsubstations(Principal principal,
			@ModelAttribute("newSubStation") Substation newSubStation, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors())
			return "adminnewsubstation.jsp";
		allservices.newsubstation(newSubStation);
		return "redirect:/admin/substations/"+id;
	}

