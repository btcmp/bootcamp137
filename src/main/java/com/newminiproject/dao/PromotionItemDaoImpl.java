package com.newminiproject.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Promotion;
import com.newminiproject.model.PromotionItem;

import oracle.net.aso.l;


@Repository
public class PromotionItemDaoImpl implements PromotionItemDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PromotionItem promotionItem) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(promotionItem);
	}

	public List<PromotionItem> getPromotionItemByPromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PromotionItem prmi where prmi.promotion = :promotion";
		
		Query query = session.createQuery(hql);
		query.setParameter("promotion", promotion);
		List<PromotionItem> listPromotionItem = query.list();
		
		if(listPromotionItem.isEmpty()) {
			return new ArrayList<PromotionItem>();
		}
		
		return listPromotionItem;
	}

	@Override
	public void update(PromotionItem pi1) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PromotionItem pri set pri.qty=?, pri.todo=?, pri.requestDueDate=?, pri.note=? where pri.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, pi1.getQty());
		query.setParameter(1, pi1.getTodo());
		query.setParameter(2, pi1.getRequestDueDate());
		query.setParameter(3, pi1.getNote());
		query.setParameter(4, pi1.getId());
		
		query.executeUpdate();
		
		/*System.out.println("get qty"+ pi1.getQty());
		System.out.println("get todo"+ pi1.getTodo());
		System.out.println("get request DUe Date"+ pi1.getRequestDueDate());
		System.out.println("get Note"+ pi1.getNote());
		System.out.println("get id"+ pi1.getId());
		*/
	}

	@Override
	public void closeRequest(PromotionItem lpi1) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PromotionItem pti set pti.startDate = ?, pti.endDate = ? where pti.id = ?";
		
		Query query = session.createQuery(hql);
		query.setParameter(0, lpi1.getStartDate());
		query.setParameter(1, lpi1.getEndDate());
		query.setParameter(2, lpi1.getId());
		
		query.executeUpdate();
		
		System.out.println("start date : " + lpi1.getStartDate());
		System.out.println("end date : " + lpi1.getEndDate());
		System.out.println("id : " + lpi1.getId());
	}

}
