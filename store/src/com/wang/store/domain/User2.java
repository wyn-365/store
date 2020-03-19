package com.wang.store.domain;

public class User2 {
    private int id;
    private String username;
    private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User2(int id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}
	public User2() {
		super();
	}
	@Override
	public String toString() {
		return "User2 [id=" + id + ", username=" + username + ", password=" + password + "]";
	}
    
}
