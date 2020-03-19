package com.wang.store.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.wang.store.domain.User;

/**
 * Servlet Filter implementation class PriviledgeFilter
 */
@WebFilter(urlPatterns={"/jsp/cart.jsp","/jsp/order_info.jsp","/jsp/order_list.jsp","/jsp/product_list.jsp","/jsp/product_info.jsp"})
public class PriviledgeFilter implements Filter {

    public PriviledgeFilter() {

    }


	public void destroy() {

	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//判断当前的session，是否存在已经登陆成功的用户
		HttpServletRequest myReq = (HttpServletRequest)request;
		User user = (User)myReq.getSession().getAttribute("loginUser");
		
		//存在就可以放行
		if(null!=user) {
			chain.doFilter(request, response);
		}else {
			//不存在转发到提示页面
			myReq.setAttribute("msg", "请您登陆之后再来访问吧！！！");
			myReq.getRequestDispatcher("/jsp/info.jsp").forward(request,response);
		}
		
		
	}
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
