package com.wang.store.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wang.store.domain.Admin;
import com.wang.store.domain.User;
import com.wang.store.service.AdminService;
import com.wang.store.service.impl.AdminServiceImpl;
import com.wang.store.utils.MyBeanUtils;
import com.wang.store.web.base.BaseServlet;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends BaseServlet {
	
	//管理员登录
	public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		
		/*
		 * //1.首先获取提交来的验证码 根据name属性 String verifycode = req.getParameter("verifycode");
		 * 
		 * //2.首先验证码校验 HttpSession session = req.getSession(); String checkcode_server
		 * =(String) session.getAttribute("CHECKCODE_SERVER"); //确保验证码一次性
		 * session.removeAttribute("CHECKCODE_SERVER");
		 * if(!checkcode_server.equalsIgnoreCase(verifycode)){ //2.1验证码不正确 //提示信息
		 * req.setAttribute("msg","验证码错误！"); //2.2跳转登录页面 return "/admin/index.jsp";
		 * 
		 * }
		 */
		 
		
        Admin admin = new Admin();
		MyBeanUtils.populate(admin, req.getParameterMap());
		
		AdminService adminService = new AdminServiceImpl();
		Admin user02 = null; 
		try {
			user02 = adminService.login(admin);
			//登录成功 将用户信息放入session中
			req.getSession().setAttribute("loginUser", user02);
			//重定向到首页
			//resp.sendRedirect("/store/admin/home.jsp");
			resp.sendRedirect(req.getContextPath()+"/admin/home.jsp");
			return null;
		} catch (Exception e) {
			// 登陆失败
			String msg = e.getMessage();
			//向request域中放入失败信息
			req.setAttribute("msg", msg);
			return "/admin/index.jsp";
		}
	}

}
