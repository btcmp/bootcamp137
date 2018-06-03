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
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Promotion pr set pr.titleHeader=?, pr.note=?, pr.updatedBy=?, pr.updatedDate=? where pr.id=?";
		
		Query query = session.createQuery(hql);
		query.setParameter(0, pr.getTitleHeader());
		query.setParameter(1, pr.getNote());
		query.setParameter(2, pr.getUpdatedBy());
		query.setParameter(3, pr.getUpdatedDate());
		query.setParameter(4, pr.getId());
		
		query.executeUpdate();
		
	/*	System.out.println("title header :" + pr.getTitleHeader());
		System.out.println("title note :" + pr.getNote());
		System.out.println("title id :" + pr.getId());
	*/}

	@Override
	public void approved(Promotion prm) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Promotion pr set pr.status =? where pr.id=?";
		
		Query query = session.createQuery(hql);
		query.setParameter(0, prm.getStatus());
		query.setParameter(1, prm.getId());
		
		query.executeUpdate();
		
		/*System.out.println("status : "+ prm.getStatus());
		System.out.println("id : "+ prm.getId());
		*/
	}

	@Override
	public void rejected(Promotion prm) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Promotion pr set pr.status =?, pr.rejectReason = ? where pr.id = ?";
		
		Query query = session.createQuery(hql);
		query.setParameter(0, prm.getStatus());
		query.setParameter(1, prm.getRejectReason());
		query.setParameter(2, prm.getId());
		
		query.executeUpdate();
		
	/*	System.out.println("status : " + prm.getStatus());
		System.out.println("Reject Reason : " + prm.getRejectReason());
		System.out.println("Id : " + prm.getId());
	*/}

	@Override
	public void closeRequest(Promotion prm) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Promotion pr set pr.status = ? where pr.id =?";
		
		Query query = session.createQuery(hql);
		query.setParameter(0, prm.getStatus());
		query.setParameter(1, prm.getId());
		
		query.executeUpdate();
		
	/*	System.out.println("status promotion : " + prm.getStatus());
		System.out.println("id promotion : " + prm.getId());
	*/}

	@Override
	public List<Promotion> search(Promotion searching) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Promotion pr where pr.code = :code or pr.status = :status";
		
		Query query = session.createQuery(hql);
		query.setParameter("code", searching.getCode());
		query.setParameter("status", searching.getStatus());
		List<Promotion> listPromotion = query.list();
		
		if(listPromotion.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listPromotion;
	}

}
