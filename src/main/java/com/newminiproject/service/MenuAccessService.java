package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.MenuAccessDao;
import com.newminiproject.model.MenuAccess;

@Service
@Transactional
public class MenuAccessService {
	
	@Autowired
	MenuAccessDao maDao;
	
	public void save(MenuAccess menuAccess) {
		// TODO Auto-generated method stub
		menuAccess.setCreatedBy("Admin");
		menuAccess.setCreatedDate(new Date());
		maDao.save(menuAccess);
	}

	public List<MenuAccess> getAllMenuAccess() {
		// TODO Auto-generated method stub
		return maDao.getAllMenuAccess();
	}

	public void delete(MenuAccess menuAccess) {
		// TODO Auto-generated method stub
		maDao.delete(menuAccess);
	}

	public MenuAccess getMenuAccessById(int id) {
		// TODO Auto-generated method stub
		return maDao.getMenuAccessById(id);
	}

	public void update(MenuAccess menuAccess) {
		// TODO Auto-generated method stub
		menuAccess.setUpdatedBy("Admin");
		menuAccess.setUpdatedDate(new Date());
		maDao.update(menuAccess);
	}

	public List<MenuAccess> search(MenuAccess menuAccess) {
		// TODO Auto-generated method stub
		return maDao.search(menuAccess);
	}

}
