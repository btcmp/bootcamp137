package com.newminiproject.dao;

import java.util.List;

import com.training.xsis.model.Design;
import com.training.xsis.model.DesignItem;
import com.training.xsis.service.DesignItemService;

public interface DesignItemDao {

	void save(DesignItem di2);

	List<DesignItem> getDesignItemByDesign(Design design);

	void update(DesignItem di2);

}
