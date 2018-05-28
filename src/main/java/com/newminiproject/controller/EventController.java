package com.newminiproject.controller;

import java.security.Principal;
import java.security.acl.Group;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.security.auth.Subject;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.newminiproject.dao.GenerateCodeDate;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.service.EmployeeService;
import com.newminiproject.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;
	
	@Autowired
	GenerateCodeDate generateCodeDate;
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping
	public String index(Model model) throws Exception {
		
		List<Event> listEvent = eventService.getAll();
		List<Employee> listEmployee = employeeService.getAll();
		model.addAttribute("listEmployee",listEmployee);
		model.addAttribute("listEvent", listEvent);
		String hasil = generateCodeDate.addSeq();
		model.addAttribute("hasil", hasil);
		return"event";
	}
	
	
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody Event event) {
		eventService.save(event);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		Event event = new Event();
		event.setId(id);
		eventService.delete(event);
		return "redirect:/event";
	}
	
	@ResponseBody
	@RequestMapping(value="/getevent/{id}")
	public Event getEventById(@PathVariable int id) {
		Event event = eventService.getEventById(id);
		return event;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Event event) {
		eventService.update(event);
		
	}
	
	@RequestMapping(value="/updatecls", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void updatecls(@RequestBody Event event) {
		eventService.updatecls(event);
		
		
	}
	
	@RequestMapping(value="/rejected", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void rejected(@RequestBody Event event) {
		eventService.rejected(event);
	}
	
	@RequestMapping(value="/aprove", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void aprove(@RequestBody Event event) {
		eventService.aprove(event);
		
	}

	
}

