package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.xsis.dao.SouvenirDao;
import com.miniproject.xsis.dao.TransactionSouvenirStockDao;
import com.miniproject.xsis.dao.TransactionSouvenirItemStockDao;
import com.miniproject.xsis.model.Employee;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;

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
	TransactionSouvenirStockDao transactionSouvenirDao;

	public List<Souvenir> getAllSouvenir() {
		// TODO Auto-generated method stub
		return souvenirDao.getAllSouvenir();
	}

	public void save(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		Employee emp = new Employee();
		emp.setId(transactionSouvenir.getReceivedBy().getId()); 
		TransactionSouvenir ts = new TransactionSouvenir();
		ts.setCode(transactionSouvenir.getCode());
		ts.setReceivedBy(emp);
		ts.setType("Show");
		ts.setReceivedDate(transactionSouvenir.getReceivedDate());
		ts.setNote(transactionSouvenir.getNote());
		
		transactionSouvenirDao.save(ts);
		//2. save table transaction souvenir item
		for(TransactionSouvenirItem tsi: transactionSouvenir.getListtransactionSouvenirItem()) {
			TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
			Souvenir souvenir = new Souvenir();
			souvenir.setId(tsi.getmSouvenirId().getId());
			tsi2.setQty(tsi.getQty());
			tsi2.setmSouvenirId(souvenir);
			tsi2.setNote(tsi.getNote());
			tsi2.settSouvenirId(ts);
			
			transactionSouvenirItemDao.save(tsi2);
		}
	}

	public List<TransactionSouvenir> getAllTransactionSouvenir() {
		// TODO Auto-generated method stub
		return transactionSouvenirDao.getAllTransactionSouvenir();
	}

	public TransactionSouvenir getTransactionSouvenirById(int id) {
		// TODO Auto-generated method stub
		TransactionSouvenir transactionSouvenir = transactionSouvenirDao.getTransactionSouvenirById(id);
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
		transactionSouvenir.setListtransactionSouvenirItem(listTsi);
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
		ts.setType("Show");
		ts.setReceivedDate(transactionSouvenir.getReceivedDate());
		ts.setNote(transactionSouvenir.getNote());
		System.out.println("String yang di update :" + ts.getNote());
		
		transactionSouvenirDao.update(ts);
		//2. save table transaction souvenir item
			for(TransactionSouvenirItem tsi: transactionSouvenir.getListtransactionSouvenirItem()) {
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
		transactionSouvenirDao.delete(transactionSouvenir);
		System.out.println("id service atas : "+ transactionSouvenir.getId());
		for(TransactionSouvenirItem tsi: transactionSouvenir.getListtransactionSouvenirItem()) {
			TransactionSouvenirItem tsi2 = new TransactionSouvenirItem();
			tsi2.setId(tsi.getId());
			tsi2.settSouvenirId(ts);
			System.out.println("id service atas : "+ tsi2);
			transactionSouvenirItemDao.delete(tsi2);
		}
		
		
	}
	
}
