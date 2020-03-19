package com.wang.store.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.wang.store.dao.OrderDao;
import com.wang.store.dao.impl.OrderDaoImpl;
import com.wang.store.domain.Order;
import com.wang.store.domain.OrderItem;
import com.wang.store.domain.PageBean;
import com.wang.store.domain.User;
import com.wang.store.service.OrderService;
import com.wang.store.utils.JDBCUtils;

public class OrderServiceImpl implements OrderService {
	
	OrderDao orderDao = new OrderDaoImpl();
	/**
	 * 保存订单和订单下所有的订单项
	 * @throws SQLException 
	 */
	@Override
	public void saveOrder(Order order) throws SQLException {
		//  保存订单和订单下所有的订单项【必须同时成功，或者同时失败哦】 开启事务
	/*try {
		//开启事务
		JDBCUtils.startTransaction();
		OrderDao orderDao = new OrderDaoImpl();
		//存储订单
		orderDao.saveOrder(order);
		for(OrderItem item:order.getList()) {
			//存储订单项
			orderDao.saveOrderItem(item);
		}
		JDBCUtils.commitAndClose();
	}catch(Exception e){
		JDBCUtils.rollbackAndClose();	
	}
	}*/
		
		Connection conn = null;
		try {
			//获取连接
			conn = JDBCUtils.getConnection();
			//开启事务
			conn.setAutoCommit(false);
			//保存订单	
			orderDao.saveOrder(conn,order);//保证同一个连接
			//保存所有的订单项
			for(OrderItem item:order.getList()) {
				//存储订单项
				orderDao.saveOrderItem(conn,item);
			}
			//提交
			conn.commit();
		}catch(Exception e) {
			//回滚事务
			conn.rollback();	
		} /*
			 * finally { if(null!=conn) { conn.close(); conn=null;//加快回收 } }
			 */	
	}
	
	
	/**
	 * 查询我的订单  带有分页的效果
	 */
	@Override
	public PageBean findMyOrdersWithPage(User user, int curNum) throws Exception {
		// 创建pageBean对象 计算并且携带参数
		//查询订单某一个用户的订单where uid = ?
		int totalRecords = orderDao.getTotalRecords(user);
		PageBean pm = new PageBean(curNum,totalRecords,3);
		//关联集合
		List list = orderDao.findMyOrdersWithPage(user,pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		////关联url
		pm.setUrl("orderServlet?method=findMyOrdersWithPage");
		return pm;
	}

	/**
	 * 根据订单的id查询订单
	 */
	@Override
	public Order findOrderByOid(String oid) throws Exception {
		// 调用dao
		return orderDao.findOrderByOid(oid);

	}

	
	/**
	 * 完成支付
	 */
	@Override
	public void updateOrder(Order order) throws Exception {
		// 
		orderDao.updateOrder(order);
	}

	/**
	 * 查询全部订单
	 */
	@Override
	public List<Order> findAllOrders() throws Exception {
		// TODO Auto-generated method stub
		
		return orderDao.findAllOrders();
	}

	//查询不同状态的订单中
	@Override
	public List<Order> findAllOrders(String st) throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findAllOrders(st);
	}

	//支付完成之后削减库存的数量同时增加销售数量
	@Override
	public void cutNum(int quantity,String pid) throws Exception {
		// TODO Auto-generated method stub
		orderDao.cutNum(quantity,pid);
		
	}

}
