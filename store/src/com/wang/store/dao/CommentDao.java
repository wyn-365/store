package com.wang.store.dao;

import java.util.List;

import com.wang.store.domain.Comment;

public interface CommentDao {

	void submitComment(Comment c)throws Exception;

	List<Comment> findAllComent()throws Exception;

	void deleteComment(int id)throws Exception;

}
