package com.wang.store.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Category;
import com.wang.store.domain.Comment;
import com.wang.store.domain.GongGao;
import com.wang.store.domain.Product;
import com.wang.store.service.CategoryService;
import com.wang.store.service.CommentService;
import com.wang.store.service.ProductService;
import com.wang.store.service.GongGaoService;
import com.wang.store.service.impl.CategoryServiceImpl;
import com.wang.store.service.impl.CommentServiceImpl;
import com.wang.store.service.impl.GongGaoServiceImpl;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.utils.UUIDUtils;
import com.wang.store.web.base.BaseServlet;

/**
 * Servlet implementation class Index02
 */
@WebServlet("/index02Servlet")
public class Index02Servlet extends BaseServlet {

    GongGao gongGao = new GongGao();
    GongGaoService gongGaoService = new GongGaoServiceImpl();
    
    //后台根据id删除评论
    public String  deleteComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String ids = request.getParameter("id");
    	int id=Integer.parseInt(ids);
    	CommentService commentService = new CommentServiceImpl();
    	commentService.deleteComment(id);

    	response.sendRedirect(request.getContextPath()+"/index02Servlet?method=adminfindAllComment");
		return null;
    
    } 
    //后台查询所有的留言
    public String  adminfindAllComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	//查询所有用户的留言
    	 CommentService commentService = new CommentServiceImpl();
    	 List<Comment> comment = commentService.findAllComment();
    	 request.setAttribute("comments",comment);
    	//跳转
    	 return "/admin/comment/list.jsp";
    }
    
    
    //跳转用户留言的界面	//查询所有用户的留言
    public String  comment(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    
    	 CommentService commentService = new CommentServiceImpl();
    	 List<Comment> comment = commentService.findAllComment();
    	 request.setAttribute("comments",comment);
    	//跳转
    	
    	return "/jsp/comment.jsp";
    }
    
    //提交留言
    
   public String submitComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Comment c = new Comment();
    	//获取用户留言的信息
	   String uid = request.getParameter("uid");
	   String name = request.getParameter("name");
	   String email=request.getParameter("email");
	   String phones = request.getParameter("phone");
	   String comment = request.getParameter("comment");
	   c.setId(UUIDUtils.getNum());
	   c.setCdate(new Date());
	   
	   
	   c.setUid(uid);
	   c.setEmail(email);
	   c.setComment(comment);
	   c.setName(name);
	   int phone = Integer.parseInt(phones);
	   c.setPhone(phone);
	   
	   //调用业务层
	   CommentService commentService = new CommentServiceImpl();
	   commentService.submitComment(c);
    	//跳转
	   response.sendRedirect(request.getContextPath()+"/index02Servlet?method=index02UI");
		return null;
    }
    
    //根据id删除高能广告信息
    public String  deleteGongGao(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	//获取公告的id
    	String id= request.getParameter("id");
    	int ids= Integer.parseInt(id);
    	gongGaoService.deleteGongGao(ids);
    	
    	
    	response.sendRedirect(request.getContextPath()+"/index02Servlet?method=adminFindGongGao");
		return null;
	
	}
    
    
	//添加加公告
	public String  addGongGao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/admin/gonggao/add.jsp";
	
	}
	//真实地添加公告
	public String  addGong(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//获取提交的数据
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int id = UUIDUtils.getNum();
		gongGao.setId(id);
		gongGao.setTitle(title);
		gongGao.setContent(content);
		System.out.println(id);
		System.out.println(title);
		System.out.println(content);
		//调用业务层
		gongGaoService.addGong(gongGao);
		
		response.sendRedirect(request.getContextPath()+"/index02Servlet?method=adminFindGongGao");
		return null;
	
	}
	
	
	//后台查询所有的公告
	public String adminFindGongGao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<GongGao> list04 = gongGaoService.findGongGao();
		request.setAttribute("gonggao", list04);
		return "/admin/gonggao/list.jsp";
	}
	
	public String index02UI(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	        //查询最新商品 调用业务层的功能 查询最新最热
			ProductService productService = new ProductServiceImpl();
			GongGaoService gongGaoService = new GongGaoServiceImpl();
			
			List<Product> list01 = productService.findHots();
			List<Product> list02 = productService.findNews();
			List<Product> list03 = productService.findSale();
			//查询公告信息
			
			List<GongGao> list04 = gongGaoService.findGongGao();
			
			//获取全部分类信息
			CategoryService categoryService = new CategoryServiceImpl();
			List<Category> list = categoryService.getAllCats();
			//放入request
			request.setAttribute("allCats", list);
		
			//把两个集合放入rewquest域中
			request.setAttribute("hots", list01);
			request.setAttribute("news", list02);
			request.setAttribute("sale", list03);
			request.setAttribute("gonggao", list04);
			return "/jsp/index03.jsp";

           }
	}
