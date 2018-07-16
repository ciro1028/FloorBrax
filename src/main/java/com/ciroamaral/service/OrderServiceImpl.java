package com.ciroamaral.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciroamaral.dao.OrderDAO;
import com.ciroamaral.entity.Order;

@Service	
public class OrderServiceImpl implements OrderService {

	
	// inject orderDAO
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	@Transactional
	public List<Order> getOrders() {
		return orderDAO.getOrders();
	}

	@Override
	@Transactional
	public Order getOrder(String num) {
		return orderDAO.getOrder(num);
	}

	@Override
	@Transactional
	public void saveOrder(Order order) {
		orderDAO.saveOrder(order);
	}

	@Override
	@Transactional
	public List<Order> getTodaysOrders() {
		
		return orderDAO.getTodaysOrders();
	}

	@Override
	@Transactional
	public List<Order> searchOrders(String field, String value) {
		return orderDAO.searchOrders(field, value);
	}

	@Override
	@Transactional
	public List<Order> getordersByService(String service) {
		return orderDAO.getordersByService(service);
	}

	@Override
	@Transactional
	public List<Order> getOrdersByDate(String start, String end) {
		return orderDAO.getOrdersByDate(start, end);
	}
}
