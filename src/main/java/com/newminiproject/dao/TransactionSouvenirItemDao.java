package com.newminiproject.dao;

import java.util.List;

import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;

public interface TransactionSouvenirItemDao {

	void save(TransactionSouvenirItem tsi2);

	List<TransactionSouvenirItem> getSouvenirRequestBySouvenir(TransactionSouvenir transactioSouvenir);

	void update(TransactionSouvenirItem tsi2);



}
