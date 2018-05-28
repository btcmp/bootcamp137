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

import com.marcomplace.dao.SequenceDaoMenu;
import com.marcomplace.model.Menu;
import com.marcomplace.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@Autowired
	SequenceDaoMenu seqDao;
	
	@RequestMapping
	public String index(Model model) {
		List<Menu> listMenu = menuService.getAllMenu();
		model.addAttribute("listMenu", listMenu);
		model.addAttribute("listMenuComponent", listMenu);
		String result = seqDao.addSeq();
		//System.out.println(result);
		model.addAttribute("result",result);
		return "menu";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="menucode", defaultValue="")String menuCode,@RequestParam(value="menuname",defaultValue="")String menuName, @RequestParam(value="menucreatedby",defaultValue="")String createdBy,@RequestParam(value="menucreateddate",defaultValue="")String createdDate) throws ParseException {
		
		Date createdDateDual = null;
		if(!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("yy-MM-dddd").parse(createdDate);
		}
		Menu menu = new Menu();
		menu.setCode(menuCode);
		menu.setName(menuName);
		menu.setCreatedDate(createdDateDual);
		menu.setCreatedBy(createdBy);
		List<Menu> listMenu = menuService.getAllMenu();
		List<Menu> listMenuFilter = menuService.search(menu);
		model.addAttribute("listMenu", listMenuFilter);
		model.addAttribute("listMenuComponent", listMenu);
		String result = seqDao.addSeq();
		model.addAttribute(seqDao);
		
		return "menu";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody() //agar yang keluar berupa data ex:string,int
	public Menu save(@RequestBody Menu menu) {
		menuService.save(menu);
		return menu;
	}
	
	@RequestMapping(value="/getall", method=RequestMethod.GET)
	@ResponseBody()
	public List<Menu> getAllMenu(){
		List<Menu> menu = menuService.getAllMenu();
		return menu;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		Menu menu = new Menu();
		menu.setId(id);
		menuService.delete(menu);
		return "redirect:/menu";
	}
	
	@ResponseBody //mencari data dari yang diambil di jsp
	@RequestMapping(value="/getmenu/{id}", method=RequestMethod.GET)
	public Menu getMenuById(@PathVariable int id) {
		return menuService.getMenuById(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK) //
	public void update(@RequestBody Menu menu) {
		menuService.update(menu);
	}
}
