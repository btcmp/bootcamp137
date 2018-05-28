package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.TransactionSouvenir;


public interface TransactionSouvenirStockDao {

	List<TransactionSouvenir> getAllTransactionSouvenir();

	TransactionSouvenir getTransactionSouvenirById(int id);

	void save(TransactionSouvenir ts);

	void update(TransactionSouvenir ts);

	void delete(TransactionSouvenir transactionSouvenir);

}
