package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.xsis.model.Employee;


@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Employee> getAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee emp where emp.isDelete =0"; //view yg is deletenya 0
		List<Employee> listEmployee = session.createQuery(hql).list();
		if(listEmployee.isEmpty()){
			return new ArrayList<Employee>();
		}
		return listEmployee;
	}

	public void save(Employee employee) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(employee);
	}

	public Employee getEmployeeByID(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee e where e.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Employee> listEmployee = query.list();
		if(listEmployee.isEmpty()) {
			return new Employee();
		}
			return listEmployee.get(0);
	}

	public void update(Employee employee) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Employee emp set emp.code=?, emp.mCompanyId=?, emp.firstName=?, emp.lastName=?, emp.email=? where emp.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, employee.getCode());
		query.setParameter(1, employee.getmCompanyId());
		query.setParameter(2, employee.getFirstName());
		query.setParameter(3, employee.getLastName());
		query.setParameter(4, employee.getEmail());
		query.setParameter(5, employee.getId());
		
		query.executeUpdate();
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql ="update Employee emp set emp.isDelete =1 where emp.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.executeUpdate();
		
	}

}
