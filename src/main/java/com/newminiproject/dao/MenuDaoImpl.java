package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Menu;

@Repository
public class MenuDaoImpl implements MenuDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Menu menu) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(menu);
		session.flush();
		//System.out.println("Sudah masuk ke menu");
	}

	@Override
	public List<Menu> getAllMenu() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Menu me where me.isDelete = 0";
		List<Menu> listMenu = session.createQuery(hql).list();
		if(listMenu.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listMenu;
	}

	@Override
	public void delete(Menu menu) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Menu me set me.isDelete=1 where me.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", menu.getId());
		query.executeUpdate();
	}

	@Override
	public Menu getMenuById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Menu.class, id); //get berdasarkan model
	}

	@Override
	public void update(Menu menu) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Menu me set me.name=?, me.controller=?, me.parentId=? where me.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, menu.getName());
		query.setParameter(1, menu.getController());
		query.setParameter(2, menu.getParentId());
		query.setParameter(3, menu.getId());
		query.executeUpdate();
	}

	@Override
	public List<String> findMenuByUsername(String username) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql= "select distinct(mn.CONTROLLER) from M_MENU_ACCESS mr\r\n" + 
				"join M_ROLE rl  \r\n" + 
				"on mr.M_ROLE_ID = rl.ID\r\n" + 
				"join user_roles ur\r\n" + 
				"on mr.M_ROLE_ID = ur.M_ROLE_ID\r\n" + 
				"join M_MENU mn\r\n" + 
				"on mr.M_MENU_ID = mn.ID\r\n" + 
				"join M_USER us\r\n" + 
				"on ur.M_USER_ID = us.ID\r\n" + 
				"where us.USERNAME =:username";
		Query query= session.createSQLQuery(sql);
		query.setParameter("username", username);
		List<String> menus= query.list();
		if(menus.isEmpty()) {
			return new ArrayList<>();
		}
		return menus;
	}

	@Override
	public List<Menu> search(Menu menu) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Menu me where me.code=:menucode or me.name=:menuname or me.createdBy=:menucreatedby or me.createdDate=:menucreateddate";
		Query query = session.createQuery(hql);
		query.setParameter("menucode", menu.getCode());
		query.setParameter("menuname", menu.getName());
		query.setParameter("menucreatedby", menu.getCreatedBy());
		query.setParameter("menucreateddate", menu.getCreatedDate());
		List<Menu> listMenu = query.list();
		if(listMenu.isEmpty()) {
			return new ArrayList<>();
		}
		return listMenu;
	}

}
