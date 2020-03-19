package com.wang.store.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Cart;
import com.wang.store.domain.CartItem;
import com.wang.store.domain.Product;
import com.wang.store.service.ProductService;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.web.base.BaseServlet;

@WebServlet("/cartServlet")
public class CartServlet extends BaseServlet {
		
	/*
	 * 添加购物车购物项的方法
	 */
	public String addCartItemToCart(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//1、先从session中获取购物车
		Cart cart =(Cart)req.getSession().getAttribute("cart");
		//2.获取不到就创建购物车对象，放到session中
		if(null==cart) {
			cart = new Cart();
			req.getSession().setAttribute("cart", cart);
		}
		//获取到  用即可
		//3、获取到商品的id 和购买的数量
		
		String pid = req.getParameter("pid");
		int num = Integer.parseInt(req.getParameter("quantity"));
		
		//4、通过商品的id查询商品对象
		ProductService ProductService = new ProductServiceImpl();
		Product product= ProductService.findProductByPid(pid);
		//5.获取到代购买的购物项
		CartItem cartItem = new CartItem();
		cartItem.setNum(num);
		cartItem.setProduct(product);
				
		//6.调用购物车上的方法
		cart.addCartItemToCar(cartItem);
		
		//7.重定向到购物车页面 重定向 会丢失request域中的数据，所以会用重定向 解决重复提交
		//resp.sendRedirect("/store/jsp/cart.jsp");
		resp.sendRedirect(req.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
	
	/**
	 * removeCartItem 移除购物项
	 */
	
	
	public String removeCartItem(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//获取待删除商品的id
		String pid = req.getParameter("id");
		//获取购物车
		Cart cart = (Cart)req.getSession().getAttribute("cart");
		//调用购物车中移除商品的方法
		cart.removeCartItem(pid);
		//重定向
		//resp.sendRedirect("/store/jsp/cart.jsp");
		resp.sendRedirect(req.getContextPath()+"/jsp/cart.jsp");
		//不需要转发
		return null;
	}
	
	/**
	 * 清空购物车
	 */
	
	public String clearCart(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//获取购物车
		Cart cart = (Cart)req.getSession().getAttribute("cart");
		//清空购物车
		cart.clearCart();
		//重定向
		//resp.sendRedirect("/store/jsp/cart.jsp");
		resp.sendRedirect(req.getContextPath()+"/jsp/cart.jsp");
		//不需要转发
		return null;
	}
	
	
}
