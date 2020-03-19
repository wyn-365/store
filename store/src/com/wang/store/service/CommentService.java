package com.wang.store.service;

import java.util.List;

import com.wang.store.domain.Comment;

public interface CommentService {

	void submitComment(Comment c) throws Exception;

	List<Comment>  findAllComment()throws Exception;

	void deleteComment(int id)throws Exception;

}
