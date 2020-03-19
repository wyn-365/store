package com.wang.store.dao.impl;

import java.sql.Date;
import java.util.List;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.store.dao.AdminDao;
import com.wang.store.domain.Admin;
import com.wang.store.domain.User;
import com.wang.store.utils.JDBCUtils;

public class AdminDaoImpl implements AdminDao {
	//管理员登录
	@Override
	public Admin login(Admin admin) throws Exception {
		String sql = "select * from admin where username = ? and password = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<Admin>(Admin.class),admin.getUsername(),admin.getPassword());
		
	}
	
	//查询苏哟有的管理员
	@Override
	public List<Admin> findAllAdmin() throws Exception {
		String sql = "select * from admin";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Admin>(Admin.class));
		
	}
	
	//删除用户更根据id
	@Override
	public void deleteUserById(String uid) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from user where uid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,uid);
		
	}
	
	//回显用户信息
	@Override
	public User editUserUI(String uid) throws Exception {
		String sql = "select * from user where uid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<User>(User.class),uid);
	}
	
	//更新用户信息
	@Override
	public void updateUserById(User user) throws Exception {
		// TODO Auto-generated method stub
		
		String sql = "update user set username = ?,password = ? ,name = ? , email = ? , telephone = ?, birthday = ?, sex=?, state=? where uid =? ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		
		Object[] params = {user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getUid()};
		
		qr.update(sql, params);
		
		System.out.println("您所修改用户的id是："+user.getUid());
	}
	
}


