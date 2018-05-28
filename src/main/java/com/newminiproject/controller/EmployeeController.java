package com.newminiproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.newminiproject.model.Company;
import com.newminiproject.model.Employee;
import com.newminiproject.service.CompanyService;
import com.newminiproject.service.EmployeeService;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	@Autowired
	CompanyService companyService;

	@RequestMapping
	public String index(Model model) {
		List<Employee> listEmployee = employeeService.getAll();
		List<Company> listCompany = companyService.getAll();
		model.addAttribute("listEmployee",listEmployee);
		model.addAttribute("listCompany",listCompany);
		return "employee";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody Employee employee) {
		employeeService.save(employee);
		
	}
}
