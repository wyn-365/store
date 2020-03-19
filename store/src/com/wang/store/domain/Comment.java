package com.wang.store.domain;

import java.util.Date;

public class Comment {
	
	private int id;
	private String uid;
	private String name;
	private int phone;
	private String email;
	private String comment;
	private Date cdate;
	private User user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", uid=" + uid + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", comment=" + comment + ", cdate=" + cdate + ", user=" + user + "]";
	}
	public Comment(int id, String uid, String name, int phone, String email, String comment, Date cdate, User user) {
		super();
		this.id = id;
		this.uid = uid;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.comment = comment;
		this.cdate = cdate;
		this.user = user;
	}
	public Comment() {
		super();
	}
	
	
	

}
