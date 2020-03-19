package com.wang.store.service;

import java.sql.SQLException;
import java.util.List;

import com.wang.store.domain.Admin;
import com.wang.store.domain.User;
import com.wang.store.domain.User2;

public interface UserService {


	void userRegist(User user)throws SQLException;

	boolean userActive(String code)throws SQLException;

	User userLogin(User user)throws SQLException;

	List<User> finAllUsers()throws SQLException;

	void userRegist2(User2 user2)throws Exception;



	

}
