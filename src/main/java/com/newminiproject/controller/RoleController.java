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

import com.newminiproject.dao.SequenceDaoRole;
import com.newminiproject.model.Role;
import com.newminiproject.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	RoleService roleService;
	
	@Autowired
	SequenceDaoRole seqDao;
	
	@RequestMapping
	public String index(Model model){
		List<Role> listRole = roleService.getAllRole();
		model.addAttribute("listRoleComponent", listRole);
		model.addAttribute("listRole", listRole); //milik method getall
		String result = seqDao.addSeq();
		//System.out.println(result);
		model.addAttribute("result",result);
		return "role";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="rolename", defaultValue="")String roleName, @RequestParam(value="rolecode", defaultValue="") String roleCode, @RequestParam(value="rolecreatedby", defaultValue="") String createdBy, @RequestParam(value="rolecreateddate", defaultValue="") String createdDate) throws ParseException {
//		System.out.println("Role Name: "+roleName);
//		System.out.println("Role Code: "+roleCode);
//		System.out.println("Created By: "+createdBy);
//		System.out.println("Created Date:"+createdDate);
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //untuk format tanggal
		Date createdDateDual = null;
		if(!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("dddd/MM/yy").parse(createdDate);
		}
		Role role = new Role();
		role.setName(roleName);
		role.setCode(roleCode);
		role.setCreatedBy(createdBy);
		role.setCreatedDate(createdDateDual);
		System.out.println("Created Date" + role);
		List<Role> listRole = roleService.getAllRole();
		List<Role> listRoleFilter = roleService.search(role);
		model.addAttribute("listRole", listRoleFilter); //isi dari table, milik method getall
		model.addAttribute("listRoleComponent", listRole); //data yang ingin dicari
		String result = seqDao.addSeq();
		//System.out.println(result);
		model.addAttribute("result",result);
		return "role";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody
	//@ResponseStatus(HttpStatus.CREATED)
	public Role save(@RequestBody Role role) {
		roleService.save(role);
		return role;
	}
	
	@RequestMapping(value="/getall", method=RequestMethod.GET)
	@ResponseBody
	public List<Role> getAllRole(){
		List<Role> role = roleService.getAllRole();
		return role;
	}
	
	@RequestMapping(value ="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		Role ro = new Role();
		ro.setId(id);
		roleService.delete(ro);
		return "redirect:/role";
	}
	
	@ResponseBody
	@RequestMapping(value="/getrole/{id}", method=RequestMethod.GET)
	public Role getRoleById(@PathVariable int id) {
		return roleService.getRoleById(id);
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Role role){
		roleService.update(role);
	}
}
