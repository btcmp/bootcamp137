package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.PromotionItemDao;
import com.newminiproject.model.Promotion;
import com.newminiproject.model.PromotionItem;


@Transactional
@Service
public class PromotionItemService {

	@Autowired
	PromotionItemDao promotionItemDao;
	
	public void saveitem(PromotionItem promotionItem) {
		// TODO Auto-generated method stub
		promotionItemDao.save(promotionItem);
	}

	public List<PromotionItem> getPromotionItemByPromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		List<PromotionItem> listPromotionItem = promotionItemDao.getPromotionItemByPromotion(promotion);
		return listPromotionItem;
	}

}
