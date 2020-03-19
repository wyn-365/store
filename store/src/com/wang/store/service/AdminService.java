package com.wang.store.service;

import java.util.List;

import com.wang.store.domain.Admin;
import com.wang.store.domain.User;

public interface AdminService {

	Admin login(Admin admin) throws Exception;

	List<Admin> finAllAdmin()throws Exception;

	void deleteUserById(String uid)throws Exception;

	User editUserUI(String uid)throws Exception;

	void updateUserById(User user)throws Exception;




}
