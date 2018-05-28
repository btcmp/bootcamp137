package com.newminiproject.dao;

import java.util.List;

import com.miniproject.xsis.model.Event;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;

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
