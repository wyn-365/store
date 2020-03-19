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
import com.wang.store.utils.JedisUtils;
import com.wang.store.web.base.BaseServlet;

import net.sf.json.JSONArray;
import redis.clients.jedis.Jedis;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/categoryServlet")
public class CategoryServlet extends BaseServlet {
		
	//ajax
	public String findAllCats(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		//首先在redis中获取全部分类
		Jedis jedis = JedisUtils.getJedis();
		String jsonStr = jedis.get("allCats");
		if(null == jsonStr || "".equals(jsonStr)) {
			//redis中没有数据
			//调用业务等的获取全部分类
			CategoryService categoryService = new CategoryServiceImpl(); 
			List<Category> list = categoryService.getAllCats();
			//把集合转换为json格式的数据
			jsonStr = JSONArray.fromObject(list).toString();
			
			//向redis缓存中添加数据
			jedis.set("allCats",jsonStr);
			
			System.out.println("redis缓存中没有分类条目的数据，查询的是数据库的数据！");
			
			//响应客户端json格式的数据
			resp.setContentType("application/json;charset=utf-8");
			resp.getWriter().print(jsonStr);
		}else {
			
			System.out.println("redis缓存中有分类的数据，查询的是redis缓存中的数据！");
			//响应客户端json格式的数据
			resp.setContentType("application/json;charset=utf-8");
			resp.getWriter().print(jsonStr);
		}
		
		//释放资源
		JedisUtils.closeJedis(jedis);
		return null;
	}
	

}
