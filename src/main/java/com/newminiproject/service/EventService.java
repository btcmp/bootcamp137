package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.EventDao;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;

@Transactional
@Service
public class EventService {
	
	@Autowired
	EventDao eventDao;

	public void save(Event event) {
		// TODO Auto-generated method stub
		eventDao.save(event);
	}

	public List<Event> getAll() {
		// TODO Auto-generated method stub
		return eventDao.getAll();
	}

	public void delete(Event event) {
		// TODO Auto-generated method stub
		eventDao.delete(event);
	}

	public Event getEventById(int id) {
		// TODO Auto-generated method stub
		return eventDao.getEventById(id);
	}

	public void update(Event event) {
		// TODO Auto-generated method stub
		event.setUpdate_date(new Date());
		eventDao.update(event);
		
	}

	public void updatecls(Event event) {
		// TODO Auto-generated method stub
		event.setCloseDate(new Date());
		event.setUpdate_date(new Date());
		event.setStatus(3);
		eventDao.updatecls(event);
	}

	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		return eventDao.getAllEmployee();
	}

	public void aprove(Event event) {
		// TODO Auto-generated method stub
		event.setStatus(2);
		event.setUpdate_date(new Date());
		eventDao.aprove(event);
		
	}

	public void rejected(Event event) {
		// TODO Auto-generated method stub
		event.setStatus(0);
		event.setUpdate_date(new Date());
		eventDao.rejected(event);
		
	}

}