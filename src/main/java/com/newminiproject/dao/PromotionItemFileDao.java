package com.newminiproject.dao;

import java.util.List;

import com.xsis.training146.model.Promotion;
import com.xsis.training146.model.PromotionItemFile;

public interface PromotionItemFileDao {

	void save(PromotionItemFile promotionItemFile);

	List<PromotionItemFile> getPromotionItemFileByPromotion(Promotion promotion);

}
