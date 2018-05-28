package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Employee employee) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(employee);
	}

	@Override
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where isDelete=0";
		List<Employee> listEmployee= session.createQuery(hql).list();
		if(listEmployee.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listEmployee;
	}

}
