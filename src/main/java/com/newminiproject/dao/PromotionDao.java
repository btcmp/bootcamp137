package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Event;
import com.newminiproject.model.Promotion;


public interface PromotionDao {

	void save(Promotion promotion);

	List<Event> getAll();

	List<Promotion> getAllPromotion();

	Promotion getPromotionById(int id);

	void update(Promotion pr);

	void approved(Promotion prm);

	void rejected(Promotion prm);

	void closeRequest(Promotion prm);

}
