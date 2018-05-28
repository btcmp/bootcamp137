package com.newminiproject.dao;

import java.util.List;

import com.marcomplace.model.Unit;

public interface UnitDao {

	void save(Unit unit);

	List<Unit> getAllUnit();

	void delete(Unit unit);

	Unit getUnitById(int id);

	void update(Unit unit);

	List<Unit> search(Unit unit);

}
