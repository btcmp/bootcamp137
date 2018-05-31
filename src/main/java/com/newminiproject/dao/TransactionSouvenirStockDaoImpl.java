package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.TransactionSouvenir;


@Repository
public class TransactionSouvenirStockDaoImpl implements TransactionSouvenirStockDao {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void save(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(transactionSouvenir);
	}

	@Override
	public List<TransactionSouvenir> getAllTransactionSouvenir() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenir ts where ts.isDelete=0";
		List<TransactionSouvenir> listTransactionSouvenir = session.createQuery(hql).list();
		if(listTransactionSouvenir.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listTransactionSouvenir;
	}

	@Override
	public TransactionSouvenir getTransactionSouvenirById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenir ts where ts.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<TransactionSouvenir> listTransactionSouvenir = query.list();
		if(listTransactionSouvenir.isEmpty()) {
			return new TransactionSouvenir();
		}
		return listTransactionSouvenir.get(0);
	}

	@Override
	public void update(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.receivedBy=?, ts.receivedDate=?, ts.updatedDate=?, ts.note=? where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.getReceivedBy());
		query.setParameter(1, ts.getReceivedDate());
		query.setParameter(2, ts.getUpdatedDate());
		query.setParameter(3, ts.getNote());
		query.setParameter(4, ts.getId());
		query.executeUpdate();
		//cek data sudah masuk atau belum
		//System.out.println("Recived By : "+ ts.getReceivedBy());
		//System.out.println("Recived By : "+ ts.getReceivedDate());
		//System.out.println("Recived By : "+ ts.getNote());
		//System.out.println("Recived By : "+ ts.getId());
	}

	@Override
	public void delete(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.isDelete=1 where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, transactionSouvenir.getId());
		query.executeUpdate();
	}

	@Override
	public List<TransactionSouvenir> search(TransactionSouvenir tssearch) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenir ts where ts.code=:code";
		
		Query query = session.createQuery(hql);
		query.setParameter("code", tssearch.getCode());
		List<TransactionSouvenir> listTransactionSouvenir = query.list();
		
		System.out.println("code :" + tssearch.getCode());
		if(listTransactionSouvenir.isEmpty()) {
			return new ArrayList<>();
		}
		return listTransactionSouvenir;
	}
}
