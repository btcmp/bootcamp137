package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.RoleDao;
import com.newminiproject.model.Role;
import com.newminiproject.model.User;

@Transactional
@Service
public class RoleService {
	
	@Autowired
	RoleDao roleDao;

	@Autowired
	HttpSession httpSession;
	
	public void save(Role role) {
		User user = (User) httpSession.getAttribute("app-user");
		
		// TODO Auto-generated method stub
		//Hibernate error minta objek baru
		Role roleSave = new Role();
		roleSave.setCode(role.getCode());
		roleSave.setName(role.getName());
		roleSave.setDescription(role.getDescription());
		roleSave.setCreatedDate(new Date());
		roleSave.setCreatedBy(user.getUsername());
		roleDao.save(roleSave);
	}

	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return roleDao.getAllRole();
	}

	public void delete(Role role) {
		// TODO Auto-generated method stub
		roleDao.delete(role);
	}

	public Role getRoleById(int id) {
		// TODO Auto-generated method stub
		return roleDao.getRoleById(id);
	}

	public void update(Role role) {
		User user = (User) httpSession.getAttribute("app-user");
		
		// TODO Auto-generated method stub
		role.setUpdateDate(new Date());
		role.setUpdateBy(user.getUsername());
		roleDao.update(role);
	}

	public List<Role> search(Role role) {
		return roleDao.search(role);
	}
}
