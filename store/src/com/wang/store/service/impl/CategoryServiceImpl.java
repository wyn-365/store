package com.wang.store.service.impl;

import java.util.List;

import com.wang.store.dao.CategoryDao;
import com.wang.store.dao.impl.CategoryDaoImpl;
import com.wang.store.domain.Category;
import com.wang.store.service.CategoryService;
import com.wang.store.utils.JedisUtils;

import redis.clients.jedis.Jedis;

public class CategoryServiceImpl implements CategoryService {

	CategoryDao categoryDao = new CategoryDaoImpl();
	@Override
	public List<Category> getAllCats() throws Exception {
		// TODO Auto-generated method stub
		return  categoryDao.getAllCats();
		
	}
	
	//添加分类信息
	@Override
	public void addCategory(Category c) throws Exception {
		// mysql中插入数据
		categoryDao.addCategory(c);
		
		//更新redis缓存数据
		Jedis jedis = JedisUtils.getJedis();
		
		jedis.del("allCats");
		
		JedisUtils.closeJedis(jedis);
	}
	
	//删除分类的方法
	@Override
	public void deleteCategory(String cid) throws Exception {
		// TODO Auto-generated method stub
		categoryDao.deleteCategory(cid);
	}

}
