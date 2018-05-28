package com.newminiproject.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Company;
import com.newminiproject.model.Employee;


@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Company m_company) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(m_company);
	}

	public List<Company> getAll() {
		// TODO Auto-generated method stub
		/*Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Company.class).list();*/
		Session session  = sessionFactory.getCurrentSession();
		String hql = "from Company it where it.isDelete =0";//jika stock item = 0 maka item tidak nampil
		List<Company> listCompany = session.createQuery(hql).list();
		if(listCompany.isEmpty()) {
			return new ArrayList<>();
		}
		return listCompany;
		
		//return session.createCriteria(Items.class).list();
	}

	public void update(Company company) {
		// TODO Auto-generated method stub
		/*Session session = sessionFactory.getCurrentSession().createQuery("")
		session.update(company);*/
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Company it set it.code=?, it.email=?, it.phone=?, it.name=?, it.address=?, it.updateDate=?, it.updateBy=? where it.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, company.getCode());
		query.setParameter(1, company.getEmail());
		query.setParameter(2, company.getPhone());
		query.setParameter(3, company.getName());
		query.setParameter(4, company.getAddress());
		query.setParameter(5, company.getUpdateDate());
		query.setParameter(6, company.getUpdateBy());
		query.setParameter(7, company.getId());
		query.executeUpdate();
		/*PreparedStatement ps = null;
		ps.setString(1, company.getCode());
		ps.setString(2, company.getEmail());
		ps.setString(3, company.getPhone());
		ps.setString(4, company.getName());
		ps.setString(5, company.getAddress());
		ps.setInt(6, company.getId());*/
	}
	
	/*public void getNexVal() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "next_val as id_val from seqEmployee for update";
		Query query = session.createQuery(hql);
		System.out.println("ini "+query);
	}*/

	public Company getCompanyById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Company.class,id);
	}

	public void getNexVal() {
		// TODO Auto-generated method stub
		
	}

	public void delete(Company cpy) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Company ist set ist.isDelete = 1 where ist.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", cpy.getId());
		query.executeUpdate();
		
	}

	@Override
	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		Session sessuin = sessionFactory.getCurrentSession();
		
		return sessuin.createCriteria(Employee.class).list();
	}


	public List<Company> search(Company company) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Company ro where ro.code=:code or ro.name=:name or ro.createBy=:createdby or ro.createDate=:createDate";
		Query query = session.createQuery(hql);
		query.setParameter("code", company.getCode());
		query.setParameter("name", company.getName());
		query.setParameter("createdby", company.getCreateBy());
		query.setParameter("createDate", company.getcreateDate());
		List<Company> listCompany= query.list();
		if(listCompany.isEmpty()) {
			return new ArrayList<>();
		}
		return listCompany;
	}
	
	

}
