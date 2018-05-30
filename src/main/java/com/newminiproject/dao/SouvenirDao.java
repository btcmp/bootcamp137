package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Souvenir;
import com.newminiproject.model.Unit;

public interface SouvenirDao {

	void save(Souvenir souvenir);

	List<Unit> getAllUnit();

	List<Souvenir> getAllSouvenir();

	Souvenir getSouvenirById(int id);

	void delete(int id);

	void update(Souvenir souvenir);

	List<Souvenir> search(Souvenir souvenir);

}
