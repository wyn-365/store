package com.wang.store.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.store.domain.Cart;
import com.wang.store.domain.CartItem;
import com.wang.store.domain.Order;
import com.wang.store.domain.OrderItem;
import com.wang.store.domain.PageBean;
import com.wang.store.domain.Product;
import com.wang.store.domain.User;
import com.wang.store.service.OrderService;
import com.wang.store.service.ProductService;
import com.wang.store.service.impl.OrderServiceImpl;
import com.wang.store.service.impl.ProductServiceImpl;
import com.wang.store.utils.PaymentUtil;
import com.wang.store.utils.UUIDUtils;
import com.wang.store.web.base.BaseServlet;

@WebServlet("/orderServlet")
public class OrderServlet extends BaseServlet {
	
	//将购物车中的信息以订单的形式进行保存
	public String saveOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//判断用户是否为登录状态
		User user = (User)request.getSession().getAttribute("loginUser");
		if(null==user) {
			//没有登陆
			request.setAttribute("msg", "请先登录再下单吧！！！");
			return "/jsp/info.jsp";
		}
		//获取购物车
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		//登录状态 可以下单 ，为订单对象赋值
		Order order = new Order();
		order.setOid(UUIDUtils.getCode());
		order.setOrderTime(new Date());
		order.setTotal(cart.getTotal());
		order.setState(1);
		order.setUser(user);
		
