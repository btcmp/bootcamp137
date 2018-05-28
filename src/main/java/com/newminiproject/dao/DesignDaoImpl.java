package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Design;

@Repository
public class DesignDaoImpl implements DesignDao{

	@Autowired
	SessionFactory sessionFactory;

	public List<Design> getListDesign() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Design.class).list();
	}

	public void save(Design design) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(design);
	}

	public Design getDesignById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Design> listDesign;
		//String hql = "from Design d join fetch DesignItem di where d.id = di.tDesignId and d.id = :id";	//kode program hql
		String hql = "from Design d where d.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		listDesign = query.list();
		if(listDesign.isEmpty()){
			return new Design();
		}
		return listDesign.get(0);
	}

	public void update(Design design) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Design d set d.tEventId=?, d.titleHeader=?, d.note=? where d.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, design.gettEventId());
		query.setParameter(1, design.getTitleHeader());
		query.setParameter(2, design.getNote());
		query.setParameter(3, design.getId());
		
		query.executeUpdate();
		System.out.println("event = "+design.gettEventId());
		System.out.println("title header = "+design.getTitleHeader());
		System.out.println("note = "+design.getNote());
		System.out.println("id = "+design.getId());
	}

	public List<Design> search(Design design) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Design d where d.code = :designCode or d.requestDate = :requestDate or d.createdDate = :createdDate";
		Query query = session.createQuery(hql);
		query.setParameter("designCode", design.getCode());
		query.setParameter("requestDate", design.getRequestDate());
		query.setParameter("createdDate", design.getCreatedDate());
		List<Design> listDesign = query.list();
		if(listDesign.isEmpty()) {
			return new ArrayList<Design>();
		}
		return listDesign;
	}

}
