package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.dao.UserDao;
import com.newminiproject.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<User> getAll() {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		String hql = "from User us where us.isDelete =0";
		List<User> listUser= session.createQuery(hql).list();
		if(listUser.isEmpty()) {
			return new ArrayList<>();
		}
		return listUser;
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		session.save(user);
		session.flush();
	}

	public User getUserById(User user) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		
		String hql = "from User us where us.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", user.getId());
		List<User> listUser= query.list();
		if(listUser.isEmpty()) {
			return new User();
		}
		return listUser.get(0);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		session.update(user);
	}

	public void delete(User usr) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		String hql = "update User us set us.isDelete = 1 where us.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", usr.getId());
		query.executeUpdate();
	}

	@Override
	public User findUserByUsername(String username) {
		// TODO Auto-generated method stub
		String hql="from User us where us.username= :usr";
		Session session= sessionFactory.getCurrentSession();
		Query query= session.createQuery(hql);
		query.setParameter("usr", username);
		List<User> listUser= query.list();
		if(listUser.isEmpty()) {
			return new User();
		}
		return listUser.get(0);
	}

}

