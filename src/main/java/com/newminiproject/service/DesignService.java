package com.newminiproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.DesignDao;
import com.newminiproject.dao.DesignItemDao;
import com.newminiproject.model.Design;
import com.newminiproject.model.DesignItem;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.model.Product;
import com.newminiproject.model.User;

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
		Employee employee = new Employee();
		event.setId(design.gettEventId().getId());
		Design dsn = new Design();
		dsn.setCode(design.getCode());
		dsn.settEventId(event);
		dsn.setTitleHeader(design.getTitleHeader());
		dsn.setCreatedDate(new Date());
		employee.setId(design.getRequestBy().getId());
		dsn.setRequestBy(employee);
		dsn.setCreatedBy(employee);
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
			Employee empItem = new Employee();
			empItem.setId(di.getRequestPic().getId());
			di2.setRequestPic(empItem);
			di2.setCreatedBy(employee);
			di2.setRequestDueDate(di.getRequestDueDate());
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
		List<DesignItem> lastDI = new ArrayList<>();
		for(DesignItem di : listDesignItem) {
			DesignItem di2 = new DesignItem();
			di2.setId(di.getId());
			di2.setmProductId(di.getmProductId());
			di2.setTitleItem(di.getTitleItem());
			di2.setRequestPic(di.getRequestPic());
			di2.setRequestDueDate(di.getRequestDueDate());
			di2.setStartDate(di.getStartDate());
			di2.setEndDate(di.getEndDate());
			di2.setNote(di.getNote());
			//di2.settDesignId(design);
			lastDI.add(di2);
		}
		design.setListDesignItem(lastDI);
		return design;
	}

	public void update(Design design) {
		// TODO Auto-generated method stub
		//update Design
		Event event = new Event();
		Employee employee = new Employee();
		event.setId(design.gettEventId().getId());
		Design dsn = new Design();
		dsn.setId(design.getId());
		dsn.settEventId(event);
		dsn.setTitleHeader(design.getTitleHeader());
		dsn.setNote(design.getNote());
		dsn.setUpdatedDate(new Date());
		employee.setId(design.getUpdatedBy().getId());
		dsn.setUpdatedBy(employee);
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
			Employee empItem = new Employee();
			empItem.setId(di.getRequestPic().getId());
			di2.setRequestPic(empItem);
			di2.setRequestDueDate(di.getRequestDueDate());
			di2.setUpdatedDate(new Date());
			di2.setUpdatedBy(employee);
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

	public List<Design> getDesignByEvent(Event event){
		List<Design> listDesign = designDao.getDesignByEvent(event);
		return listDesign;
	}

	public void approved(Design design) {
		// TODO Auto-generated method stub
		Design dsn = new Design();
		Employee employee = new Employee();
		dsn.setId(design.getId());
		dsn.setStatus(design.getStatus());
		dsn.setApprovedDate(new Date());
		employee.setId(design.getApprovedBy().getId());
		dsn.setApprovedBy(employee);
		dsn.setAssignTo(design.getAssignTo());
		designDao.approved(dsn);
	}

	public void rejected(Design design) {
		// TODO Auto-generated method stub
		Design dsn = new Design();
		dsn.setId(design.getId());
		dsn.setStatus(design.getStatus());
		dsn.setRejectReason(design.getRejectReason());
		designDao.rejected(dsn);
	}

	public void closerequest(Design design) {
		// TODO Auto-generated method stub
		Design dsn = new Design();
		dsn.setId(design.getId());
		dsn.setStatus(design.getStatus());
		dsn.setCloseDate(new Date());
		designDao.closerequest(dsn);
		
		for(DesignItem di : design.getListDesignItem()) {
			DesignItem di2 = new DesignItem();
			di2.setStartDate(di.getStartDate());
			di2.setEndDate(di.getEndDate());
			di2.setId(di.getId());
			
			di2.settDesignId(dsn); 
			System.out.println("start date = "+di.getStartDate());
			System.out.println("end date = "+di.getEndDate());
			System.out.println("id = "+di.getId());
			designItemDao.closerequest(di2);
		}
	}

	public List<User> getAllStaff() {
		// TODO Auto-generated method stub
		return designDao.getAllStaff();
	}

	public List<User> getAllRequester() {
		// TODO Auto-generated method stub
		return designDao.getAllRequester();
	}	
}
