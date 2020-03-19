package com.wang.store.dao;

import java.util.List;
import java.util.Map;

import com.wang.store.domain.Product;

public interface ProductDao {

	List<Product> findHots() throws Exception;

	List<Product> findNews() throws Exception;

	Product findProductByPid(String pid) throws Exception;

    int findTotalRecords(String cid) throws Exception;

	List findProductsByCidWithPage(String cid, int startIndex, int pageSize) throws Exception;

	int findTotalRecords()throws Exception;

	List<Product> findAllProductsWithPage(int startIndex, int pageSize)throws Exception;

	void saveProduct(Product product)throws Exception;

	void xiaJia(String pid)throws Exception;

	void shangJia(String pid)throws Exception;

	List<Product> findAllPutDownProductsWithPage(int startIndex, int pageSize)throws Exception;

	List<Product> findSale()throws Exception;

	List<Product> findProductLike(Map<String, String[]> condition)throws Exception;
	
}
