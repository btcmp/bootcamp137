package com.newminiproject.dao;


import java.util.List;

import com.newminiproject.model.Promotion;
import com.newminiproject.model.PromotionItem;


public interface PromotionItemDao {

	void save(PromotionItem promotionItem);

	List<PromotionItem> getPromotionItemByPromotion(Promotion promotion);

	void update(PromotionItem pi1);

}
