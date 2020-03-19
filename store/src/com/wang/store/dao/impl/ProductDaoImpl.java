package com.wang.store.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.wang.store.dao.ProductDao;
import com.wang.store.domain.Product;
import com.wang.store.utils.JDBCUtils;

public class ProductDaoImpl implements ProductDao {
	
	/**
	 * 查询最新最热
	 */
	@Override
	public List<Product> findHots() throws Exception {
		// 
		String sql = "select * from product where pflag=0 and is_hot=1 order by pdate desc limit 0 , 9";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Product>(Product.class));
		
	}
	
	/**
	 * 查询最新
	 */
	@Override
	public List<Product> findNews() throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * from product where pflag=0 order by pdate desc limit 0 , 9";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Product>(Product.class));
		
	}
	
	/**
	 * 查看商品详情
	 */
	@Override
	public Product findProductByPid(String pid) throws Exception {
		String sql = "select * from product where pid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<Product>(Product.class),pid);
		
	}
	
	/**
	 * 统计某个分类下的总记录数量  分页查询
	 */
	@Override
	public int findTotalRecords(String cid) throws Exception {
		String sql = "select count(*) from product where cid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler(),cid);
		return num.intValue();
	}
	
	/**
	 * 实现分页查询
	 */
	@Override
	public List findProductsByCidWithPage(String cid, int startIndex, int pageSize) throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * from product where cid =? and pflag=0 limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Product>(Product.class),cid,startIndex,pageSize);
		
	}
	
	//后台查询所有的商品
	@Override
	public int findTotalRecords() throws Exception {

		String sql = "select count(*) from product";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
		
	}
	
	//后台查询所有的商品带有分页
	@Override
	public List<Product> findAllProductsWithPage(int startIndex, int pageSize) throws Exception {
		
		String sql = "select * from product order by pdate desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Product>(Product.class),startIndex,pageSize);
		
	}
	
	/**
	 * 添加商品
	 */
	@Override
	public void saveProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {product.getPid(),product.getPname(),product.getMarket_price(),product.getShop_price(),product.getPimage(),product.getPdate(),product.getIs_hot(),product.getPdesc(),product.getPflag(),product.getCid(),product.getPnumber(),product.getPsale()};
		qr.update(sql,params);
		
	}
	
	//根据商品的id下架商品
	@Override
	public void xiaJia(String pid) throws Exception {
		// TODO Auto-generated method stub
		
		String sql = "update product set pflag=1 where pid =?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		
		qr.update(sql,pid);
		System.out.println("您要下架的商品id是"+pid);
		
	}
	
	//上架商品
	@Override
	public void shangJia(String pid) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update product set pflag=0 where pid =?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		
		qr.update(sql,pid);
		System.out.println("您要上架的商品id是"+pid);
		
	}
	
	//后台查询所有下架的商品
	@Override
	public List<Product> findAllPutDownProductsWithPage(int startIndex, int pageSize) throws Exception {
		
		String sql = "select * from product where pflag=1 order by pdate desc  limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Product>(Product.class),startIndex,pageSize);
		
	}
	
	//查询销售记录排行榜
	@Override
	public List<Product> findSale() throws Exception {
		
		String sql = "select * from product where pflag=0 order by psale desc limit 0 , 7";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Product>(Product.class));
	}
	
	
	//模糊查询 带有分页【加油分页可直接加上两个参数开始的页数和结束的页数】
	@Override
	public List<Product> findProductLike(Map<String, String[]> condition) throws Exception {
		
		String sql = "select * from product where 1=1 ";
		StringBuilder sb = new StringBuilder(sql);
		 
		//遍历map
		Set<String> keySet = condition.keySet();
		
		//定义参数的集合
        List<Object> params = new ArrayList<Object>();
        
        //System.out.println(params);//[] 
        
        for (String key : keySet) {

        //获取value
        String value = condition.get(key)[0];
        
        //判断value是否有值
        System.out.println(value);//测试【白】
        
        if(value != null && !"".equals(value)){
            //有值
            sb.append(" and "+key+" like ? ");
            
            
            params.add("%"+value+"%");//？条件的值
            
           
            
        }
	}
       
        sql = sb.toString();
        
        System.out.println(sql);
        System.out.println("稳操胜券不过是旁人的误解");
        
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		
		return qr.query(sql, new BeanListHandler<Product>(Product.class),params.toArray());
	}

}
