package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training146.dao.PromotionItemFileDao;
import com.xsis.training146.model.Promotion;
import com.xsis.training146.model.PromotionItemFile;

@Transactional
@Service
public class PromotionItemFileService {

	@Autowired
	PromotionItemFileDao promotionItemFileDao;

	public void save(PromotionItemFile promotionItemFile) {
		// TODO Auto-generated method stub
		promotionItemFileDao.save(promotionItemFile);
	}

	public List<PromotionItemFile> getPromotionItemFileByPromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		List<PromotionItemFile> listPromotionItemFile = promotionItemFileDao.getPromotionItemFileByPromotion(promotion);
		return listPromotionItemFile;
	}
	
}
