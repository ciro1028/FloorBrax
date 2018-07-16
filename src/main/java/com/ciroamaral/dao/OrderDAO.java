package com.ciroamaral.dao;

import java.util.List;

import com.ciroamaral.entity.Order;

public interface OrderDAO {

	public List<Order> getOrders();
	public Order getOrder(String num);
	public List<Order> searchOrders(String field, String value);
	public void saveOrder(Order order);
	public List<Order> getTodaysOrders();
	public List<Order> getordersByService(String service);
	public List<Order> getOrdersByDate(String start, String end);
}
