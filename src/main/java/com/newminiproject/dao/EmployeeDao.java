package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Employee;

public interface EmployeeDao {

	void save(Employee employee);

	List<Employee> getAll();

}
