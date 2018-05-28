package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;

public interface TransactionSouvenirItemStockDao {

	void save(TransactionSouvenirItem tsi2);

	List<TransactionSouvenirItem> getTransactionSouvenirItemByTransactionSouvenir(
			TransactionSouvenir transactionSouvenir);

	void update(TransactionSouvenirItem tsi2);

	void delete(TransactionSouvenirItem tsi2);

}
