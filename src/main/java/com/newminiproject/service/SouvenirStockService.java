package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.SouvenirDao;
import com.newminiproject.dao.TransactionSouvenirItemStockDao;
import com.newminiproject.dao.TransactionSouvenirStockDao;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;


@Transactional
@Service
public class SouvenirStockService {

	@Autowired
	SouvenirDao souvenirDao;
	
	@Autowired
	TransactionSouvenirItemStockDao transactionSouvenirItemDao;
	
	@Autowired
	TransactionSouvenirItemStockService transactionSouvenirItemService;
	
	@Autowired
	TransactionSouvenirStockDao transactionSouvenirStockDao;

	public List<Souvenir> getAllSouvenir() {
		// TODO Auto-generated method stub
		return souvenirDao.getAllSouvenir();
	}

	public void save(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		Employee emp = new Employee();
		Event event = new Event();
		event.setId(52);
		emp.setId(transactionSouvenir.getReceivedBy().getId()); 
		TransactionSouvenir ts = new TransactionSouvenir();
		ts.setCode(transactionSouvenir.getCode());
		ts.setReceivedBy(emp);
		ts.setType("Additional");
		ts.setReceivedDate(transactionSouvenir.getReceivedDate());
		ts.setNote(transactionSouvenir.getNote());
		ts.setCreatedDate(new Date());
		ts.settEventId(event);
		
		//System.out.println("Event :" + event.getId());
		
		transactionSouvenirStockDao.save(ts);
		//2. save table transaction souvenir item
		for(TransactionSouvenirItem tsi: transactionSouvenir.getTransactionSouvenirItem()) {
			TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
			Souvenir souvenir = new Souvenir();
			souvenir.setId(tsi.getmSouvenirId().getId());
			tsi2.setQty(tsi.getQty());
			tsi2.setmSouvenirId(souvenir);
			tsi2.setNote(tsi.getNote());
			tsi2.settSouvenirId(ts);
			System.out.println("hello");
			transactionSouvenirItemDao.save(tsi2);
		}
	}

	public List<TransactionSouvenir> getAllTransactionSouvenir() {
		// TODO Auto-generated method stub
		return transactionSouvenirStockDao.getAllTransactionSouvenir();
	}

	public TransactionSouvenir getTransactionSouvenirById(int id) {
		// TODO Auto-generated method stub
		TransactionSouvenir transactionSouvenir = transactionSouvenirStockDao.getTransactionSouvenirById(id);
		List<TransactionSouvenirItem> listTransactionSouvenirItem = transactionSouvenirItemService.getTransactionSouvenirItemByTransactionSouvenir(transactionSouvenir);
		List<TransactionSouvenirItem> listTsi = new ArrayList<>();
		for(TransactionSouvenirItem tsi : listTransactionSouvenirItem) {
			TransactionSouvenirItem tsi2 =  new TransactionSouvenirItem();
			//Souvenir souvenir = new Souvenir();
			//souvenir.setName(tsi.getmSouvenirId().getName());
			//souvenir.setCreatedBy(tsi.getmSouvenirId().getCreatedBy());
			//souvenir.setId(tsi.getmSouvenirId().getId());
			tsi2.setId(tsi.getId());
			tsi2.setQty(tsi.getQty());
			tsi2.setNote(tsi.getNote());
			tsi2.setmSouvenirId(tsi.getmSouvenirId());
			//tsi2.setmSouvenirId(tsi.getmSouvenirId()); ini yang salah
			//tsi2.setmSouvenirId(souvenir);
			
			listTsi.add(tsi2);
		}
		transactionSouvenir.setTransactionSouvenirItem(listTsi);;
		return transactionSouvenir;
	}

	public void update(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		Employee emp = new Employee();
		emp.setId(transactionSouvenir.getReceivedBy().getId());
		TransactionSouvenir ts = new TransactionSouvenir();
		ts.setId(transactionSouvenir.getId());
		ts.setCode(transactionSouvenir.getCode());
		ts.setReceivedBy(emp);
		ts.setType("Additional");
		ts.setUpdatedDate(new Date());
		ts.setReceivedDate(transactionSouvenir.getReceivedDate());
		ts.setNote(transactionSouvenir.getNote());
		System.out.println("Update Date :" + ts.getUpdatedDate());
		
		transactionSouvenirStockDao.update(ts);
		//2. save table transaction souvenir item
			for(TransactionSouvenirItem tsi: transactionSouvenir.getTransactionSouvenirItem()) {
				//System.out.println("String yang di update :" + ts.getNote());
				TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
				Souvenir souvenir = new Souvenir();
				souvenir.setId(tsi.getmSouvenirId().getId());
				tsi2.setmSouvenirId(souvenir);
				tsi2.setId(tsi.getId());
				tsi2.setQty(tsi.getQty());
				tsi2.setNote(tsi.getNote());
				tsi2.settSouvenirId(ts);

				transactionSouvenirItemDao.update(tsi2);
			}
	}

	public void delete(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		TransactionSouvenir ts = new TransactionSouvenir();
		ts.setId(transactionSouvenir.getId());
		transactionSouvenirStockDao.delete(transactionSouvenir);
		System.out.println("id service atas : "+ transactionSouvenir.getId());
		for(TransactionSouvenirItem tsi: transactionSouvenir.getTransactionSouvenirItem()) {
			TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
			tsi2.setId(tsi.getId());
			tsi2.settSouvenirId(ts);
			System.out.println("id service atas : "+ tsi2);
			transactionSouvenirItemDao.delete(tsi2);
		}
		
		
	}

	public List<TransactionSouvenir> search(TransactionSouvenir tssearch) {
		// TODO Auto-generated method stub
		return transactionSouvenirStockDao.search(tssearch);
	}
	
}
