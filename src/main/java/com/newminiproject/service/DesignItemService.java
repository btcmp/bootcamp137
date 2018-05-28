package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.DesignItemDao;
import com.newminiproject.model.Design;
import com.newminiproject.model.DesignItem;

@Service
@Transactional
public class DesignItemService {
	
	@Autowired
	DesignItemDao designItemDao;
 
	public List<DesignItem> getDesignItemByDesign(Design design) {
		// TODO Auto-generated method stub
		List<DesignItem> listDesignItem = designItemDao.getDesignItemByDesign(design);
		return listDesignItem;
	}
}
