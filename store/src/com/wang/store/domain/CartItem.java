package com.wang.store.domain;

public class CartItem {
	
	//携带 图片路径 商品路径 商品价格
	private Product product;
	//商品的数量
	private int num;
	//购物车中的价格
	private double subTotal;
	
	//小计可以经过计算的出
	public double getSubTotal() {
		return product.getShop_price()*num;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

}
