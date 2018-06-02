package com.newminiproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newminiproject.model.Souvenir;
import com.newminiproject.model.Unit;

@Repository
public class SouvenirDaoImpl implements SouvenirDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Souvenir souvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(souvenir);
	}

	public List<Unit> getAllUnit() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Souvenir.class).list();
	}

	public List<Souvenir> getAllSouvenir() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Souvenir sv where sv.isDelete=0";
		List<Souvenir> listSouvenir = session.createQuery(hql).list();
		if (listSouvenir.isEmpty()) {
			return new ArrayList<>();
		}
		
		return listSouvenir;
	}

	@Override
	public Souvenir getSouvenirById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Souvenir sv where sv.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Souvenir> listSouvenir = query.list();
		
		if (listSouvenir.isEmpty()) {
			return new Souvenir();
		}
		return listSouvenir.get(0);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Souvenir sv set sv.isDelete=1 where sv.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.executeUpdate();
	}

	@Override
	public void update(Souvenir souvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Souvenir sv set sv.code=?, sv.mUnitId=?, sv.name=?, sv.description=?, sv.updatedDate=? where sv.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, souvenir.getCode());
		query.setParameter(1, souvenir.getmUnitId());
		query.setParameter(2, souvenir.getName());
		query.setParameter(3, souvenir.getDescription());
		query.setParameter(4, souvenir.getUpdatedDate());
		query.setParameter(5, souvenir.getId());
		query.executeUpdate();
	}

	@Override
	public List<Souvenir> search(Souvenir souvenir) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Souvenir sv where sv.code=:souvenircode or sv.name=:souvenirname or sv.createdDate=:createddate";
		Query query = session.createQuery(hql);
		query.setParameter("souvenircode", souvenir.getCode());
		query.setParameter("souvenirname", souvenir.getName());
		query.setParameter("createddate", souvenir.getCreatedDate());
		List<Souvenir> listSouvenir = query.list();
		if (listSouvenir.isEmpty()) {
			return new ArrayList<>();
		}
		return listSouvenir;
	}

}
