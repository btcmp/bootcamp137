package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.MenuAccess;

public interface MenuAccessDao {

	void save(MenuAccess menuAccess);

	List<MenuAccess> getAllMenuAccess();

	void delete(MenuAccess menuAccess);

	MenuAccess getMenuAccessById(int id);

	void update(MenuAccess menuAccess);

}
