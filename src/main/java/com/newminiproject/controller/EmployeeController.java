package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.newminiproject.model.Company;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Role;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.User;
import com.newminiproject.service.CompanyService;
import com.newminiproject.service.EmployeeService;




@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	@Autowired
	CompanyService companyService;

	@Autowired
	HttpSession httpSession;//sebuah class di spring security untuk mengambil session
	
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
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="codeSearch", defaultValue="")String codeSearch,@RequestParam(value="nameSearch", defaultValue="") String nameSearch, @RequestParam(value="companySearch", defaultValue="") String companySearch, @RequestParam(value="createdDateSearch", defaultValue="") String createdDateSearch, @RequestParam(value="createdBySearch", defaultValue="") String createdBySearch) throws ParseException {
//		
		Date createdDateDual = null;
		if(!createdDateSearch.equals("")) {
			createdDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(createdDateSearch);
		}
		Employee employee = new Employee();
		

		employee.setCode(codeSearch);
		employee.setFirstName(nameSearch);
		employee.setCreatedBy(createdBySearch);		
		employee.setCreatedDate(createdDateDual);
	//	employee.setmCompanyId(companySearch);
		List<Employee> listEmployee = employeeService.getAll();
		List<Employee> listEmployeeFilter = employeeService.search(employee);
		model.addAttribute("listEmployee", listEmployeeFilter); //isi dari table, milik method getall
		model.addAttribute("listEmployeeComponent", listEmployee); //data yang ingin dicari
		//String result = seqDao.addSeq();
		//System.out.println(result);
		//model.addAttribute("result",result);
		return "list-employee";
	}
}
