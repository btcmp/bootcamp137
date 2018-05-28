package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;

public interface TransactionSouvenirItemDao {

	void save(TransactionSouvenirItem tsi2);

	List<TransactionSouvenirItem> getSouvenirRequestBySouvenir(TransactionSouvenir transactioSouvenir);

	void update(TransactionSouvenirItem tsi2);



}
