package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Role;
	
@Repository
public class RoleDaoImpl implements RoleDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Role role) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(role);
		session.flush();
		//System.out.println("sudah masuk ke role");
	}

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Role ro where ro.isDelete = 0";
		List<Role> listRole = session.createQuery(hql).list();
		if(listRole.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listRole;
	}

	@Override
	public void delete(Role role) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Role ro set ro.isDelete=1 where ro.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", role.getId());
		query.executeUpdate();
	}

	@Override
	public Role getRoleById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Role.class, id);
	}

	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Role ro set ro.name=?, ro.description=? where ro.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, role.getName());
		query.setParameter(1, role.getDescription());
		query.setParameter(2, role.getId());
		query.executeUpdate();
	}

	@Override
	public List<Role> search(Role role) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Role ro where ro.code=:rolecode or ro.name=:rolename or ro.createdBy=:rolecreatedby or ro.createdDate=:rolecreateddate";
		Query query = session.createQuery(hql);
		query.setParameter("rolecode", role.getCode());
		query.setParameter("rolename", role.getName());
		query.setParameter("rolecreatedby", role.getCreatedBy());
		query.setParameter("rolecreateddate", role.getCreatedDate());
		List<Role> listRole = query.list();
		if(listRole.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listRole;
	}

}
