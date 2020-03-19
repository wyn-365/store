package com.wang.store.dao;

import java.util.List;

import com.wang.store.domain.Category;

public interface CategoryDao {

	List<Category> getAllCats() throws Exception;

	void addCategory(Category c)throws Exception;

	void deleteCategory(String cid)throws Exception;

}
