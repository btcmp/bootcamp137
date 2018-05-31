package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.UnitDao;
import com.newminiproject.model.Unit;
import com.newminiproject.model.User;

@Transactional
@Service
public class UnitService {

	@Autowired
	UnitDao unitDao;
	
	@Autowired
	HttpSession httpSession;
	
	public void save(Unit unit) {
		User user = (User) httpSession.getAttribute("app-user");
		
		// TODO Auto-generated method stub
		//Hibernate error minta objek baru
		Unit unitSave = new Unit();
		unitSave.setCode(unit.getCode());
		unitSave.setName(unit.getName());
		unitSave.setDescription(unit.getDescription());
		unitSave.setCreatedDate(new Date());
		unitSave.setCreatedBy(user.getUsername());
		unitDao.save(unitSave);
	}

	public List<Unit> getAllUnit() {
		// TODO Auto-generated method stub
		return unitDao.getAllUnit();
	}

	public void delete(Unit unit) {
		// TODO Auto-generated method stub
		unitDao.delete(unit);
	}

	public Unit getUnitById(int id) {
		// TODO Auto-generated method stub
		return unitDao.getUnitById(id);
	}

	public void update(Unit unit) {
		User user = (User) httpSession.getAttribute("app-user");
		
		// TODO Auto-generated method stub
		unit.setUpdateDate(user.getUpdatedDate());
		unit.setUpdateBy(user.getUsername());
		unitDao.update(unit);
	}

	public List<Unit> search(Unit unit) {
		// TODO Auto-generated method stub
		return unitDao.search(unit);
	}

}
