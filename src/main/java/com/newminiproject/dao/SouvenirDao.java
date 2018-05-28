package com.newminiproject.dao;

import java.util.List;

import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model.Unit;

public interface SouvenirDao {

	void save(Souvenir souvenir);

	List<Unit> getAllUnit();

	List<Souvenir> getAllSouvenir();

	Souvenir getSouvenirById(int id);

	void delete(int id);

	void update(Souvenir souvenir);

}
