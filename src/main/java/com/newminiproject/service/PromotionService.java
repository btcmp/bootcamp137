package com.newminiproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.PromotionDao;
import com.newminiproject.dao.PromotionItemDao;
import com.newminiproject.dao.PromotionItemFileDao;
import com.newminiproject.model.Design;
import com.newminiproject.model.DesignItem;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Event;
import com.newminiproject.model.Product;
import com.newminiproject.model.Promotion;
import com.newminiproject.model.PromotionItem;
import com.newminiproject.model.PromotionItemFile;

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
				/*Employee requestPic = new Employee();
				requestPic.setId(pi.getRequestPic().getId());
				*/
				pi1.setPromotion(pr);
				pi1.setProduct(product);
				pi1.setDesignItem(designItem);
				//pi1.setRequestPic(requestPic);
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
			prif1.setId(prif.getId());
			prif1.setQty(prif.getQty());
			prif1.setTodo(prif.getTodo());
			prif1.setNote(prif.getNote());
			prif1.setRequestDueDate(prif.getRequestDueDate());
			
			lastPrmFile.add(prif1);
		}
		
		promotion.setListPromotionItemFile(lastPrmFile);
		
		
		return promotion;
	}

	public void update(Promotion promotion) {
		// TODO Auto-generated method stub
		//1. Untuk save ke dalam tabel promotion
				Promotion pr = new Promotion();
				
				pr.setId(promotion.getId());
				pr.setTitleHeader(promotion.getTitleHeader());
				pr.setNote(promotion.getNote());
				//pr.setRequestBy(promotion.getRequestBy());
				
				if(promotion.getFlagDesign() == 1) {
					//2. untuk save ke dalam tabel promotion_item
					for(PromotionItem pi : promotion.getListPromotionItem()) {
						PromotionItem pi1 = new PromotionItem();
						/*Employee requestPic = new Employee();
						requestPic.setId(pi.getRequestPic().getId());
						*/
						pi1.setId(pi.getId());
						pi1.setPromotion(pr);
						//pi1.setRequestPic(requestPic);
						pi1.setTitle(pi.getTitle());
						pi1.setQty(pi.getQty());
						pi1.setTodo(pi.getTodo());
						pi1.setNote(pi.getNote());
						pi1.setRequestDueDate(pi.getRequestDueDate());
						
						promotionItemDao.update(pi1);
					}
				}
						
				promotionDao.update(pr);
				
				//3. untuk save ke dalam tabel promotion_item_file
				for(PromotionItemFile pif : promotion.getListPromotionItemFile()) {
					PromotionItemFile pif1 = new PromotionItemFile();
					//pif1.setFileName(pif.getFileName());
					pif1.setId(pif.getId());
					pif1.setNote(pif.getNote());
					pif1.setTodo(pif.getTodo());
					pif1.setQty(pif.getQty());
					pif1.setRequestDueDate(pif.getRequestDueDate());
					
					promotionItemFileDao.update(pif1);
				}
	}

	public void approved(Promotion promotion) {
		// TODO Auto-generated method stub
		Promotion prm = new Promotion();
		prm.setId(promotion.getId());
		prm.setStatus(promotion.getStatus());
		
		promotionDao.approved(prm);
	}

	public void rejected(Promotion promotion) {
		// TODO Auto-generated method stub
		Promotion prm = new Promotion();
		prm.setId(promotion.getId());
		prm.setStatus(promotion.getStatus());
		prm.setRejectReason(promotion.getRejectReason());
		
		promotionDao.rejected(prm);
	}

	public void closeRequest(Promotion promotion) {
		// TODO Auto-generated method stub
		Promotion prm = new Promotion();
		prm.setId(promotion.getId());
		prm.setStatus(promotion.getStatus());
		
		promotionDao.closeRequest(prm);
		
		
		if (promotion.getFlagDesign() == 1) {
			for(PromotionItem lpi : promotion.getListPromotionItem()) {
				PromotionItem lpi1 = new PromotionItem();
				
				lpi1.setId(lpi.getId());
				lpi1.setStartDate(lpi.getStartDate());
				lpi1.setEndDate(lpi.getEndDate());
				
				promotionItemDao.closeRequest(lpi1);
			}
		}
		
		
		for(PromotionItemFile lpif : promotion.getListPromotionItemFile()) {
			PromotionItemFile lpif1 = new PromotionItemFile();
			
			lpif1.setId(lpif.getId());
			lpif1.setStartDate(lpif.getStartDate());
			lpif1.setEndDate(lpif.getEndDate());
			
			promotionItemFileDao.closeRequest(lpif1);
		}
	}

	public List<Promotion> search(Promotion searching) {
		// TODO Auto-generated method stub
		return promotionDao.search(searching);
	}
}
