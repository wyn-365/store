package com.wang.store.dao.impl;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.wang.store.dao.OrderDao;
import com.wang.store.domain.Order;
import com.wang.store.domain.OrderItem;
import com.wang.store.domain.Product;
import com.wang.store.domain.User;
import com.wang.store.utils.JDBCUtils;

public class OrderDaoImpl implements OrderDao {

	@Override
	public void saveOrder(Connection conn, Order order) throws Exception {
		// 插入订单
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		QueryRunner qr = new QueryRunner();
		Object[] params= {order.getOid(),order.getOrderTime(),order.getTotal(),order.getState(),order.getAddress(),order.getName(),order.getTelephone(),order.getUser().getUid()};
		qr.update(conn,sql,params);
		
	}

	@Override
	public void saveOrderItem(Connection conn, OrderItem item) throws Exception {
		// 插入订单项
		String sql = "insert into orderitem values(?,?,?,?,?)";
		QueryRunner qr = new QueryRunner();
		Object[] params= {item.getItemid(),item.getQuantity(),item.getTotal(),item.getProduct().getPid(),item.getOrder().getOid()};
		qr.update(conn,sql,params);
	}

	@Override
	public int getTotalRecords(User user) throws Exception {
		// 查询我的订单 带有分页的查询
		String sql ="select count(*) from orders where uid =?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql,new ScalarHandler(),user.getUid() );
		return num.intValue();
	}

	@Override
	public List findMyOrdersWithPage(User user, int startIndex, int pageSize) throws Exception {
		// 查询我的所有的订单 在当前页 分页
		String sql = "select * from orders where uid = ? limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		List<Order> list =qr.query(sql, new BeanListHandler<Order>(Order.class),user.getUid(),startIndex,pageSize);
		
		//遍历查询订单所有项目
		for(Order order : list) {
			//获取每一笔订单的id  查询每一笔订单的订单项  以及订单项目对应的商品信息
			String oid = order.getOid();
			sql = "select * from orderItem o,product p where o.pid = p.pid and oid = ?";
			List<Map<String,Object>> list02 = qr.query(sql, new MapListHandler(),oid);
			//遍历
			for(Map<String,Object> map : list02) {
				OrderItem orderItem = new OrderItem();
				Product product = new Product();
				
				//创阿金时间转换器哦
				DateConverter dt  = new DateConverter();
				dt.setPattern("yyyy-MM-dd");
				ConvertUtils.register(dt, java.util.Date.class);
				
				//将map中属于orderITEM和product的数据填充到对象上去
				BeanUtils.populate(orderItem, map);
				BeanUtils.populate(product, map);
				//让每个点单项和商品发生关系
				orderItem.setProduct(product);
				//让每个订单项存入订单下的结合中
				order.getList().add(orderItem);
				
			}
		}
		
		return list;
	}
	
	/**
	 * 根据订单的id查询订单 
	 */
	@Override
	public Order findOrderByOid(String oid) throws Exception {
		String sql = "select * from orders where oid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Order order = qr.query(sql, new BeanHandler<Order>(Order.class),oid);
		
		//根据id查询订单下所有的订单项和所有对应的商品
		sql = "select * from orderItem o,product p where o.pid = p.pid and oid = ?";
		List<Map<String,Object>> list02 = qr.query(sql, new MapListHandler(),oid);
		//遍历
		for(Map<String,Object> map : list02) {
			OrderItem orderItem = new OrderItem();
			Product product = new Product();
			
			//创建时间转换器
			DateConverter dt  = new DateConverter();
			dt.setPattern("yyyy-MM-dd");
			ConvertUtils.register(dt, java.util.Date.class);
			
			//将map中属于orderItem和product的数据填充到对象上去
			BeanUtils.populate(orderItem, map);
			BeanUtils.populate(product, map);
			
			//让每个点单项和商品发生关系
			orderItem.setProduct(product);
			
			//让每个订单项存入订单下的结合中
			order.getList().add(orderItem);
			
		}	
		return order;
	}
	
	
	/**
	 * 支付过程需要插入的联系人的地址等信息
	 */
	@Override
	public void updateOrder(Order order) throws Exception {
		// 
		String sql = "update orders set ordertime=?,total=?,state=?,address=?,name=?,telephone=? where oid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params= {order.getOrderTime(),order.getTotal(),order.getState(),order.getAddress(),order.getName(),order.getTelephone(),order.getOid()};
		qr.update(sql,params);
	}
	
	
	/*
	 * 查询全部订单后台
	 */
	@Override
	public List<Order> findAllOrders() throws Exception {
		String sql = "select * from orders";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Order>(Order.class));
		
	}
	
	/**
	 * 查询不同状态的订单
	 */
	@Override
	public List<Order> findAllOrders(String st) throws Exception {
		String sql = "select * from orders where state = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Order>(Order.class),st);
		
	}
	
	//完成支付后的商品数量的减少 和销售数量的增加
	@Override
	public void cutNum(int quantity,String pid) throws Exception {
		// TODO Auto-generated method stub
		String sql="UPDATE product SET pnumber=pnumber-?,psale=psale+? WHERE pid =?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		
		qr.update(sql,quantity,quantity,pid);
		
	}

}
