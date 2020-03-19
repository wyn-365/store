package com.wang.store.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.store.dao.UserDao;
import com.wang.store.domain.Product;
import com.wang.store.domain.User;
import com.wang.store.domain.User2;
import com.wang.store.utils.JDBCUtils;

public class UserDaoImpl implements UserDao{

	@Override
	public void userRegist(User user) throws SQLException {
		// 实现注册
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into user values (?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getCode()};
		
		qr.update(sql,params);
	}
	
	/**
	 * 激活用户
	 * @throws SQLException 
	 */
	@Override
	public User userActive(String code) throws SQLException {
		// 激活用户
		String sql = "select * from user  where code = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		User user = qr.query(sql, new BeanHandler<User>(User.class),code);
		return user;
	}
	/*
	 * 激活用户 【 更新数据库中的数据】
	 * @throws SQLException 
	 */
	@Override
	public void update(User user) throws SQLException {
		// 更新用户中的激活状态信息
		String sql ="update user set username=?,password=?,name=?,email=?,telephone=?,birthday=?,sex=?,state=?,code=? where uid=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params= {user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getCode(),user.getUid()};
		qr.update(sql,params);
	}
	
	/*
	 * 用户登录实现
	 */
	@Override
	public User userLogin(User user) throws SQLException {
		// 用户登录
		String sql = "select * from user where username = ? and password = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<User>(User.class),user.getUsername(),user.getPassword());
		
		
	}
	
	//查询所有的用户
	@Override
	public List<User> findAllUsers() throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<User>(User.class));
		
	}
    
	
	//md5
	@Override
	public void userRegist2(User2 user2) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into user2 values (?,?,?)";
		Object[] params = {null,user2.getUsername(),user2.getPassword()};
		
		qr.update(sql,params);
		
	}

}
