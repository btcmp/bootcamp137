package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marcomplace.dao.RoleDao;
import com.marcomplace.model.Role;

@Transactional
@Service
public class RoleService {
	
	@Autowired
	RoleDao roleDao;

	public void save(Role role) {
		// TODO Auto-generated method stub
		role.setCreatedBy("admin");
		role.setCreatedDate(new Date());
		roleDao.save(role);
		
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
		// TODO Auto-generated method stub
		roleDao.update(role);
	}

	public List<Role> search(Role role) {
		return roleDao.search(role);
	}
}
