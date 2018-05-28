package com.newminiproject.dao;

import java.util.List;

import com.miniproject.xsis.model.Employee;

public interface EmployeeDao {

	public List<Employee> getAll() ;

	public void save(Employee employee);

	public Employee getEmployeeByID(int id);

	public void update(Employee employee);

	public void delete(int id);
}
