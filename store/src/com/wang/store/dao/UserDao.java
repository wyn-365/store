package com.wang.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.wang.store.domain.User;
import com.wang.store.domain.User2;

public interface UserDao {

	void userRegist(User user)throws SQLException;

	User userActive(String code)throws SQLException;

	void update(User user)throws SQLException;

	User userLogin(User user)throws SQLException;

	List<User> findAllUsers()throws SQLException;

	void userRegist2(User2 user2)throws SQLException;

}
