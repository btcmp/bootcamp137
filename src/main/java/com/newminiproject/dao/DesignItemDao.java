package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Design;
import com.newminiproject.model.DesignItem;

public interface DesignItemDao {

	void save(DesignItem di2); 

	List<DesignItem> getDesignItemByDesign(Design design);

	void update(DesignItem di2);

	void closerequest(DesignItem di2);

	
}
