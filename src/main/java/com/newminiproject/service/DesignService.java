package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.training.xsis.dao.DesignDao;
import com.training.xsis.dao.DesignItemDao;
import com.training.xsis.model.Design;
import com.training.xsis.model.DesignItem;
import com.training.xsis.model.Event;
import com.training.xsis.model.Product;

@Service
@Transactional
public class DesignService {

	@Autowired
	DesignDao designDao;
	
	@Autowired
	DesignItemDao designItemDao;
	
	@Autowired
	DesignItemService designItemService;

	public List<Design> getListDesign() {
		// TODO Auto-generated method stub
		return designDao.getListDesign();
	}

	public void save(Design design) {
		// TODO Auto-generated method stub
		
		//save Design Request
		Event event = new Event();
		event.setId(design.gettEventId().getId());
		Design dsn = new Design();
		dsn.setCode(design.getCode());
		dsn.settEventId(event);
		dsn.setTitleHeader(design.getTitleHeader());
		dsn.setCreatedDate(new Date());
		dsn.setRequestDate(new Date());
		dsn.setStatus(1);
		dsn.setNote(design.getNote());
		
		designDao.save(dsn);
		
		//save Item Design
		for(DesignItem di : design.getListDesignItem()) {
			DesignItem di2 = new DesignItem();
			Product product = new Product();
			product.setId(di.getmProductId().getId());
			di2.setmProductId(product);
			di2.setTitleItem(di.getTitleItem());
			di2.setRequestDueDate(new Date());
			di2.setCreatedDate(new Date());
			di2.setNote(di.getNote());
			di2.settDesignId(dsn);
			
			designItemDao.save(di2);
		}
	}

	public Design getDesignById(int id) {
		// TODO Auto-generated method stub
		Design design = designDao.getDesignById(id);
		List<DesignItem> listDesignItem = designItemService.getDesignItemByDesign(design);
		List<DesignItem> lastDI = new ArrayList<DesignItem>();
		for(DesignItem di : listDesignItem) {
			DesignItem di2 = new DesignItem();
			di2.setId(di.getId());
			di2.setmProductId(di.getmProductId());
			di2.setTitleItem(di.getTitleItem());
			di2.setRequestDueDate(di.getRequestDueDate());
			di2.setNote(di.getNote());
			lastDI.add(di2);
		}
		design.setListDesignItem(lastDI);
		return design;
	}

	public void update(Design design) {
		// TODO Auto-generated method stub
		//update Design
		Event event = new Event();
		event.setId(design.gettEventId().getId());
		Design dsn = new Design();
		dsn.setId(design.getId());
		dsn.settEventId(event);
		dsn.setTitleHeader(design.getTitleHeader());
		dsn.setNote(design.getNote());
		dsn.setUpdatedDate(new Date());
		designDao.update(dsn);
		//System.out.println("data design : "+design);
		
		//update DesignItem
		for(DesignItem di : design.getListDesignItem()) {
			DesignItem di2 = new DesignItem();
			Product product = new Product();
			product.setId(di.getmProductId().getId());
			di2.setmProductId(product);
			di2.setId(di.getId());
			di2.setTitleItem(di.getTitleItem());
			//di2.setRequestDueDate(di.getRequestDueDate());
			di.setUpdatedDate(new Date());
			di2.setNote(di.getNote());
			di2.settDesignId(dsn);
			//System.out.println("id = "+di.getId());
			designItemDao.update(di2);
		}
	}

	public List<Design> search(Design design) {
		// TODO Auto-generated method stub
		return designDao.search(design);
	}

}
