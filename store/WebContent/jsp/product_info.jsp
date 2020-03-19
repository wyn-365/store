﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品详情信息</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/radio.css" type="text/css"/>
		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			
			}
		
			
			
		</style>
	</head>

	<body>

		
			<%@ include file="/jsp/header.jsp" %>	


		<div class="container">
			<div class="row">
				<div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
					<a href="${pageContext.request.contextPath}/">首页&nbsp;&nbsp;&gt;</a>
				</div>

				<div style="margin:0 auto;width:950px;">
				
				<form id="myForm" action="${pageContext.request.contextPath}/cartServlet?method=addCartItemToCart" method="post">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${product.pimage}">
					</div>

					<div class="col-md-6">
						<div><strong>${product.pname}</strong></div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div>编号：${product.pid}</div>
						</div>

						<div style="margin:10px 0 10px 0;">商城价: <strong style="color:#ef0101;">￥：${product.shop_price}元/件</strong> 市场价： <del style="color:red">￥：${product.market_price}元/份</del>
						</div>

						<div style="margin:10px 0 10px 0;"><h5>促销:<a target="_blank" title="限时抢购 (2019-07-30 ~ 2020-01-01)" style="background-color: #f07373;">限时抢购</a> </h5> 
						<h5 style="color:green">实时库存：${product.pnumber} 件</h5></div>
                        <h5 style="color:blue"> 已销售： <del style="color:red">${product.psale} 件</del></h5>
						<div style="padding:10px;border:1px solid #e7dbb1;width:350px;margin:15px 0 10px 0;;background-color: #fffee6;">
								<div class="col">                       
					               颜色： <input class="magic-radio" type="radio" name="radio1" id="r1" value="option1">  
					                <label for="r1" class="radio1">绿色</label>  
					                <input class="magic-radio" type="radio" name="radio1" id="r2" value="option2" checked>  
					                <label for="r2" class="radio2">红色</label>  
					                <input class="magic-radio" type="radio" name="radio1" id="r3" value="option3">  
					                <label for="r3" class="radio3">灰色</label>  
					                <input class="magic-radio" type="radio" name="radio1" id="r4" value="option4">  
					                <label for="r4" class="radio4">蓝色</label> 
					            </div> 
					   		
					   				
					   				
					   				
							<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
							<!-- 向服务端发送的数据 -->
								<input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text"> 件</div>
								<input type="hidden" name="pid" value="${product.pid}">
								
							<div style="margin:20px 0 10px 0;;text-align: center;">
								<%--加入到购物车 --%>
								<!-- 取消连接的默认项为 -->
							 <a href="Javascript:void(0)"> 
									<input id="btnID" style="background: url('${pageContext.request.contextPath}/img/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="submit">
								</a> &nbsp;<a href="" style="color:red">收藏商品</a></div>
						</div>
					</div>
					</form>
				</div>
				<div class="clear"></div>
				<div style="width:950px;margin:0 auto;">
					<div style="background-color:pink;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<h4 style="color:red">商品介绍:</h4>
					 	<h3>${product.pdesc}</h3>
					</div>

				</div>

			</div>
		</div>

		<%@ include file="/jsp/footer.jsp" %>	
	</body>
	
   <script>
		$(function(){
			$("#btnID").click(function(){
				var formObj = document.getElementById("#myForm");
				formObj.submit();
			});
		});
	</script> 
</html>