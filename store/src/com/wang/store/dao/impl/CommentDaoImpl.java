package com.wang.store.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.store.dao.CommentDao;
import com.wang.store.domain.Comment;
import com.wang.store.domain.Product;
import com.wang.store.utils.JDBCUtils;

public class CommentDaoImpl implements CommentDao {
	
	//提交的留言插入数据库
	@Override
	public void submitComment(Comment c) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into comment values(?,?,?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {c.getId(),c.getUid(),c.getName(),c.getEmail(),c.getPhone(),c.getComment(),c.getCdate()};
		qr.update(sql,params);
	}
	
	//查询所有的放评论
	@Override
	public List<Comment> findAllComent() throws Exception {
		String sql = "select * from comment order by cdate desc ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Comment>(Comment.class));
		
	}
	
	//根据id删除留言
	@Override
	public void deleteComment(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from comment where id =? ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}

}
