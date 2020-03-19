package com.wang.store.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//两个属性  三个方法
public class Cart {
	
	//总价格
	private double total;
	//个数不确定的购物项  商品的pid CartItem
	Map<String,CartItem> map = new HashMap<String,CartItem>();
	
	//添加购物车
	public void  addCartItemToCar(CartItem cartItem) {
		//获取
		String pid = cartItem.getProduct().getPid();
		
		if(map.containsKey(pid)) {
			//获取去原来的购物项
			CartItem oldItem = map.get(pid);
			oldItem.setNum(oldItem.getNum()+cartItem.getNum());
		}else {
			map.put(pid, cartItem);
		}
	}
	
	//返回map中所有的值
	public Collection<CartItem> getCartItems() {
		return map.values();
	}
	
	//移除购物项
	public void removeCartItem(String pid) {
		map.remove(pid);
	}
	//清空购物车
	public void clearCart() {
		map.clear();
	}
	//获取总金额
	public double getTotal() {
		//获取所有的购物项
		total = 0;
		Collection<CartItem> values = map.values();
		for(CartItem cartItem : values) {
			total += cartItem.getSubTotal();
		}
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Map<String, CartItem> getMap() {
		return map;
	}
	public void setMap(Map<String, CartItem> map) {
		this.map = map;
	}
	
}
