package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Design;
import com.newminiproject.model.Event;

public interface DesignDao {

	List<Design> getListDesign();

	void save(Design design); 

	Design getDesignById(int id);

	void update(Design design);

	List<Design> search(Design design);

	List<Design> getDesignByEvent(Event event);

	
}
