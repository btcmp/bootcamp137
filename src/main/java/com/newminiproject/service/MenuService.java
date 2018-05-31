package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.MenuDao;
import com.newminiproject.model.Menu;
import com.newminiproject.model.User;

@Transactional
@Service
public class MenuService {

	@Autowired
	MenuDao menuDao;
	
	@Autowired
	HttpSession httpSession;
	
	public void save(Menu menu) {
		User user = (User) httpSession.getAttribute("app-user");
		
		// TODO Auto-generated method stub
		//Hibernate error minta objek baru
		Menu menuSave = new Menu(); 
		menuSave.setParentId(menu.getParentId());
		menuSave.setCode(menu.getCode());
		menuSave.setName(menu.getName());
		menuSave.setController(menu.getController());
		menuSave.setCreatedDate(new Date());
		menuSave.setCreatedBy(user.getUsername());
		menuDao.save(menuSave);
	}

	public List<Menu> getAllMenu() {
		// TODO Auto-generated method stub
		return menuDao.getAllMenu();
	}

	public void delete(Menu menu) {
		// TODO Auto-generated method stub
		menuDao.delete(menu);
	}

	public Menu getMenuById(int id) {
		// TODO Auto-generated method stub
		return menuDao.getMenuById(id);
	}

	public void update(Menu menu) {
		User user = (User) httpSession.getAttribute("app-user");
		
		// TODO Auto-generated method stub
		menu.setUpdatedDate(new Date());
		menu.setUpdatedBy(user.getUsername());
		menuDao.update(menu);
	}

	public List<Menu> search(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.search(menu);
	}

}
