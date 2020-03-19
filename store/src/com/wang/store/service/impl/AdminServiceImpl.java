package com.wang.store.service.impl;

import java.util.List;

import com.wang.store.dao.AdminDao;
import com.wang.store.dao.UserDao;
import com.wang.store.dao.impl.AdminDaoImpl;
import com.wang.store.dao.impl.UserDaoImpl;
import com.wang.store.domain.Admin;
import com.wang.store.domain.User;
import com.wang.store.service.AdminService;

public class AdminServiceImpl implements AdminService {

	@Override
	public Admin login(Admin admin) throws Exception {
		AdminDao adminDao = new AdminDaoImpl();
		Admin uu = adminDao.login(admin);
		if(null == uu) {
			//密码不正确
			throw new RuntimeException("用户名或者密码不正确！");
		}else {
			return uu;
		}
		
	}
	
	//查询所有的管理员
	@Override
	public List<Admin> finAllAdmin() throws Exception {
		// TODO Auto-generated method stub
		AdminDao adminDao = new AdminDaoImpl();
		return adminDao.findAllAdmin();
	
	}
	
	//删除用户根据id
	@Override
	public void deleteUserById(String uid) throws Exception {
		// TODO Auto-generated method stub
		AdminDao adminDao = new AdminDaoImpl();
	    adminDao.deleteUserById(uid);
		
	}
	
	//回显用户信息
	@Override
	public User editUserUI(String uid) throws Exception {
		// TODO Auto-generated method stub
		AdminDao adminDao = new AdminDaoImpl();
		
		return adminDao.editUserUI(uid);
	}
	
	//更新用户信息
	@Override
	public void updateUserById(User user) throws Exception {
		// TODO Auto-generated method stub
		AdminDao adminDao = new AdminDaoImpl();
		adminDao.updateUserById(user);
	}

}
