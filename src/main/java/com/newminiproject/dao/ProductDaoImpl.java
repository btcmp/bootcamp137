package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.xsis.model2.Product;

import javassist.expr.NewArray;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(product);
	}

	@Override
	public List<Product> getAllMahasiswa() {
		// TODO Auto-generated method stub
		//Session session = sessionFactory.getCurrentSession();
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Product prod where prod.isDelete=0";
		List<Product> listProduct = session.createQuery(hql).list(); // dijelaskan bagaimana ini bekerja..
		if(listProduct.isEmpty()) {
			return new ArrayList<>();
		}
		return listProduct;
	}

	@Override
	public Product getproduct(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Product prod where prod.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Product> listProduct = query.list();
		
		if(listProduct.isEmpty()) {
			return new Product();
		}
		return listProduct.get(0);
	}

	@Override
	public void edit(Product product) {
		// TODO Auto-generated method stub
		/*Session session = sessionFactory.getCurrentSession();
		session.update(product);*/
		Session session = sessionFactory.getCurrentSession();
		String hql ="update Product prod set prod.code=?, prod.name=?, prod.description=? where prod.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, product.getCode());
		query.setParameter(1, product.getName());
		query.setParameter(2, product.getDescription());
		query.setParameter(3, product.getId());
		query.executeUpdate();
	}

	@Override
	public void delete(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Product prod set prod.isDelete=1 where prod.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, product.getId());
		query.executeUpdate();
	}

	@Override
	public List<Product> search(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Product prod where prod.name=? or prod.code=? or prod.description=? or prod.createdBy=? or prod.createdDate=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, product.getName());
		query.setParameter(1, product.getCode());
		query.setParameter(2, product.getDescription());
		query.setParameter(3, product.getCreatedBy());
		query.setParameter(4, product.getCreatedDate());
		List<Product> listProduct = query.list();
		if(listProduct.isEmpty()) {
			return new ArrayList<>();
		}
		return listProduct;
	}

	/*@Override
	public void delete() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Product prod set prod.idDelete=1 where prod.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, product.)
	}*/
}
