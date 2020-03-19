package com.wang.store.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.PageBean;
import com.wang.store.domain.Product;
import com.wang.store.service.ProductService;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.utils.CookieUtil;
import com.wang.store.web.base.BaseServlet;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/productServlet")
public class ProductServlet extends BaseServlet {
		

	
		//查看导航品详情
		public String findProductByPid(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			//获取商品的pid
			String pid = request.getParameter("pid");
			//吧商品放入到request域中
			ProductService productService = new ProductServiceImpl();
			Product product = productService.findProductByPid(pid);
			request.setAttribute("product", product);
			//转发页面
			return "/jsp/product_info.jsp";					
	}
		
		//查询导航下的商品分类findProductsByCidWithPage
		public String findProductsByCidWithPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			//获取 cid num 当前页
			String cid = request.getParameter("cid");
			int curNum = Integer.parseInt(request.getParameter("num"));
			//调用业务层
			ProductService productService = new ProductServiceImpl();
			PageBean pm = productService.findProductsByCidWithPage(cid,curNum);
			//放到request域对象中
			request.setAttribute("page", pm);
			//转发页面
			return "/jsp/product_list.jsp";	
		}
		

}
