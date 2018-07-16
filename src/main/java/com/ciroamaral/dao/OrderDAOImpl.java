package com.ciroamaral.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ciroamaral.entity.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {

	// inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Order> getOrders() {
		
		// get hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create query
		Query<Order> orderQuery = currentSession.createQuery("from Order", Order.class);
		
		// execute query and get result list
		List<Order> orders = orderQuery.getResultList();
		
		return orders;
	}
	
	@Override
	public List<Order> getTodaysOrders() {
		// get hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// create query
				Query<Order> orderQuery = currentSession.createQuery("from Order where date = CURDATE()", Order.class);
				
				// execute query and get result list
				List<Order> orders = orderQuery.getResultList();
				
				return orders;
	}

	@Override
	public Order getOrder(String num) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> orderQuery = currentSession.createQuery("from Order o where o.orderNum = '" + num + "'", Order.class);
		
		return orderQuery.getSingleResult();
	}


	@Override
	public void saveOrder(Order order) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(order);;
		
	}

	@Override
	public List<Order> searchOrders(String field, String value) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Order o where o." + field + " = '" +  value + "'", Order.class);
//		query.setParameter("field", field);
//		query.setParameter("value", value);
		List<Order> orders = query.getResultList();
		return orders;
	}

	@Override
	public List<Order> getordersByService(String service) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Order o where o.services like :service", Order.class);
		query.setParameter("service", "%" + service + "%");
		return query.getResultList();
	}

	@Override
	public List<Order> getOrdersByDate(String start, String end) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Order o where o.date between :start and :end", Order.class);
		query.setParameter("start", start);
		query.setParameter("end", end);
		return query.getResultList();
	}
	
}
