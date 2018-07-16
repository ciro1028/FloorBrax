package com.ciroamaral.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ciroamaral.entity.Subdivision;

@Repository
public class SubdivisionDAOImpl implements SubdivisionDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Subdivision> getSubdivisions() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Subdivision> subdivisionQuery = currentSession.createQuery("from Subdivision s order by s.name", Subdivision.class);
		
		return subdivisionQuery.getResultList();
	}

	@Override
	public Subdivision getSubdivision(String field, String value) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Subdivision> subdivisionQuery = currentSession.createQuery("from Subdivision s where s." + field + " = '" + value + "'", Subdivision.class);
		
		Subdivision subdivision = subdivisionQuery.getSingleResult();

		return subdivision;
	}

	@Override
	public void saveSubdivision(Subdivision subdivision) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(subdivision);
	}

	@Override
	public void deleteSubdivision(Subdivision subdivision) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(subdivision);
	}

}
