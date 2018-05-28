package com.newminiproject.dao;

import java.util.List;

import com.marcomplace.model.Menu;

public interface MenuDao {

	void save(Menu menu);

	List<Menu> getAllMenu();

	void delete(Menu menu);

	Menu getMenuById(int id);

	void update(Menu menu);

	List<String> findMenuByUsername(String username);

	List<Menu> search(Menu menu);

}
