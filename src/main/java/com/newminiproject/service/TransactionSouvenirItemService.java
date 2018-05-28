package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.xsis.dao.TransactionSouvenirItemDao;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;

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
