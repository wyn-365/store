package com.wang.store.service.impl;

import java.util.List;

import com.wang.store.dao.CommentDao;
import com.wang.store.dao.impl.CommentDaoImpl;
import com.wang.store.domain.Comment;
import com.wang.store.service.CommentService;

public class CommentServiceImpl implements CommentService {
	
	//提交留言
	@Override
	public void submitComment(Comment c) throws Exception {
		// TODO Auto-generated method stub
		CommentDao commentDao = new CommentDaoImpl();
		commentDao.submitComment(c);
	}
	
	//查询所有的评论
	@Override
	public List<Comment>  findAllComment() throws Exception {
		// TODO Auto-generated method stub
		CommentDao commentDao = new CommentDaoImpl();
		return commentDao.findAllComent();
	}
	
	//根据id删除留言
	@Override
	public void deleteComment(int id) throws Exception {
		// TODO Auto-generated method stub
		CommentDao commentDao = new CommentDaoImpl();
		commentDao.deleteComment(id);
	}

}
