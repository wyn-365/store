package com.wang.store.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Product;
import com.wang.store.service.ProductService;
import com.wang.store.service.impl.ProductServiceImpl;


@WebServlet("/findProductServlet")
public class FindProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProductService productService = new ProductServiceImpl();
		Map<String, String[]> condition = request.getParameterMap();
		List<Product> list;
		try {
			list = productService.findProductLike(condition);
			//吧查询到的集合放入到request域中
			 request.setAttribute("productlike", list);
		     request.setAttribute("condition",condition);//将查询条件存入request
		     request.getRequestDispatcher("/jsp/product_like.jsp").forward(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
