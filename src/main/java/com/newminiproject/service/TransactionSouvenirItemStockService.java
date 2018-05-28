package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.xsis.dao.TransactionSouvenirItemStockDao;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;

@Service
@Transactional
public class TransactionSouvenirItemStockService {
	
	@Autowired
	TransactionSouvenirItemStockDao transactionSouvenirItemDao;

	public List<TransactionSouvenirItem> getTransactionSouvenirItemByTransactionSouvenir(TransactionSouvenir transactionSouvenir) {
		// TODO Auto-generated method stub
		List<TransactionSouvenirItem> listTransactionSouvenirItem = transactionSouvenirItemDao.getTransactionSouvenirItemByTransactionSouvenir(transactionSouvenir);
		return listTransactionSouvenirItem;
	}

}
