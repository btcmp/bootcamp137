package com.newminiproject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newminiproject.dao.ProductDao;
import com.newminiproject.model.Product;


@Transactional
@Service
public class ProductService {

	@Autowired
	ProductDao productDao;
	
	public void save(Product product) {
		// TODO Auto-generated method stub
		product.setCreatedDate(new Date());
		productDao.save(product);
	}

	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return productDao.getAllMahasiswa();
	}

	public Product getproduct(int id) {
		// TODO Auto-generated method stub
		return productDao.getproduct(id);
	}

	public void edit(Product product) {
		// TODO Auto-generated method stub
		productDao.edit(product);
	}

	public void delete(Product product) {
		// TODO Auto-generated method stub
		productDao.delete(product);
	}

	public List<Product> search(Product product) {
		// TODO Auto-generated method stub
		return productDao.search(product);
	}

}
