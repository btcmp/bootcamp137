package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Event;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;

@Repository
public class SouvenirRequestDaoImpl implements SouvenirRequestDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		transactionSouvenir.setCreatedDate(new Date());
		Session session = sessionFactory.getCurrentSession();
		session.save(transactionSouvenir);
	}

	@Override
	public List<Event> getAllEvent() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Event.class).list();
	}

	@Override
	public List<TransactionSouvenir> getAllTransaction() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenir ts where ts.isDelete=0";
		List<TransactionSouvenir> listTransactionSouvenir = session.createQuery(hql).list();
		
		if (listTransactionSouvenir.isEmpty()) {
			return new ArrayList<>();
		}
		return listTransactionSouvenir;
	}

	@Override
	public TransactionSouvenir getAllTransactionSouvenirById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenir ts where ts.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<TransactionSouvenir> listTransactionSouvenir = query.list();
		
		if (listTransactionSouvenir.isEmpty()) {
			return new TransactionSouvenir();
		}
		return listTransactionSouvenir.get(0);
	}

	@Override
	public List<TransactionSouvenirItem> getAllItem() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(TransactionSouvenirItem.class).list();
	}

	@Override
	public List<TransactionSouvenirItem> getSouvenirRequestBySouvenir(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenirItem tsi where tsi.tSouvenirId=:transactionSouvenir";
		Query query = session.createQuery(hql);
		query.setParameter("transactionSouvenir", transactionSouvenir);
		List<TransactionSouvenirItem> listTransactionSouvenirItem = query.list();
		
		if (listTransactionSouvenirItem.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listTransactionSouvenirItem;
	}

	@Override
	public List<TransactionSouvenir> search(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		System.out.println("Transaction Code : " + transactionSouvenir.getCode());
		System.out.println("Request By : " + transactionSouvenir.getRequestBy());
		System.out.println("Request Date : " + transactionSouvenir.getReceivedDate());
		System.out.println("Due Date : " + transactionSouvenir.getRequestDueDate());
		System.out.println("Status : " + transactionSouvenir.getStatus());
		System.out.println("Created Date : " + transactionSouvenir.getCreatedDate());
		System.out.println("Create By : " + transactionSouvenir.getCreatedBy());
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransactionSouvenir ts where ts.code=:transactioncode"; // or ts.requestDate=:requestdate or ts.requestDueDate=:duedate or ts.createdDate=:createddate
		Query query = session.createQuery(hql);
		query.setParameter("transactioncode", transactionSouvenir.getCode());
		/*query.setParameter("requestdate", transactionSouvenir.getRequestDate());
		query.setParameter("duedate", transactionSouvenir.getRequestDueDate());
		query.setParameter("createddate", transactionSouvenir.getCreatedDate());*/
		List<TransactionSouvenir> listTransactionSouvenir = query.list();
		if (listTransactionSouvenir.isEmpty()) {
			return new ArrayList<>();
		}
		return listTransactionSouvenir;
	}

	@Override
	public void update(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.tEventId=?, ts.requestDueDate=?, ts.note=?, ts.updatedDate=?, ts.updatedBy=? where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.gettEventId());
		query.setParameter(1, ts.getRequestDueDate());
		query.setParameter(2, ts.getNote());
		query.setParameter(3, ts.getUpdatedDate());
		query.setParameter(4, ts.getUpdatedBy());
		query.setParameter(5, ts.getId());
		
		query.executeUpdate();
		//session.update(ts); 
	}

	@Override
	public void savesettlement(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.status=?, ts.settlementDate=?, ts.settlementBy=? where ts.id=? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.getStatus());
		query.setParameter(1, ts.getSettlementDate());
		query.setParameter(2, ts.getSettlementBy());
		query.setParameter(3, ts.getId());
		query.executeUpdate();
	}

	@Override
	public void approved(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.status=?, ts.approvedDate=?, ts.approvedBy=? where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.getStatus());
		query.setParameter(1, ts.getApprovedDate());
		query.setParameter(2, ts.getApprovedBy());
		query.setParameter(3, ts.getId());
		query.executeUpdate();
	}

	@Override
	public void rejected(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.status=?, ts.rejectReason=? where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.getStatus());
		query.setParameter(1, ts.getRejectReason());
		query.setParameter(2, ts.getId());
		
		query.executeUpdate();
	}

	@Override
	public void received(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.status=?, ts.receivedDate=?, ts.receivedBy=? where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.getStatus());
		query.setParameter(1, ts.getReceivedDate());
		query.setParameter(2, ts.getReceivedBy());
		query.setParameter(3, ts.getId());
		
		query.executeUpdate();
	}

	@Override
	public void close(TransactionSouvenir ts) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update TransactionSouvenir ts set ts.status=? where ts.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, ts.getStatus());
		query.setParameter(1, ts.getId());
		
		query.executeUpdate();
	}

}
