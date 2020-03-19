package com.wang.store.web.servlet;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import com.wang.store.domain.Admin;
import com.wang.store.domain.User;
import com.wang.store.service.AdminService;
import com.wang.store.service.UserService;
import com.wang.store.service.impl.AdminServiceImpl;
import com.wang.store.service.impl.UserServiceImpl;
import com.wang.store.web.base.BaseServlet;


@WebServlet("/adminUserServlet")
public class AdminUserServlet extends BaseServlet {
	
	//点击编辑用户，做一次服务器的空跳转
	//回显用户信息
	public String editUserUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String uid = request.getParameter("uid");
		System.out.println(uid);
		AdminService adminService = new AdminServiceImpl();
		User user = adminService.editUserUI(uid);
		request.setAttribute("user", user);
		return "/admin/user/edit.jsp";
	
	}
	
	//更新用户信息
	public String updateUserById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.设置编码
        request.setCharacterEncoding("utf-8");
        //2.获取map
        //Map<String, String[]> map = request.getParameterMap();
        //System.out.println(map);
        
        String uid = request.getParameter("uid");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String birthday = request.getParameter("birthday");
        String sex = request.getParameter("sex");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String state = request.getParameter("state");
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
      
      
        
        
		/*
		 * try { BeanUtils.populate(user,map);
		 * 
		 * } catch (IllegalAccessException e) { e.printStackTrace(); } catch
		 * (InvocationTargetException e) { e.printStackTrace(); }
		 */
        //4.调用Service修改
        AdminService adminService = new AdminServiceImpl();
        adminService.updateUserById(user);
		
        //response.sendRedirect(request.getContextPath()+ "/admin/user/list.jsp");
       // return null;
        response.sendRedirect(request.getContextPath()+"/adminUserServlet?method=findAllUsers");
		
		 return null;
	}
	
	

	//根据id删除用户
	public String deleteUserById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//接受参数id
		String uid = request.getParameter("uid");
		System.out.println(uid);
		AdminService adminService = new AdminServiceImpl();
		adminService.deleteUserById(uid);
		// response.sendRedirect(request.getContextPath()+ "/admin/user/list.jsp");
		response.sendRedirect(request.getContextPath()+"/adminUserServlet?method=findAllUsers");
		
		 return null;
		
	}

	//后台查询所有的用户
	public String findAllUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	//调用业务层查询所有
		UserService userService = new UserServiceImpl();
		List<User> list = userService.finAllUsers();
		
		request.setAttribute("users", list);

		return "/admin/user/list.jsp";

    }
		
	//查询所有的管理员
	public String findAllAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//调用业务层查询所有
				AdminService adminService = new AdminServiceImpl();
				List<Admin> list2 = adminService.finAllAdmin();
				
				request.setAttribute("admin", list2);

				return "/admin/user/list2.jsp";


    }
}
