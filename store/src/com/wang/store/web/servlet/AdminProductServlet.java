package com.wang.store.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.wang.store.domain.Category;
import com.wang.store.domain.PageBean;
import com.wang.store.domain.Product;
import com.wang.store.service.CategoryService;
import com.wang.store.service.ProductService;
import com.wang.store.service.impl.CategoryServiceImpl;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.utils.UUIDUtils;
import com.wang.store.utils.UploadUtils;
import com.wang.store.web.base.BaseServlet;

/**
 * Servlet implementation class AdminProductServlet
 */
@WebServlet("/adminProductServlet")
public class AdminProductServlet extends BaseServlet {
	
	//上架商品
	public String shangJia(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String pid = req.getParameter("pid");
	
		
		ProductService productService = new ProductServiceImpl();
		Product product = new Product();
		product.setPflag(0);
		
		productService.shangJia(pid);
		
		req.setAttribute("product", product);
	
		//resp.sendRedirect("/store/adminProductServlet?method=findAllProductsWithPage&num=1");
		resp.sendRedirect(req.getContextPath()+"/adminProductServlet?method=findAllProductsWithPage&num=1");
		return null;
	
	}
	
	//下架商品
	public String xiaJia(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//获取要下架商品的id
		//req.getParameter()
		//调用业务层s
		//获取商品的pid
		String pid = req.getParameter("pid");
		System.out.println("执行到这里了");
		//吧商品放入到request域中
		ProductService productService = new ProductServiceImpl();
		Product product = new Product();
		product.setPflag(1);
		
		productService.xiaJia(pid);	
		req.setAttribute("product", product);
		
		//resp.sendRedirect("/store/adminProductServlet?method=findAllProductsWithPage&num=1");
		resp.sendRedirect(req.getContextPath()+"/adminProductServlet?method=findAllProductsWithPage&num=1");
		return null;
	}
	
	// 查询所有下架的商品
		public String findAllPutDownProductsWithPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//获取当前页
		int curNum = Integer.parseInt(req.getParameter("num"));
		//调用业务层
		ProductService produceService = new ProductServiceImpl();
		PageBean pm = produceService.findAllPutDownProductsWithPage(curNum);
		//转发页面
		req.setAttribute("page", pm);
		return "/admin/product/pushDown_list.jsp";
	}
	
	
	//查询管理后台的所有的商品
	public String findAllProductsWithPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//获取当前页
		int curNum = Integer.parseInt(req.getParameter("num"));
		//调用业务层
		ProductService produceService = new ProductServiceImpl();
		PageBean pm = produceService.findAllProductsWithPage(curNum);
		//转发页面
		req.setAttribute("page", pm);
		
		return "/admin/product/list.jsp";
	}
		
	/***
	 * addProductUI'
	 * 这是点击添加按钮后  查询所有的分类信息
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String addProductUI(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		ProductService produceService = new ProductServiceImpl();
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list = categoryService.getAllCats();
		
		req.setAttribute("allCats", list);
		return "/admin/product/add.jsp";
	}
	
	/*
	 * 真实的添加商品
	 * addProduct
	 */
	public String addProduct(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Map<String,String> map = new HashMap<String,String>();//存储表单
		Product product = new Product();//存储携带表单数据 service dao
		
		//获取全部表单数据 有上传图片的组件upload
		try {
			//下面三行获取图片 【输入流】 得到请求体中所有的数据，查分和封装
			DiskFileItemFactory fac = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fac);
			List<FileItem> list = upload.parseRequest(req);
			//遍历集合
			for(FileItem item : list) {
				//普通表单
				if(item.isFormField()) {
					//放入map
					map.put(item.getFieldName(), item.getString("utf-8"));
				}else {
					
					//获取要保存文件原始的名称
					String oldFileName = item.getName();
					//要保存的文件
					String newFileName = UploadUtils.getUUIDName(oldFileName);
					
					//上传的功能
					InputStream is = item.getInputStream();
					//服务端创建上传文件的目录
					//最优秀的性能  多级目录 当前目录下的文件
					String realPath = getServletContext().getRealPath("/store_img");
					//输出一下目录
					System.out.println(realPath);
					//创8级目录
					String dir = UploadUtils.getDir(newFileName);
					String path = realPath+dir;
					//生成了目录结构
					//内存中生命目录
					File newDir  = new File(path);
					if(!newDir.exists()) {
						newDir.mkdirs();//创建
					}
					
					//创阿金文件
					File finalFile = new File(newDir,newFileName);
					if(!finalFile.exists()) {
						finalFile.createNewFile();//创建0kb文件
					}
					//简历输出流
					OutputStream os = new FileOutputStream(finalFile);
					
					IOUtils.copy(is, os);
					
					//释放资源
					IOUtils.closeQuietly(is);
					IOUtils.closeQuietly(os);
					
					map.put("pimage", "/store_img/"+dir+"/"+newFileName);				
				}
			}
			
			//封装对象
			BeanUtils.populate(product, map);
			//为没有属性的数据进行手动赋值
			product.setPid(UUIDUtils.getId());
			product.setPdate(new Date());
			product.setPflag(0);
			
			//调用service存储数据
			ProductService productService = new ProductServiceImpl();
			productService.saveProduct(product);
			
			//重定向页面
			//resp.sendRedirect("/store/adminProductServlet?method=findAllProductsWithPage&num=1");
			resp.sendRedirect(req.getContextPath()+"/adminProductServlet?method=findAllProductsWithPage&num=1");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		//
		return null;
	
	}

}
