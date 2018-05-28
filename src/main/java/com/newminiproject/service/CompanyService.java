package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.CompanyDao;
import com.newminiproject.model.Company;
import com.newminiproject.model.Employee;

@Transactional
@Service
public class CompanyService {
	
	@Autowired
	CompanyDao m_companyDao;

	public void save(Company m_company) {
		m_companyDao.save(m_company);
	}
	
	public List<Company> getAll(){
		return m_companyDao.getAll();
	}

	public void update(Company company) throws Exception {
		// TODO Auto-generated method stub
		company.setUpdateDate(new Date());
		m_companyDao.update(company);
		
	}
	
	/*public void getNexVal() {
		m_companyDao.getNexVal();
	}*/

	public Company getCompanyById(int id) {
		// TODO Auto-generated method stub
		return m_companyDao.getCompanyById(id);
	}

	public void delete(Company cpy) {
		// TODO Auto-generated method stub
		m_companyDao.delete(cpy);
	}

	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		return m_companyDao.getAllEmployee();
	}

	public List<Company> search(Company company) {
		// TODO Auto-generated method stub
		return m_companyDao.search(company);
	}
}
