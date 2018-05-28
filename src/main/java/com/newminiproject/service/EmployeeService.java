package com.newminiproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.EmployeeDao;
import com.newminiproject.model.Employee;

@Transactional
@Service
public class EmployeeService {
	
	@Autowired
	EmployeeDao employeeDao;

	public void save(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.save(employee);
	}

	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeDao.getAll();
	}

}
