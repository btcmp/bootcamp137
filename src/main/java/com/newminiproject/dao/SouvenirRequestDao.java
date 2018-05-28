package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Event;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;

public interface SouvenirRequestDao {

	void save(TransactionSouvenir transactionSouvenir);

	List<Event> getAllEvent();

	List<TransactionSouvenir> getAllTransaction();

	TransactionSouvenir getAllTransactionSouvenirById(int id);

	List<TransactionSouvenirItem> getAllItem();

	List<TransactionSouvenirItem> getSouvenirRequestBySouvenir(TransactionSouvenir transactionSouvenir);

	List<TransactionSouvenir> search(TransactionSouvenir transactionSouvenir);

	void update(TransactionSouvenir ts);


}
