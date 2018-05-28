package com.newminiproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.xsis.model.Company;
import com.miniproject.xsis.model.Employee;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.service.CompanyService;
import com.miniproject.xsis.service.EmployeeService;




@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	@Autowired
	CompanyService companyService;

	@RequestMapping
	public String index(Model model) {
		List<Employee> listEmployee = employeeService.getAll();
		List<Company> listCompany= companyService.getAll();
		model.addAttribute("listEmployee",listEmployee);
		model.addAttribute("listCompany", listCompany);
		return "list-employee";
	}
	
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Employee employee) {
		employeeService.save(employee);
	}
	
	@ResponseBody
	@RequestMapping(value="/getemployee", method=RequestMethod.GET)
	public Employee getEmployee(@RequestParam(value="id", required=false) int id) {
		return  employeeService.getEmployeeById(id);
	}
	
	@RequestMapping(value="/update", method= RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Employee employee) {
		employeeService.update(employee);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@RequestParam(value="id", required=false) int id) {
		employeeService.delete(id);
	}
}
