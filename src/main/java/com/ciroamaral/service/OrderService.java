package com.ciroamaral.service;

import java.util.List;

import com.ciroamaral.entity.Order;

public interface OrderService {

	public List<Order> getOrders();
	public Order getOrder(String num);
	public void saveOrder(Order order);
	public List<Order> getTodaysOrders();
	public List<Order> searchOrders(String field, String value);
	public List<Order> getordersByService(String service);
	public List<Order> getOrdersByDate(String start, String end);
}
