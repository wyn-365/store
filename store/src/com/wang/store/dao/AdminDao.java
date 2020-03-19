package com.wang.store.dao;

import java.util.List;

import com.wang.store.domain.Admin;
import com.wang.store.domain.User;

public interface AdminDao {

	Admin login(Admin admin) throws Exception;

	List<Admin> findAllAdmin()throws Exception;

	void deleteUserById(String uid)throws Exception;

	User editUserUI(String uid)throws Exception;

	void updateUserById(User user)throws Exception;

	

	

}
