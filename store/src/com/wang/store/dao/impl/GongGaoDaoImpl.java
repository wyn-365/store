package com.wang.store.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.store.dao.GongGaoDao;
import com.wang.store.domain.Category;
import com.wang.store.domain.GongGao;
import com.wang.store.utils.JDBCUtils;

public class GongGaoDaoImpl implements GongGaoDao {
	//查询所有的公告
	@Override
	public List<GongGao> finfGongGao() throws Exception {
		// TODO Auto-generated method stub
				String sql = "select * from gonggao order by id desc limit 0 , 9";
				QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
				return  qr.query(sql, new BeanListHandler<GongGao>(GongGao.class));
	}
	
	//添加公告
	@Override
	public void findGong(GongGao gongGao) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into gonggao values(?,?,?)";
		System.out.println(gongGao.getContent());
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,gongGao.getId(),gongGao.getTitle(),gongGao.getContent());
		
	}
	
	//删除公告信息
	@Override
	public void deleteGongGao(int ids) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from gonggao where id = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,ids);
		
	}

}
