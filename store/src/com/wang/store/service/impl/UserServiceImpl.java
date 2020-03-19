package com.wang.store.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.wang.store.dao.AdminDao;
import com.wang.store.dao.UserDao;
import com.wang.store.dao.impl.AdminDaoImpl;
import com.wang.store.dao.impl.UserDaoImpl;
import com.wang.store.domain.Admin;
import com.wang.store.domain.User;
import com.wang.store.domain.User2;
import com.wang.store.service.UserService;

public class UserServiceImpl implements UserService{

	@Override
	public void userRegist(User user) throws SQLException {
		// 实现注册功能
		UserDao UserDao = new UserDaoImpl();
		UserDao.userRegist(user);
	}
	
	/**
	 * 激活账号的操作
	 * @throws SQLException 
	 */
	@Override
	public boolean userActive(String code) throws SQLException {
		// 激活账号
		UserDao UserDao = new UserDaoImpl();
		User user = UserDao.userActive(code);
		if(null!=user) {
			//可以根据激活码查询到用户
			//修改用户的状态  先更新Javabean的实体类也就是内存中的数据
			user.setState(1);
			//清除激活码
			user.setCode(null);
			//对数据库执行一次真是的更新操作
			UserDao.update(user);
			return true;	
		}else {
			//根据激活码没有查到用户，激活失败
			return false;
		}
	
	}
	
	/*
	 * 用户登陆的功能
	 */
	@Override
	public User userLogin(User user) throws SQLException {
		// 利用异常在模块之间传递数据
		UserDao UserDao = new UserDaoImpl();
		User uu = UserDao.userLogin(user);
		if(null == uu) {
			//密码不正确
			throw new RuntimeException("密码不正确！");
		}else if(uu.getState()==0) {
			//用户没有激活
			throw new RuntimeException("用户未激活！");
		}else {
			return uu;
		}
		
	}
	
	//查询所有的用户【后台】
	@Override
	public List<User> finAllUsers() throws SQLException {
		// TODO Auto-generated method stub
		UserDao UserDao = new UserDaoImpl();
		return UserDao.findAllUsers();
	}

	@Override
	public void userRegist2(User2 user2) throws Exception {
		UserDao UserDao = new UserDaoImpl();
		UserDao.userRegist2(user2);
		
	}



}
