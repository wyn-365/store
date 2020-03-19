package com.wang.store.service;

import java.util.List;

import com.wang.store.domain.Category;

public interface CategoryService {
	
	List<Category> getAllCats() throws Exception;

	void addCategory(Category c) throws Exception;

	void deleteCategory(String cid)throws Exception;

	

}
