package com.wang.store.service.impl;

import java.util.List;
import java.util.Map;

import com.wang.store.dao.ProductDao;
import com.wang.store.dao.impl.ProductDaoImpl;
import com.wang.store.domain.PageBean;
import com.wang.store.domain.Product;
import com.wang.store.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	ProductDao productDao = new ProductDaoImpl();
	
	/**
	 * 查询最新商品
	 */
	@Override
	public List<Product> findHots() throws Exception {
		// TODO Auto-generated method stub
		return productDao.findHots();
	}
	
	/**
	 * 查询最新最热商品
	 */
	@Override
	public List<Product> findNews() throws Exception {
		// TODO Auto-generated method stub
		return productDao.findNews();
	}
	
	/**
	 * 查看商品详情
	 */
	@Override
	public Product findProductByPid(String pid) throws Exception {
		
		return productDao.findProductByPid(pid);
		
	
	}
	
	/**
	 * 导航下的分页查询
	 * 
	 */
	@Override
	public PageBean findProductsByCidWithPage(String cid, int curNum) throws Exception {
		// 创建pageBean对象
		//统计分类下的商品个数  总数
		int totalRecords = productDao.findTotalRecords(cid);
		PageBean pm = new PageBean(curNum,totalRecords,12);
		//关联集合 分页语句
		List list = productDao.findProductsByCidWithPage(cid,pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		//关联 url
		pm.setUrl("productServlet?method=findProductsByCidWithPage&cid="+cid);
		
		return pm;
	}
	
	//后台查询所有的商品
	@Override
	public PageBean findAllProductsWithPage(int curNum) throws Exception {
		// 创建对象
		int totalRecords = productDao.findTotalRecords();
		PageBean pm = new PageBean(curNum,totalRecords,5);
		//管连集合
		List<Product> list = productDao.findAllProductsWithPage(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		//关联url
		pm.setUrl("adminProductServlet?method=findAllProductsWithPage");
		return pm;
	}
	
	/**
	 * 添加商品
	 */
	@Override
	public void saveProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.saveProduct(product);
		
	}
	
	//下架商品
	@Override
	public void xiaJia(String pid) throws Exception {
		//product.setPflag(1);
		productDao.xiaJia(pid);
	
		
	}
	
	//上架商品
	@Override
	public void shangJia(String pid) throws Exception {
		// TODO Auto-generated method stub
		productDao.shangJia(pid);
		
	}
	
	//查询所有的下架商品
	@Override
	public PageBean findAllPutDownProductsWithPage(int curNum) throws Exception {
				// 创建对象
				int totalRecords = productDao.findTotalRecords();
				PageBean pm = new PageBean(curNum,totalRecords,5);
				//管连集合
				List<Product> list = productDao.findAllPutDownProductsWithPage(pm.getStartIndex(),pm.getPageSize());
				pm.setList(list);
				//关联url
				pm.setUrl("adminProductServlet?method=findAllPutDownProductsWithPage");
				return pm;
	}
	
	//查询销售记录
	@Override
	public List<Product> findSale() throws Exception {
		// TODO Auto-generated method stub
		return productDao.findSale();
	}
	
	//模糊查询
	@Override
	public List<Product> findProductLike(Map<String, String[]> condition) throws Exception {
		// TODO Auto-generated method stub
		/*
		 * List<Product> list = productDao.findProductLike(condition); return list;
		 */
		
		return productDao.findProductLike(condition);
	}

}
