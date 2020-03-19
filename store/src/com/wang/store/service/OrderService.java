package com.wang.store.service;

import java.util.List;

import com.wang.store.domain.Order;
import com.wang.store.domain.PageBean;
import com.wang.store.domain.User;

public interface OrderService {

	void saveOrder(Order order) throws Exception;

	PageBean findMyOrdersWithPage(User user, int curNum)throws Exception;

	Order findOrderByOid(String oid)throws Exception;

	void updateOrder(Order order)throws Exception;

	List<Order> findAllOrders()throws Exception;

	List<Order> findAllOrders(String st)throws Exception;

	void cutNum(int quantity,String pid)throws Exception;

	

}
