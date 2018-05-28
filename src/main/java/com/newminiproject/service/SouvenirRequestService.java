package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.xsis.dao.SouvenirRequestDao;
import com.miniproject.xsis.dao.TransactionSouvenirItemDao;
import com.miniproject.xsis.model.Employee;
import com.miniproject.xsis.model.Event;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;

@Transactional
@Service
public class SouvenirRequestService {

	
	
	@Autowired
	SouvenirRequestDao souvenirRequestDao;
	
	@Autowired
	TransactionSouvenirItemDao transactionSouvenirItemDao;
	
	@Autowired
	TransactionSouvenirItemService transactionSouvenirItemService;
	
	public void save(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		//1. save table transaction souvenir
		Event event = new Event();
		Employee employee = new Employee();
		event.setId(transactionSouvenir.gettEventId().getId());
		TransactionSouvenir ts = new TransactionSouvenir();
		ts.setCode(transactionSouvenir.getCode());
		ts.settEventId(event);
		ts.setType("hello");
		ts.setRequestDate(new Date());
		ts.setRequestDueDate(transactionSouvenir.getRequestDueDate());
		ts.setNote(transactionSouvenir.getNote());
		ts.setStatus(1);
		employee.setId(transactionSouvenir.getRequestBy().getId());
		ts.setRequestBy(employee);
		
		souvenirRequestDao.save(ts);
		//2. save table transaction souvenir item
		for(TransactionSouvenirItem tsi: transactionSouvenir.getTransactionSouvenirItem() ){
			TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
			tsi2.setmSouvenirId(tsi.getmSouvenirId());
			tsi2.setQty(tsi.getQty());
			tsi2.setNote(tsi.getNote());
			tsi2.settSouvenirId(ts);
			
			transactionSouvenirItemDao.save(tsi2);
		}
		
	}

	public List<Event> getAllEvent() {
		// TODO Auto-generated method stub
		return souvenirRequestDao.getAllEvent();
	}

	public List<TransactionSouvenir> getAllTransaction() {
		// TODO Auto-generated method stub
		return souvenirRequestDao.getAllTransaction();
	}

	public TransactionSouvenir getTransactionSouvenirById(int id) {
		// TODO Auto-generated method stub
		
		TransactionSouvenir transactionSouvenir = souvenirRequestDao.getAllTransactionSouvenirById(id);
		List<TransactionSouvenirItem> listTransactionSouvenirItem = transactionSouvenirItemService.getTransactionSouvenirItemBySouvenir(transactionSouvenir);
		List<TransactionSouvenirItem> lastTsi = new ArrayList<>();
		for(TransactionSouvenirItem tsi : listTransactionSouvenirItem){
			TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
			//Souvenir souvenir = new Souvenir();
			
			//souvenir.setId(tsi.getmSouvenirId().getId());
			//souvenir.setName(tsi.getmSouvenirId().getName());
			tsi2.setId(tsi.getId());
			
			tsi2.setmSouvenirId(tsi.getmSouvenirId());
			tsi2.setQty(tsi.getQty());
			//tsi2.setmSouvenirId(souvenir);
			tsi2.setNote(tsi.getNote());
			
			lastTsi.add(tsi2);
		}
		transactionSouvenir.setTransactionSouvenirItem(lastTsi);
		

		return transactionSouvenir;
	}

	public List<TransactionSouvenirItem> getAllItem() {
		// TODO Auto-generated method stub
		return souvenirRequestDao.getAllItem();
	}

	public List<TransactionSouvenirItem> getSouvenirRequestBySouvenir(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		return souvenirRequestDao.getSouvenirRequestBySouvenir(transactionSouvenir);
	}

	public List<TransactionSouvenir> search(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		return souvenirRequestDao.search(transactionSouvenir);
	}

	public void update(TransactionSouvenir transactionSouvenir) {
		//1. save table transaction souvenir
				Event event = new Event();
				event.setId(transactionSouvenir.gettEventId().getId());
				TransactionSouvenir ts = new TransactionSouvenir();
				ts.setId(transactionSouvenir.getId());
				ts.settEventId(event);
				ts.setRequestDueDate(transactionSouvenir.getRequestDueDate());
				ts.setNote(transactionSouvenir.getNote());
				transactionSouvenir.setUpdatedDate(new Date());
				
				souvenirRequestDao.update(ts);
				//2. save table transaction souvenir item
				for(TransactionSouvenirItem tsi: transactionSouvenir.getTransactionSouvenirItem() ){
					TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
					Souvenir souvenir = new Souvenir();
					souvenir.setId(tsi.getmSouvenirId().getId());
					tsi2.setId(tsi.getId());
					tsi2.setmSouvenirId(souvenir);
					tsi2.setQty(tsi.getQty());
					tsi2.setNote(tsi.getNote());
					tsi2.settSouvenirId(ts);
					
					transactionSouvenirItemDao.update(tsi2);
				}
	}

	
}
