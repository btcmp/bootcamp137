package com.newminiproject.controller;

import java.security.Principal;
import java.security.acl.Group;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.security.auth.Subject;
import javax.servlet.http.HttpSession;
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

import com.newminiproject.dao.GenerateCodeDate;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.model.User;
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
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	public String index(Model model) throws Exception {
		
		List<Event> listEvent = eventService.getAll();
		List<Employee> listEmployee = employeeService.getAll();
		model.addAttribute("listEmployee",listEmployee);
		model.addAttribute("listEvent", listEvent);
		String hasil = generateCodeDate.addSeq();
		model.addAttribute("hasil", hasil);
		return "event";
	}
	
	
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody Event event) {
		User user = (User)httpSession.getAttribute("app-user");
		event.setRequestBy(user.getmEmployeeId());
		//System.out.println("tes inputan"+user.getmEmployeeId());
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
	
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="tcodeSearch", defaultValue="")String tcodeSearch, @RequestParam(value="requestSearch", defaultValue="") String requestSearch, @RequestParam(value="requestDateSearch", defaultValue="") String requestDateSearch, @RequestParam(value="dueDateSearch", defaultValue="") String dueDateSearch, @RequestParam(value="createdSearch", defaultValue="") String createdSearch, @RequestParam(value="createdBysearch", defaultValue="") String createdBysearch, @RequestParam(value="statusSearch", defaultValue="") String statusSearch) throws ParseException {
		System.out.println("Role Name: "+tcodeSearch);//string
		System.out.println("Role Code: "+requestSearch);//string
		System.out.println("Created By: "+requestDateSearch);//date 1
		System.out.println("Created Date:"+dueDateSearch);//date 2
		System.out.println("statusSearch By: "+statusSearch);//status
		System.out.println("createdSearch :"+createdSearch);//date 3
		System.out.println("createdBysearch :"+createdBysearch);//string
		//1
		Date requestDateSearchParsing = null;
		if(!requestDateSearch.equals("")) {
			requestDateSearchParsing = new SimpleDateFormat("yyyy-MM-dd").parse(requestDateSearch);
		}
		//2
		Date dueDateSearchParsing = null;
		if(!dueDateSearch.equals("")) {
			dueDateSearchParsing = new SimpleDateFormat("yyyy-MM-dd").parse(dueDateSearch);
		}
		//3
		Date createdSearchParsing = null;
		if(!createdSearch.equals("")) {
			createdSearchParsing = new SimpleDateFormat("yyyy-MM-dd").parse(createdSearch);
		}
		
		
		
		if(tcodeSearch.equals("")&&requestSearch.equals("")&&requestDateSearch.equals("")&&dueDateSearch.equals("")&&statusSearch.equals("")&&createdSearch.equals("")&&createdBysearch.equals("")) {
			eventService.getAll();
		}
		int a=0;
		if(statusSearch=="Submited") {
			a=1;
		}else if(statusSearch=="Rejected") {
			a=0;
		}else if(statusSearch=="In Progress") {
			a=2;
		}else if(statusSearch=="Done") {
			a=3;
		}
		System.out.println("a :"+a);//string
		
		
		Event event = new Event();
		event.setCode(tcodeSearch);
		//event.setRequestBy(requestBy);
		event.setRequestDate(requestDateSearchParsing);
		event.setEndDate(dueDateSearchParsing);
		event.setStatus(a);
		event.setCreateDate(createdSearchParsing);
		event.setCreateBy(createdBysearch);
		List<Event> listEventFilter = eventService.search(event);
		model.addAttribute("listEvent",listEventFilter);
		String hasil = generateCodeDate.addSeq();
		model.addAttribute("hasil", hasil); 
		
		return "event";
	}

	
}

