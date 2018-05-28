package com.newminiproject.controller;

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

import com.miniproject.xsis.model.Menu;
import com.miniproject.xsis.model.MenuAccess;
import com.miniproject.xsis.model.Role;
import com.miniproject.xsis.service.MenuAccessService;
import com.miniproject.xsis.service.MenuService;
import com.miniproject.xsis.service.RoleService;

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
	@ResponseBody
	public String save(@RequestBody MenuAccess menuAccess) {
		//maService.save(menuAccess);
		return "hello world";
		
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
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody MenuAccess menuAccess) {
		maService.update(menuAccess);
	}
	
}
