package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.xsis.model.Employee;
import com.miniproject.xsis.model.Role;
import com.miniproject.xsis.model.User;
import com.miniproject.xsis.service.EmployeeService;
import com.miniproject.xsis.service.RoleService;
import com.miniproject.xsis.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	@Autowired
	EmployeeService empService;
	
	@RequestMapping
	public String index(Model model) {
		List<Role> listRole= roleService.getAllRole();
		List<Employee> listEmployee= empService.getAll();
		List<User> listUser= userService.getAll();
		model.addAttribute("listEmployee", listEmployee);
		model.addAttribute("listRole", listRole);
		model.addAttribute("listUser", listUser);
		return "user";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody
	public User save(@Valid @RequestBody User user) {
		userService.save(user);
		return user;
	}
	
	@RequestMapping(value="/getall", method=RequestMethod.GET)
	@ResponseBody
	public List<User> getAllUser(){
		List<User> listUser= userService.getAll();
		return listUser;
	}
	
	@ResponseBody
	@RequestMapping(value="/getuser", method=RequestMethod.GET)
	public User getUser(@RequestParam(value="id", required=false) int id) {
		return userService.getUserById(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody User user) {
		userService.update(user);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		User usr=new User();
		usr.setId(id);
		userService.delete(usr);
		return "redirect:/user";
	}
	
	/*@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="employeename", defaultValue="") String employeeName, @RequestParam(value="rolename", defaultValue="") String roleName, @RequestParam(value="companyname", defaultValue="") String companyName, @RequestParam(value="userName", defaultValue="") String userName, @RequestParam(value="createddate", defaultValue="") String createdDate, @RequestParam(value="createdby", defaultValue="") String createdBy ) throws ParseException {
		System.out.println("Employee Name : "+employeeName);
		System.out.println("Role Name : "+roleName);
		System.out.println("Company Name : "+companyName);
		System.out.println("Username : "+userName);
		System.out.println("Created Date : "+createdDate);
		System.out.println("Created By : "+createdBy);
		Date createdDateDual= null;
		if(!createdDate.equals("")) {
			createdDateDual= new SimpleDateFormat("yyyy-MM-dd").parse(createdDate);
		}
		
		User user= new User();
		user.setmEmployeeId(mEmployeeId);
		return null;
		
	}*/
	
}
