package com.wang.store.service;

import java.util.List;
import java.util.Map;

import com.wang.store.domain.PageBean;
import com.wang.store.domain.Product;

public interface ProductService {

	List<Product> findHots() throws Exception;

	List<Product> findNews() throws Exception;

	Product findProductByPid(String pid)throws Exception;

	PageBean findProductsByCidWithPage(String cid, int curNum)throws Exception;

	PageBean findAllProductsWithPage(int curNum)throws Exception;

	void saveProduct(Product product)throws Exception;

	void xiaJia(String pid)throws Exception;

	void shangJia(String pid)throws Exception;

	PageBean findAllPutDownProductsWithPage(int curNum)throws Exception;

	List<Product> findSale()throws Exception;

	List<Product> findProductLike(Map<String, String[]> condition)throws Exception;



	

}
