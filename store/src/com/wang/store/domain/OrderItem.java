package com.wang.store.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderItem {
	
	private String itemid;
	private int quantity;
	private double total;
	//对象对应对象 可以携带更多的数据
	private Product product;
	private Order order;
	@Override
	public String toString() {
		return "OrderItem [itemid=" + itemid + ", quantity=" + quantity + ", total=" + total + ", product=" + product
				+ ", order=" + order + "]";
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	

}
