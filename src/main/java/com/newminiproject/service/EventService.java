package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.EventDao;
import com.newminiproject.model.Design;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.model.User;

@Transactional
@Service
public class EventService {
	
	@Autowired
	EventDao eventDao;
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	DesignService designService;

	public void save(Event event) {
		// TODO Auto-generated method stub
		/*User appUser = (User) httpSession.getAttribute("app-user");
		event.setCreateBy(appUser.getUsername());*/
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
	
	public Event getEventByIdDesign(int id) {
		// TODO Auto-generated method stub
		Event event = eventDao.getEventById(id);
		List<Design> listDisgn = designService.getDesignByEvent(event);
		List<Design> lastDs = new ArrayList<>();
		for(Design ds: listDisgn) {
			Design ds1 = new Design();
			ds1.setId(ds.getId());
			ds1.setCode(ds.getCode());
			ds1.setTitleHeader(ds.getTitleHeader());
			ds1.setRequestBy(ds.getRequestBy());
			ds1.setRequestDate(ds.getRequestDate());
			ds1.setNote(ds.getNote());
			lastDs.add(ds1);
		}
		event.setListDesign(lastDs);
		
		return event;
	}

	public List<Event> search(Event event) {
		// TODO Auto-generated method stub
		return eventDao.search(event);
	}

}