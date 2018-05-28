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

}
