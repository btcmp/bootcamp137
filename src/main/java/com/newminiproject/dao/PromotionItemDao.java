package com.newminiproject.dao;

import java.util.List;

import com.xsis.training146.model.Promotion;
import com.xsis.training146.model.PromotionItem;

public interface PromotionItemDao {

	void save(PromotionItem promotionItem);

	List<PromotionItem> getPromotionItemByPromotion(Promotion promotion);

}
