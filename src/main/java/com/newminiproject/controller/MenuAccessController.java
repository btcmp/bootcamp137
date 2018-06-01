package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.newminiproject.model.Menu;
import com.newminiproject.model.MenuAccess;
import com.newminiproject.model.Role;
import com.newminiproject.service.MenuAccessService;
import com.newminiproject.service.MenuService;
import com.newminiproject.service.RoleService;

@Controller
@RequestMapping("/menu_access")
public class MenuAccessController {

	@Autowired
	MenuAccessService maService;
	
	@Autowired
	MenuService menuService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping
	public String index(Model model) {
		List<MenuAccess> listMA= maService.getAllMenuAccess();
		List<Menu> listMenu= menuService.getAllMenu();
		List<Role> listRole= roleService.getAllRole();
		model.addAttribute("listMenuAccess",listMA);
		model.addAttribute("listMenu", listMenu);
		model.addAttribute("listRole", listRole);
		return "menu_access";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody MenuAccess menuAccess) {
		maService.save(menuAccess);
		
	}
	
	@RequestMapping(value="/getall", method=RequestMethod.GET)
	@ResponseBody()
	public List<MenuAccess> getAllMenuAccess(){
		List<MenuAccess> listMA= maService.getAllMenuAccess();
		return listMA;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		MenuAccess menuAccess= new MenuAccess();
		menuAccess.setId(id);
		maService.delete(menuAccess);
		return "redirect:/menu_access";
	}
	
	@ResponseBody
	@RequestMapping(value="/getmenuaccess", method=RequestMethod.GET)
	public MenuAccess getMenuAccess(@RequestParam(value="id", required=false) int id) {
		return maService.getMenuAccessById(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody MenuAccess menuAccess) {
		maService.update(menuAccess);
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="maCreatedBy",defaultValue="")String createdBy,@RequestParam(value="maCreatedDate",defaultValue="")String createdDate) throws ParseException {
		
		Date createdDateDual = null;
		if(!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("yy-MM-dddd").parse(createdDate);
		}
		MenuAccess menuAccess = new MenuAccess();
		menuAccess.setCreatedDate(createdDateDual);
		menuAccess.setCreatedBy(createdBy);
		List<MenuAccess> listMenuAccess = maService.getAllMenuAccess();
		List<MenuAccess> listMenuAccessFilter = maService.search(menuAccess);
		model.addAttribute("listMenuAccess", listMenuAccessFilter);
		model.addAttribute("listMenuAccessComponent", listMenuAccess);
		
		return "menu_access";
	}
}
