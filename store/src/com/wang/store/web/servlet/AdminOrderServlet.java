package com.wang.store.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Order;
import com.wang.store.service.OrderService;
import com.wang.store.service.impl.OrderServiceImpl;
import com.wang.store.web.base.BaseServlet;

import net.sf.json.JSONArray;

@WebServlet("/adminOrderServlet")
public class AdminOrderServlet extends BaseServlet {
	
	
	
	
	//查询全部订单
	public String findOrders(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		OrderService orderService = new OrderServiceImpl();
		//接受订单状态的信息
		String st = req.getParameter("state");
		List<Order> list = null;
		if(null==st || "".equals(st)) {
			//获取全部订单
		list = orderService.findAllOrders();
		}else {
			list = orderService.findAllOrders(st);
		}
		
		
		
		
		//放入request域中
		req.setAttribute("allOrders", list);
		//转发
		return "/admin/order/list.jsp";
	}
	
	
	//findOrderByOidWithAjax
	
	//异步请求查看后台的订单详情
	public String findOrderByOidWithAjax(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//获取订单id
		String oid = req.getParameter("id");
		//查询订单项和商品信息
		OrderService orderService = new OrderServiceImpl();
		Order order = orderService.findOrderByOid(oid);
		//将返回的集合转换为json格式的字符串
		String jsonStr =  JSONArray.fromObject(order.getList()).toString();
		//，响直接应客户端
		//设置格式
		resp.setContentType("application/json;charset=utf-8");
		resp.getWriter().println(jsonStr);
		return null;
	}
	
	//updateOrderByOid
	//修改订单状态
	public String updateOrderByOid(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//获取订单的id
		String oid = req.getParameter("oid");
		//查询订单
		OrderService orderService = new OrderServiceImpl();
		Order order = orderService.findOrderByOid(oid);
		//设置订单状态
		order.setState(3);
		//修改订信息
		orderService.updateOrder(order);
		//重定向到查询已经发货
		//resp.sendRedirect("/store/adminOrderServlet?method=findOrders&state=3");
		resp.sendRedirect(req.getContextPath()+"/adminOrderServlet?method=findOrders&state=3");
		return null;
	
	
	}

}
