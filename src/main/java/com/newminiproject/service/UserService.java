package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.RoleDao;
import com.newminiproject.dao.UserDao;
import com.newminiproject.model.Role;
import com.newminiproject.model.User;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	RoleDao roleDao;
	
	public List<User> getAll() {
		// TODO Auto-generated method stub
		List<User> users= userDao.getAll();
		return users;
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		Role role= roleDao.getRoleById(user.getListRole().get(0).getId());
		List<Role> listRole= new ArrayList();
		listRole.add(role);
		user.setListRole(listRole);
		user.setCreatedBy("Administrator");
		user.setCreatedDate(new Date());
		
		userDao.save(user);
	}

	public User getUserById(int id) {
		// TODO Auto-generated method stubuser.getListRole().get(0).getId()
		User user2 = new User();
		User us = new User();
		us.setId(id);
		User user1 = userDao.getUserById(us);
		Role role= roleDao.getRoleById(user1.getListRole().get(0).getId());
		List<Role> listRole= new ArrayList();
		listRole.add(role);
		user2.setId(id);
		user2.setListRole(listRole);
		user2.setmEmployeeId(user1.getmEmployeeId());
		user2.getmEmployeeId().setUser(null);
		user2.setUsername(user1.getUsername());
		user2.setPassword(user1.getPassword());
		return user2;
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		user.setUpdatedDate(new Date());
		userDao.update(user);
	}

	public void delete(User usr) {
		// TODO Auto-generated method stub
		userDao.delete(usr);
	}

	public User findUserByUsername(String username) {
		// TODO Auto-generated method stub
		
		return userDao.findUserByUsername(username);
	}

}
