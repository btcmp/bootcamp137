package com.newminiproject.dao;

import java.util.List;

import com.newminiproject.model.Product;


public interface ProductDao {

	void save(Product product);

	List<Product> getAllMahasiswa();

	Product getproduct(int id);

	void edit(Product product);

	void delete(Product product);

	List<Product> search(Product product);

}
