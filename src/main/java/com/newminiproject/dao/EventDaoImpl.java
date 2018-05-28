package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;


@Repository
public class EventDaoImpl implements EventDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Event event) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(event);
	}

	@Override
	public List<Event> getAll() {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		String hql = "from Event it where it.isDelete = 0";
		List<Event> listEvent = session.createQuery(hql).list();
		if(listEvent.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listEvent;
	}

	@Override
	public void delete(Event event) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql ="update Event ist set ist.isDelete = 1 where ist.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", event.getId());
		query.executeUpdate();
	}

	@Override
	public Event getEventById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Event.class, id);
	}

	@Override
	public void update(Event event) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Event it set it.code=?, it.eventName=?, it.eventPlace=?, it.startDate=?, it.endDate=?, it.budget=?, it.requestBy=?, it.requestDate=?, it.note=?, it.updateBy=?, it.update_date=? where it.id=? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, event.getCode());
		query.setParameter(1, event.getEventName());
		query.setParameter(2, event.getEventPlace());
		query.setParameter(3, event.getStartDate());
		query.setParameter(4, event.getEndDate());
		query.setParameter(5, event.getBudget());
		query.setParameter(6, event.getRequestBy());
		query.setParameter(7, event.getRequestDate());
		query.setParameter(8, event.getNote());
		query.setParameter(9, event.getUpdateBy());
		query.setParameter(10, event.getUpdate_date());
		query.setParameter(11, event.getId());
		query.executeUpdate();
	}

	@Override
	public void updatecls(Event event) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Event it set it.closeDate=?, it.status=?, it.updateBy=?, it.update_date=? where it.id=? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, event.getCloseDate());
		query.setParameter(1, event.getStatus());
		query.setParameter(2, event.getUpdateBy());
		query.setParameter(3, event.getUpdate_date());
		query.setParameter(4, event.getId());
		query.executeUpdate();
	}

	@Override
	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		return session.createCriteria(Employee.class).list();
	}

	@Override
	public void aprove(Event event) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Event it set it.status=?, it.updateBy=?, it.update_date=?, it.employee=? where it.id=? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, event.getStatus());
		query.setParameter(1, event.getUpdateBy());
		query.setParameter(2, event.getUpdate_date());
		query.setParameter(3, event.getEmployee());
		query.setParameter(4, event.getId());
		query.executeUpdate();
		
	}

	@Override
	public void rejected(Event event) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Event it set it.rejectReason=?, it.status=?, it.updateBy=?, it.update_date=? where it.id=? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, event.getRejectReason());
		query.setParameter(1, event.getStatus());
		query.setParameter(2, event.getUpdateBy());
		query.setParameter(3, event.getUpdate_date());
		query.setParameter(4, event.getId());
		query.executeUpdate();
		
	}

}
