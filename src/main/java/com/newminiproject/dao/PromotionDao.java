package com.newminiproject.dao;

import java.util.List;

import com.xsis.training146.model.Event;
import com.xsis.training146.model.Promotion;

public interface PromotionDao {

	void save(Promotion promotion);

	List<Event> getAll();

	List<Promotion> getAllPromotion();

	Promotion getPromotionById(int id);

}
