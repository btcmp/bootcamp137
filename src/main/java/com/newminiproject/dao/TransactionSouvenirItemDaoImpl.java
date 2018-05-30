package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;

@Repository
public class TransactionSouvenirItemDaoImpl implements TransactionSouvenirItemDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(TransactionSouvenirItem tsi2) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(tsi2);
		session.flush();
	}

	@Override
	public List<TransactionSouvenirItem> getSouvenirRequestBySouvenir(TransactionSouvenir transactioSouvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenirItem tsi where tsi.tSouvenirId=:transactionSouvenir";
		Query query = session.createQuery(hql);
		query.setParameter("transactionSouvenir", transactioSouvenir);
		List<TransactionSouvenirItem> listTransactionSouvenirItem = query.list();
		
		if (listTransactionSouvenirItem.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listTransactionSouvenirItem;
	}

	@Override
	public void update(TransactionSouvenirItem tsi2) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenirItem tsi set tsi.mSouvenirId=?, tsi.qty=?, tsi.note=? where tsi.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, tsi2.getmSouvenirId());
		query.setParameter(1, tsi2.getQty());
		query.setParameter(2, tsi2.getNote());
		query.setParameter(3, tsi2.getId());
		
		query.executeUpdate();
		//session.update(tsi2);
	}

	@Override
	public void savesettlement(TransactionSouvenirItem tsi2) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenirItem tsi set tsi.qtySettlement=? where tsi.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, tsi2.getQtySettlement());
		query.setParameter(1, tsi2.getId());
		
		query.executeUpdate();
	}

}
