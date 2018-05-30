package com.newminiproject.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Event;
import com.newminiproject.model.Promotion;

@Repository
public class PromotionDaoImpl implements PromotionDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public void save(Promotion promotion) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(promotion);
	}

	public List<Event> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Event.class).list();
	}

	public List<Promotion> getAllPromotion() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Promotion";
		List<Promotion> listPromotion = session.createQuery(hql).list();
		
		if(listPromotion.isEmpty()) {
			return new ArrayList<Promotion>();
		}
		
		return listPromotion;
	}

	public Promotion getPromotionById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Promotion prm where prm.id = :id";
		
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		
		List<Promotion> listPromotion = query.list();
		
		if(listPromotion.isEmpty()) {
			return new Promotion();
		}
		
		return listPromotion.get(0); // untuk mengambil data sebanyak 1, bukan list atau jamak
	}

	@Override
	public void update(Promotion pr) {
		// TODO Auto-generated method stub
		
	}

}
