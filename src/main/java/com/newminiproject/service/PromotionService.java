package com.newminiproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training146.dao.PromotionDao;
import com.xsis.training146.dao.PromotionItemDao;
import com.xsis.training146.dao.PromotionItemFileDao;
import com.xsis.training146.model.Design;
import com.xsis.training146.model.DesignItem;
import com.xsis.training146.model.Employee;
import com.xsis.training146.model.Event;
import com.xsis.training146.model.Product;
import com.xsis.training146.model.Promotion;
import com.xsis.training146.model.PromotionItem;
import com.xsis.training146.model.PromotionItemFile;

@Transactional
@Service
public class PromotionService {

	@Autowired
	PromotionDao promotionDao;
	
	@Autowired
	PromotionItemDao promotionItemDao;
	
	@Autowired
	PromotionItemFileDao promotionItemFileDao;
	
	@Autowired
	PromotionItemService promotionItemService;
	
	@Autowired
	PromotionItemFileService promotionItemFileService;

	//tempat untuk memisahkan save kedalam tabel lebih dari 2
	public void save(Promotion promotion) {
		// TODO Auto-generated method stub
		
		//1. Untuk save ke dalam tabel promotion
		Event event = new Event();
		event.setId(promotion.getEvent().getId());
		
		Promotion pr = new Promotion();
		pr.setCode(promotion.getCode());
		pr.setEvent(event);
		pr.setCreatedDate(promotion.getCreatedDate());
		pr.setFlagDesign(promotion.getFlagDesign());
		pr.setTitleHeader(promotion.getTitleHeader());
		pr.setNote(promotion.getNote());
		//pr.setRequestBy(promotion.getRequestBy());
		pr.setRequestDate(promotion.getRequestDate());
		pr.setStatus(promotion.getStatus());
		
		if(promotion.getFlagDesign() == 1) {
			Design design = new Design ();
			design.setId(promotion.getDesign().getId());
			pr.setDesign(design);
			
			//2. untuk save ke dalam tabel promotion_item
			for(PromotionItem pi : promotion.getListPromotionItem()) {
				PromotionItem pi1 = new PromotionItem();
				Product product = new Product();
				product.setId(pi.getProduct().getId());
				DesignItem designItem = new DesignItem();
				designItem.setId(pi.getDesignItem().getId());
				Employee requestPic = new Employee();
				requestPic.setId(pi.getRequestPic().getId());
				
				pi1.setPromotion(pr);
				pi1.setProduct(product);
				pi1.setDesignItem(designItem);
				pi1.setRequestPic(requestPic);
				pi1.setTitle(pi.getTitle());
				pi1.setQty(pi.getQty());
				pi1.setTodo(pi.getTodo());
				pi1.setNote(pi.getNote());
				pi1.setRequestDueDate(pi.getRequestDueDate());
				
				promotionItemDao.save(pi1);
			}
		}
				
		promotionDao.save(pr);
		
		//3. untuk save ke dalam tabel promotion_item_file
		for(PromotionItemFile pif : promotion.getListPromotionItemFile()) {
			PromotionItemFile pif1 = new PromotionItemFile();
			//pif1.setFileName(pif.getFileName());
			pif1.setPromotion(pr);
			pif1.setNote(pif.getNote());
			pif1.setTodo(pif.getTodo());
			pif1.setQty(pif.getQty());
			pif1.setRequestDueDate(pif.getRequestDueDate());
			
			promotionItemFileDao.save(pif1);
		}
		
	}

	public List<Event> getAll() {
		// TODO Auto-generated method stub
		return promotionDao.getAll();
	}

	public List<Promotion> getAllPromotion() {
		// TODO Auto-generated method stub
		return promotionDao.getAllPromotion();
	}

	public Promotion getPromotionById(int id) {
		// TODO Auto-generated method stub
		Promotion promotion = promotionDao.getPromotionById(id);
		
		List<PromotionItem> listPromotionItem = promotionItemService.getPromotionItemByPromotion(promotion);
		List<PromotionItem> lastPrm = new ArrayList<PromotionItem>();
		for(PromotionItem pri : listPromotionItem) {
			PromotionItem pri1 = new PromotionItem ();
			pri1.setId(pri.getId());
			pri1.setDesignItem(pri.getDesignItem());
			pri1.setProduct(pri.getProduct());
			pri1.setTitle(pri.getTitle());
			pri1.setTodo(pri.getTodo());
			pri1.setQty(pri.getQty());
			pri1.setNote(pri.getNote());
			pri1.setRequestDueDate(pri.getRequestDueDate());
			
			lastPrm.add(pri1);
		}
		
		promotion.setListPromotionItem(lastPrm);
		
		List<PromotionItemFile> listPromotionItemFile = promotionItemFileService.getPromotionItemFileByPromotion(promotion);
		List<PromotionItemFile> lastPrmFile = new ArrayList<PromotionItemFile>();
		for(PromotionItemFile prif : listPromotionItemFile) {
			PromotionItemFile prif1 = new PromotionItemFile();
			
			//prif1.setPromotion(prif.getPromotion());
			prif1.setQty(prif.getQty());
			prif1.setTodo(prif.getTodo());
			prif1.setNote(prif.getNote());
			prif1.setRequestDueDate(prif.getRequestDueDate());
			
			lastPrmFile.add(prif1);
		}
		
		promotion.setListPromotionItemFile(lastPrmFile);
		
		
		return promotion;
	}
}