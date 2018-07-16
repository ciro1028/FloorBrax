package com.ciroamaral.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ciroamaral.entity.Service;

@Repository
public class ServiceDAOImpl implements ServiceDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Service> getServices() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Service> serviceQuery = currentSession.createQuery("from Service s order by s.name", Service.class);
		
		return serviceQuery.getResultList();
	}

	@Override
	public Service getService(String value) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Service> serviceQuery = currentSession.createQuery("from Service e where e.name = '" + value + "'", Service.class);
		
		return serviceQuery.getSingleResult();
	}

	@Override
	public void saveService(Service service) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(service);
	}

	@Override
	public void deleteService(Service service) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(service);
	}

}
