package com.newminiproject.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.newminiproject.dao.SeqDaoDesign;
import com.newminiproject.model.Design;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.model.Product;
import com.newminiproject.service.DesignItemService;
import com.newminiproject.service.DesignService;
import com.newminiproject.service.EmployeeService;
import com.newminiproject.service.EventService;
import com.newminiproject.service.ProductService;

@Controller
@RequestMapping("/design")
public class DesignController {

	@Autowired
	DesignService designService;
	
	@Autowired
	DesignItemService designItemService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	SeqDaoDesign seqDao;
	
	@RequestMapping
	public String index(Model model) {
		List<Event> listEvent = eventService.getAll();
		List<Employee> listEmployee = employeeService.getAll();
		List<Design> listDesign = designService.getListDesign();
		List<Product> listProduct = productService.getAllProduct();
		model.addAttribute("listEvent", listEvent);
		model.addAttribute("listEmployee", listEmployee);
		model.addAttribute("listDesign", listDesign);
		model.addAttribute("listProduct", listProduct);
		String hasil = seqDao.addSeq();
		model.addAttribute("hasil", hasil);
//		model.addAttribute("request", seqDao.requestDate());
		return "design";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody												//agar keluar nya data
	public Design save(@RequestBody Design design) {
		designService.save(design);
		return design;
	}
	
	@RequestMapping(value="/getById", method=RequestMethod.GET)
	@ResponseBody												//agar keluar nya data
	public Design getById(@RequestParam(value="id", required=false) int id) {
		Design design = designService.getDesignById(id);
		return design;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public Design update(@RequestBody Design design) {
		designService.update(design);
		return design;
	}
	
	/*@RequestMapping(value="/approved", method=RequestMethod.POST)
	@ResponseBody
	public Design approved(@RequestBody Design design) {
		designService.approved(design);
		return design;
	}*/
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="designCode", defaultValue="")String designCode, @RequestParam(value="requestBy", defaultValue="")String requestBy, @RequestParam(value="requestDate", defaultValue="")String requestDate, @RequestParam(value="assignTo", defaultValue="")String assignTo, @RequestParam(value="status", defaultValue="")String status, @RequestParam(value="createdDate", defaultValue="")String createdDate, @RequestParam(value="createdBy", defaultValue="")String createdBy) throws Exception {
		System.out.println("Design Code : "+designCode);
		System.out.println("Request By : "+requestBy);
		System.out.println("Request Date : "+requestDate);
		System.out.println("Assign To : "+assignTo);
		System.out.println("Status : "+status);
		System.out.println("Created Date : "+createdDate);
		System.out.println("Created By : "+createdBy);
		Date requestDateDual = null;
		if(!requestDate.equals("")) {	//pencarian menggunakan date maka perlu konversi String menjadi date
			requestDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(requestDate);
		}
		Date createdDateDual = null;
		if(!createdDate.equals("")) {	//konversi String menjadi date
			createdDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(createdDate);
		}
		Design design = new Design();
		design.setCode(designCode);
		design.setRequestDate(requestDateDual);
		design.setCreatedDate(createdDateDual);
		List<Design> listDesign = designService.getListDesign();
		List<Design> listDesignFilter = designService.search(design);
		model.addAttribute("listDesign", listDesignFilter); 	//data yang ingin dicari
		model.addAttribute("listDesignComponent", listDesign);	//isi data dari tabel
		String hasil = seqDao.addSeq();
		model.addAttribute("hasil", hasil);
		return "design";
	}
}
