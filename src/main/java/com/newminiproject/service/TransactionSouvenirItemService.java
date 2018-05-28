package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.TransactionSouvenirItemDao;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;

@Transactional
@Service
public class TransactionSouvenirItemService {

	@Autowired
	TransactionSouvenirItemDao transactionSouvenirItemDao;
	
	public List<TransactionSouvenirItem> getTransactionSouvenirItemBySouvenir(TransactionSouvenir transactioSouvenir){
		List<TransactionSouvenirItem> listTransactionSouvenirItem = transactionSouvenirItemDao.getSouvenirRequestBySouvenir(transactioSouvenir);
		return listTransactionSouvenirItem;
	}
	
}
