package com.wang.store.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.wang.store.domain.Category;
import com.wang.store.domain.Product;
import com.wang.store.domain.User;
import com.wang.store.domain.User2;
import com.wang.store.service.AdminService;
import com.wang.store.service.CategoryService;
import com.wang.store.service.ProductService;
import com.wang.store.service.UserService;
import com.wang.store.service.impl.AdminServiceImpl;
import com.wang.store.service.impl.CategoryServiceImpl;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.service.impl.UserServiceImpl;
import com.wang.store.utils.MD5Utils;
import com.wang.store.utils.MailUtils;
import com.wang.store.utils.MyBeanUtils;
import com.wang.store.utils.UUIDUtils;
import com.wang.store.web.base.BaseServlet;


@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {
	
	public String index02UI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 注册时候做了一次空的跳转到双11会场
		
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
		return "/jsp/index03.jsp";
	}
	
	
	public String centerUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 注册时候做了一次空的跳转
		return "/admin/user/center.jsp";
	}

	public String registUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 注册时候做了一次空的跳转
		return "/jsp/register.jsp";
	}

	
	public String loginUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/jsp/login.jsp";
	}
	
	//修改用户
	public String editUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 
		String uid = request.getParameter("uid");
		System.out.println(uid);
		String username =request.getParameter("username");
        String password = request.getParameter("password");
        String birthday = request.getParameter("birthday");
        String sex = request.getParameter("sex");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        //3.封装对象
        User user = new User();
        user.setUid(uid);
        user.setUsername(username);
        user.setPassword(password);
        
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String dstr=birthday;
        Date date=(Date) sdf.parse(dstr);
        user.setBirthday(date);
     
        user.setSex(sex);
        user.setName(name);
        user.setEmail(email);
        user.setTelephone(telephone); 
        user.setState(1);
        //4.调用Service修改
        AdminService adminService = new AdminServiceImpl();
        adminService.updateUserById(user);
       
        return "/admin/user/center.jsp";
	
	}
	
	
	//userRegist用户的注册
	public String userRegist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.首先获取提交来的验证码 根据name属性
        String verifycode = request.getParameter("verifycode");

        //2.首先验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        //确保验证码一次性
        session.removeAttribute("CHECKCODE_SERVER");
        if(!checkcode_server.equalsIgnoreCase(verifycode)){
            //2.1验证码不正确
            //提示信息
            request.setAttribute("msg","验证码错误！");
            //2.2跳转登录页面
            return "/jsp/register.jsp";

        }
		
		
		// 接收表单参数
		Map<String,String[]> map = request.getParameterMap();
		User user = new User();//实用BeanUtils工具类封装数据
		MyBeanUtils.populate(user, map);//首先转换日期格式 反射
		//为用户的uid属性赋值
		user.setUid(UUIDUtils.getId());
		//默认为未激活
		user.setState(0);
		//设置生成激活码
		user.setCode(UUIDUtils.getCode());
		System.out.println(user);

		//调用业务层
		UserService  UserService = new UserServiceImpl();
		try {
			UserService.userRegist(user);
			//注册成功，
			//向邮箱发送信息，
			MailUtils.sendMail(user.getEmail(), user.getCode());
			//跳转页面
			request.setAttribute("msg", "用户注册成功，请激活！！");
	
		} catch (Exception e) {
			//注册失败，跳转页面
			request.setAttribute("msg", "用户注册失败，请重新注测！！");
		}
		
		return "/jsp/info.jsp";
	}
	
	/*
	 * 激活用户
	 * @throws SQLException 
	 */
	public String active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		// 获取激活码
		String code = request.getParameter("code");
		//调用业务层的激活功能
		UserService UserService = new UserServiceImpl();
		//激活的信息提示
		boolean flag = UserService.userActive(code);
		if(flag==true) {
			//激活成功 向request域中存放提示信息，转发发到登录页面
			request.setAttribute("msg", "您已经激活成功，请登录账号！！！");
			return "/jsp/login.jsp";
		}else {
			//激活失败
			request.setAttribute("msg", "您激活失败，请重新激活账号！！！");
			return ".jsp/info.jsp";
		}


	}
	
	/*
	 * 用户登录的方法
	 */
/*
	//index02的登录
	public String userLogin02(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.首先获取提交来的验证码 根据name属性
        String verifycode = request.getParameter("verifycode");

        //2.首先验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        //确保验证码一次性
        session.removeAttribute("CHECKCODE_SERVER");
        if(!checkcode_server.equalsIgnoreCase(verifycode)){
            //2.1验证码不正确
            //提示信息
            request.setAttribute("msg","验证码错误！");
            //2.2跳转登录页面
            return "/jsp/index03.jsp";
        }else {
        	
        

		//获取用户数据 用户名和密码
		User user = new User();
		MyBeanUtils.populate(user, request.getParameterMap());
		//调用业务层的登陆功能
		UserService UserService = new UserServiceImpl();
		User user02 = null; 
		try {
			user02 = UserService.userLogin(user);
			//登录成功 将用户信息放入session中
			request.getSession().setAttribute("loginUser", user02);
			//重定向到首页
			//response.sendRedirect("/store/jsp/index02.jsp");
			//待解决response.sendRedirect(request.getContextPath()+"/indexServlet");
			response.sendRedirect(request.getContextPath()+"/jsp/index03.jsp");
			return "null";
		} catch (Exception e) {
			// 登陆失败
			String msg = e.getMessage();
			//向request域中放入失败信息
			request.setAttribute("msg", msg);
			
			return "/jsp/index03.jsp";
		}
	}
	}
	*/
	//index的登录
	public String userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.首先获取提交来的验证码 根据name属性
        String verifycode = request.getParameter("verifycode");

        //2.首先验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        //确保验证码一次性
        session.removeAttribute("CHECKCODE_SERVER");
        if(!checkcode_server.equalsIgnoreCase(verifycode)){
            //2.1验证码不正确
            //提示信息
            request.setAttribute("msg","验证码错误！");
            //2.2跳转登录页面
            return "/jsp/login.jsp";

        }
		
		
		
		//获取用户数据 用户名和密码
		User user = new User();
		MyBeanUtils.populate(user, request.getParameterMap());
		//调用业务层的登陆功能
		UserService UserService = new UserServiceImpl();
		User user02 = null; 
		try {
			user02 = UserService.userLogin(user);
			//登录成功 将用户信息放入session中
			request.getSession().setAttribute("loginUser", user02);
			//重定向到首页
			//response.sendRedirect("/store/index.jsp");
			//return null;
			 response.sendRedirect(request.getContextPath()+"/indexServlet");
			 return null;
		} catch (Exception e) {
			// 登陆失败
			String msg = e.getMessage();
			//向request域中放入失败信息
			request.setAttribute("msg", msg);
			
			return "/jsp/login.jsp";
		}
		
	}

	
	
	/*
	 * 用户退出功能
	 */
	public String logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//清除session
		request.getSession().invalidate();
		//重定向到首页
		//response.sendRedirect("/store/index.jsp");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return null;
	}
	
	
	//测试userRegist用户的注册 MD5加密
	public String userRegist2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 接收表单参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//调用MD5加密生成方法
		String md5Password = MD5Utils.md5(password);
		
		User2 user2 = new User2();//实用BeanUtils工具类封装数据
		
		user2.setUsername(username);
		user2.setPassword(md5Password);
		
		System.out.println(user2);

		//调用业务层
		UserService  userService = new UserServiceImpl();
		
		userService.userRegist2(user2);
	
		return "/jsp/info.jsp";
	}
	

}
