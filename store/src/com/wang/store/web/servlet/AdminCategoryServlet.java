package com.wang.store.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Category;
import com.wang.store.service.CategoryService;
import com.wang.store.service.impl.CategoryServiceImpl;
import com.wang.store.utils.UUIDUtils;
import com.wang.store.web.base.BaseServlet;

@WebServlet("/adminCategoryServlet")
public class AdminCategoryServlet extends BaseServlet {
	
	public String findAllCats(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//获取全部分类信息
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list = categoryService.getAllCats();
		//放入request
		req.setAttribute("allCats", list);
		//转发页面		
		return "/admin/category/list.jsp";
	}
		
	//空的跳转
	public String addCategoryUI(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return "/admin/category/add.jsp";
	
	}
	
	//addCategory
	//添加分类
	public String addCategory(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//获取分类名称
		String cname = req.getParameter("cname");
		//创分类的id
		String id = UUIDUtils.getId();
		Category c = new Category();
		c.setCid(id);
		c.setCname(cname);
		//调用业务成
		CategoryService categoryService = new CategoryServiceImpl();
		categoryService.addCategory(c);
		//重定向查询所有分类信息
		//resp.sendRedirect("/store/adminCategoryServlet?method=findAllCats");	
		resp.sendRedirect(req.getContextPath()+"/adminCategoryServlet?method=findAllCats");
		return null;
	
	}
	
	//删除分类
	public String deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CategoryService categoryService = new CategoryServiceImpl();
		//获取分类id
		String cid = req.getParameter("cid");
		categoryService.deleteCategory(cid);
		//resp.sendRedirect("/store/adminCategoryServlet?method=findAllCats");
		resp.sendRedirect(req.getContextPath()+"/adminCategoryServlet?method=findAllCats");
		return null;
	}
}
