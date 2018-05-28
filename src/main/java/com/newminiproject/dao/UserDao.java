package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.User;

public interface UserDao {

	List<User> getAll();

	void save(User user);

	User getUserById(int id);

	void update(User user);

	void delete(User usr);

	User findUserByUsername(String username);

}
