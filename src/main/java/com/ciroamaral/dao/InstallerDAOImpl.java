package com.ciroamaral.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ciroamaral.entity.Installer;
import com.ciroamaral.entity.Order;

@Repository
public class InstallerDAOImpl implements InstallerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Installer> getInstallers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Installer> installerQuery = currentSession.createQuery("from Installer i order by i.name", Installer.class);
		
		return installerQuery.getResultList();
	}

	@Override
	public Installer getInstaller(String field, String value) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Installer> query = currentSession.createQuery("from Installer i where i. " + field + " = :value", Installer.class);
		query.setParameter("value", value);
		
		return query.getSingleResult();
	}

	@Override
	public void saveInstaller(Installer installer) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save installer to db
		currentSession.saveOrUpdate(installer);
	}

	@Override
	public void deleteInstaller(Installer installer) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(installer);
	}

	@Override
	public List<Order> getOrdersByInstallerAndDate(String installerId, String start, String end) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Order o where o.installerId = :id and date between :start and :end", Order.class);
		query.setParameter("id", installerId);
		query.setParameter("start", start);
		query.setParameter("end", end);
		
		return query.getResultList();
	}
	
	

}
