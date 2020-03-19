package com.wang.store.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Category;
import com.wang.store.domain.Product;
import com.wang.store.domain.User;
import com.wang.store.service.CategoryService;
import com.wang.store.service.ProductService;
import com.wang.store.service.impl.CategoryServiceImpl;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.web.base.BaseServlet;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/indexServlet")
public class IndexServlet extends BaseServlet {
	
	
	
	//findProductLike
	public String findProductLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取查询的关键字
		//String search = request.getParameter("search_like");
		request.setCharacterEncoding("utf-8");
		ProductService productService = new ProductServiceImpl();
		Map<String, String[]> condition = request.getParameterMap();
		List<Product> list = productService.findProductLike(condition);
		//吧查询到的集合放入到request域中
		 request.setAttribute("productlike", list);
	     request.setAttribute("condition",condition);//将查询条件存入request
		return "/jsp/product_like.jsp";
	
	}
	
	//查询最新最热的商品
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//查询最新商品 调用业务层的功能 查询最新最热
		ProductService productService = new ProductServiceImpl();
		List<Product> list01 = productService.findHots();
		List<Product> list02 = productService.findNews();
		List<Product> list03 = productService.findSale();
		
		//获取全部分类信息
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list = categoryService.getAllCats();
		//放入request
		request.setAttribute("allCats", list);
	
		//把两个集合放入rewquest域中
		request.setAttribute("hots", list01);
		request.setAttribute("news", list02);
		request.setAttribute("sale", list03);
		//咋混发到首页
		return "/jsp/index.jsp";
	}
}
