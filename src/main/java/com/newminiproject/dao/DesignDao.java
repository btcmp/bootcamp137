package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Design;

public interface DesignDao {

	List<Design> getListDesign();

	void save(Design design);

	Design getDesignById(int id);

	void update(Design design);

	List<Design> search(Design design);

	
}
