
package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Promotion;
import com.newminiproject.model.PromotionItemFile;

public interface PromotionItemFileDao {

	void save(PromotionItemFile promotionItemFile);

	List<PromotionItemFile> getPromotionItemFileByPromotion(Promotion promotion);

	void update(PromotionItemFile pif1);

	void closeRequest(PromotionItemFile lpif1);

}
