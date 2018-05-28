package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.UnitDao;
import com.newminiproject.model.Unit;

@Transactional
@Service
public class UnitService {

	@Autowired
	UnitDao unitDao;
	
	public void save(Unit unit) {
		// TODO Auto-generated method stub
		unit.setCreatedBy("Administration");
		unit.setCreatedDate(new Date());
		unitDao.save(unit);
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
		// TODO Auto-generated method stub
		unitDao.update(unit);
	}

	public List<Unit> search(Unit unit) {
		// TODO Auto-generated method stub
		return unitDao.search(unit);
	}

}
