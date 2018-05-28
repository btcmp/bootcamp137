package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.xsis.dao.EmployeeDao;
import com.miniproject.xsis.model.Employee;

@Transactional
@Service
public class EmployeeService {
	@Autowired
	EmployeeDao employeeDao;
	
	public List<Employee> getAll() {
		return employeeDao.getAll();
	}

	public void save(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.save(employee);
	}

	public Employee getEmployeeById(int id) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeeByID(id);
	}

	public void update(Employee employee) {
		// TODO Auto-generated method stub
		employee.setUpdatedDate(new Date());
		employeeDao.update(employee);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		employeeDao.delete(id);
	}

}