		//遍历 购物项 创建订单项并赋值 来自购物车
		for(CartItem item : cart.getCartItems()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setItemid(UUIDUtils.getCode());
			orderItem.setQuantity(item.getNum());
			orderItem.setTotal(item.getSubTotal());
			orderItem.setProduct(item.getProduct());
			//上设置当前订单属于那个订单，建立关系
			orderItem.setOrder(order);
			order.getList().add(orderItem);
		}
		//滴哦用业务层的功能
		OrderService orderService = new OrderServiceImpl();
		orderService.saveOrder(order);
		//清空购物车
		cart.clearCart();
		//将订单存入request
		request.setAttribute("order", order);
		//转发到页面  可以从页面中取出数据
		return "/jsp/order_info.jsp";
	}
	
	
	/* 实现我的订单 加上分页的查询
	 * findMyOrdersWithPage
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findMyOrdersWithPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		//获取用户信息  用户在session中
		User user = (User)request.getSession().getAttribute("loginUser");
		//获取当前页
		int curNum = Integer.parseInt(request.getParameter("num"));
		//调用业务层；查询用户订单信息，并且返回pageBean
		OrderService orderService = new OrderServiceImpl();
		//查询我的订单 带上分页的功能 UID limit
		//pageBean 分页的参数 url  当前页的订单集合 显示每一笔订单的订单项 和对应的商品信息
		PageBean pm = orderService.findMyOrdersWithPage(user,curNum);
		//吧pagebean 放入 request域中
		request.setAttribute("page", pm);
		//转发页面
		return "/jsp/order_list.jsp";
			
	}
	
	
	/**
	 * 根据订单编号查询订单信息
	 * findOrderByOid
	 */
	public String findOrderByOid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取订单的id
		String oid = request.getParameter("oid");
		//调用业务层的功能
		OrderService orderService = new OrderServiceImpl();
		Order order = orderService.findOrderByOid(oid);
		//放入到request域中
		request.setAttribute("order", order);
		//转发页面
		return "/jsp/order_info.jsp";	
	}
	
	
	/**
	 * 订单的支付模块
	 */
	
	public String payOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.获取订单的oid，收货人的填写的地址，姓名，电话，银行 和商品的数量
		String oid = request.getParameter("oid");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		String pd_FrpId = request.getParameter("pd_FrpId");
		
	
		
		//2.更新收货人的地址姓名和电话
		OrderService orderService = new OrderServiceImpl();
		Order order = orderService.findOrderByOid(oid);
		
		order.setName(name);
		order.setAddress(address);
		order.setTelephone(telephone);
		orderService.updateOrder(order);
		
		//支付完成之后完成商品库存数量的减少和销售量的增加
		//获取商品的pid
		
		List<OrderItem> list = order.getList();
		OrderItem orders = list.get(0);
		int quantity = orders.getQuantity();
		String pid = orders.getProduct().getPid();
		//OrderItem [itemid=0B0B83E315534309B3DA3C992D0DCD0D, quantity=1, total=150.0, product=Product [pid=51, pname=短裙, market_price=160.0, shop_price=150.0, pimage=store_img/1.png, pdate=Thu Aug 15 00:00:00 CST 2019, is_hot=1, pdesc=发送的好看, pflag=0, cid=59f56ba6ccb84cb591c66298766b83b5, pnumber=89, psale=41], order=null]	
		//调用业务层削减库存数量 
		orderService.cutNum(quantity,pid);
		 
	    
	    
		//3.向易宝支付发送参数
		// 把付款所需要的参数准备好:
				String p0_Cmd = "Buy";
				//商户编号
				String p1_MerId = "10001126856";
				//订单编号
				String p2_Order = oid;
				//金额
				String p3_Amt = "0.01";
				String p4_Cur = "CNY";
				String p5_Pid = "";
				String p6_Pcat = "";
				String p7_Pdesc = "";
				//接受响应参数的Servlet
				String p8_Url = "http://localhost:8080/store/orderServlet?method=callBack";
				String p9_SAF = "";
				String pa_MP = "";
				String pr_NeedResponse = "1";
				//公司的秘钥
				String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
					
				//调用易宝的加密算法,对所有数据进行加密,返回电子签名
				String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
						
				StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
				sb.append("p0_Cmd=").append(p0_Cmd).append("&");
				sb.append("p1_MerId=").append(p1_MerId).append("&");
				sb.append("p2_Order=").append(p2_Order).append("&");
				sb.append("p3_Amt=").append(p3_Amt).append("&");
				sb.append("p4_Cur=").append(p4_Cur).append("&");
				sb.append("p5_Pid=").append(p5_Pid).append("&");
				sb.append("p6_Pcat=").append(p6_Pcat).append("&");
				sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
				sb.append("p8_Url=").append(p8_Url).append("&");
				sb.append("p9_SAF=").append(p9_SAF).append("&");
				sb.append("pa_MP=").append(pa_MP).append("&");
				sb.append("pd_FrpId=").append(pd_FrpId).append("&");
				sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
				sb.append("hmac=").append(hmac);
					
					
				
				
				

				System.out.println(sb.toString());
				// 使用重定向：
				response.sendRedirect(sb.toString());
				return null;
	}
	
	//响应易宝支付响应回来的数据
	public String callBack(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.接受宝支付响应回来的数据
		// 验证请求来源和数据有效性
				// 阅读支付结果参数说明
				// System.out.println("==============================================");
				String p1_MerId = request.getParameter("p1_MerId");
				String r0_Cmd = request.getParameter("r0_Cmd");
				String r1_Code = request.getParameter("r1_Code");
				String r2_TrxId = request.getParameter("r2_TrxId");
				String r3_Amt = request.getParameter("r3_Amt");
				String r4_Cur = request.getParameter("r4_Cur");
				String r5_Pid = request.getParameter("r5_Pid");
				String r6_Order = request.getParameter("r6_Order");
				String r7_Uid = request.getParameter("r7_Uid");
				String r8_MP = request.getParameter("r8_MP");
				String r9_BType = request.getParameter("r9_BType");
				String rb_BankId = request.getParameter("rb_BankId");
				String ro_BankOrderId = request.getParameter("ro_BankOrderId");
				String rp_PayDate = request.getParameter("rp_PayDate");
				String rq_CardNo = request.getParameter("rq_CardNo");
				String ru_Trxtime = request.getParameter("ru_Trxtime");

				// hmac
				String hmac = request.getParameter("hmac");
				// 利用本地密钥和加密算法 加密数据
				String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
				
				//2.保证支付的合法性
				boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
						r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
						r8_MP, r9_BType, keyValue);
				if (isValid) {
					// 有效
					if (r9_BType.equals("1")) {
						// 浏览器重定向

						//3.支付成功，更新订单状态
						OrderService orderService = new OrderServiceImpl();
						Order order = orderService.findOrderByOid(r6_Order);
						order.setState(2);
						orderService.updateOrder(order);
						//4.向request域中存放提示信息
						request.setAttribute("msg", "支付成功！订单号：" + r6_Order + "金额：" + r3_Amt);
						//5.转达页面
					return "/jsp/info.jsp";
					
					} else if (r9_BType.equals("2")) {
						// 修改订单状态:
						// 服务器点对点，来自于易宝的通知
						System.out.println("收到易宝通知，修改订单状态！");//
						// 回复给易宝success，如果不回复，易宝会一直通知
						response.getWriter().print("success");
					}

				} else {
					throw new RuntimeException("数据被篡改！");
				}
				
				return null;		
	}
	
}
