package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.SouvenirDao;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.Unit;

@Transactional
@Service
public class SouvenirService {

	@Autowired
	SouvenirDao souvenirDao;
	
	public void save(Souvenir souvenir) {
		// TODO Auto-generated method stub
		souvenir.setCreatedDate(new Date());
		souvenirDao.save(souvenir);
	}

	public List<Unit> getAllUnit() {
		// TODO Auto-generated method stub
		return souvenirDao.getAllUnit();
	}

	public List<Souvenir> getAllSouvenir() {
		// TODO Auto-generated method stub
		return souvenirDao.getAllSouvenir();
	}

	public Souvenir getSouvenirById(int id) {
		// TODO Auto-generated method stub
		return souvenirDao.getSouvenirById(id);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		souvenirDao.delete(id);
	}

	public void update(Souvenir souvenir) {
		// TODO Auto-generated method stub
		souvenir.setUpdatedDate(new Date());
		souvenirDao.update(souvenir);
	}

}
