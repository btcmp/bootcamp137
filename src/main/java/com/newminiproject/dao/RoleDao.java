package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Role;

public interface RoleDao {

	void save(Role role);

	List<Role> getAllRole();

	void delete(Role role);

	Role getRoleById(int id);

	void update(Role role);

	List<Role> search(Role role);

}
