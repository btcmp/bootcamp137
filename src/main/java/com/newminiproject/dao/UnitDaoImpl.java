package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Unit;

@Repository
public class UnitDaoImpl implements UnitDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Unit unit) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(unit);
		session.flush();
		//System.out.println("sudah masuk ke unit");
	}

	@Override
	public List<Unit> getAllUnit() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Unit un where un.isDelete = 0";
		List<Unit> listUnit = session.createQuery(hql).list();
		if(listUnit.isEmpty()) {
			return new ArrayList<>();
		}
		return listUnit;
	}

	@Override
	public void delete(Unit unit) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Unit un set un.isDelete=1 where un.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", unit.getId());
		query.executeUpdate();
	}

	@Override
	public Unit getUnitById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Unit.class, id);
	}

	@Override
	public void update(Unit unit) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Unit un set un.name=?, un.description=? where un.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, unit.getName());
		query.setParameter(1, unit.getDescription());
		query.setParameter(2, unit.getId());
		query.executeUpdate();
	}

	@Override
	public List<Unit> search(Unit unit) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Unit un where un.code=:unitcode or un.name=:unitname or un.createdBy=:unitcreatedby or un.createdDate=:unitcreateddate";
		Query query = session.createQuery(hql);
		query.setParameter("unitcode", unit.getCode());
		query.setParameter("unitname", unit.getName());
		query.setParameter("unitcreatedby", unit.getCreatedBy());
		query.setParameter("unitcreateddate", unit.getCreatedDate());
		List<Unit> listUnit = query.list();
		if(listUnit.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listUnit;
	}

}
