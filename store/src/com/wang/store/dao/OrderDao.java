package com.wang.store.dao;

import java.sql.Connection;
import java.util.List;

import com.wang.store.domain.Order;
import com.wang.store.domain.OrderItem;
import com.wang.store.domain.User;

public interface OrderDao {



	void saveOrder(Connection conn, Order order)throws Exception;

	void saveOrderItem(Connection conn, OrderItem item)throws Exception;

	int getTotalRecords(User user)throws Exception;

	List findMyOrdersWithPage(User user, int startIndex, int pageSize)throws Exception;

	Order findOrderByOid(String oid)throws Exception;

	void updateOrder(Order order)throws Exception;

	List<Order> findAllOrders()throws Exception;

	List<Order> findAllOrders(String st)throws Exception;

	void cutNum(int quantity,String pid)throws Exception;

}
