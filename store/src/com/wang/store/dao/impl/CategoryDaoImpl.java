package com.wang.store.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.store.dao.CategoryDao;
import com.wang.store.domain.Category;
import com.wang.store.utils.JDBCUtils;

public class CategoryDaoImpl implements CategoryDao {
	
	/*
	 * 查询分类
	 */
	@Override
	public List<Category> getAllCats() throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * from category";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return  qr.query(sql, new BeanListHandler<Category>(Category.class));
		
	}
	
	//添加分类信息
	@Override
	public void addCategory(Category c) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into category values(?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,c.getCid(),c.getCname());
	}
	
	//删除分类
	@Override
	public void deleteCategory(String cid) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from category where cid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,cid);
		
	}

}
