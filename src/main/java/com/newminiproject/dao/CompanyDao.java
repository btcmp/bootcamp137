package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Company;
import com.newminiproject.model.Employee;

public interface CompanyDao {
void save(Company m_company);
	
	List<Company> getAll();

	void update(Company company) throws Exception;

	Company getCompanyById(int id);
	public void getNexVal();

	void delete(Company cpy);

	List<Employee> getAllEmployee();

	List<Company> search(Company company);
}