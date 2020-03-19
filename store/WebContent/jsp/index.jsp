 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>王一宁网络商城</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>

	</head>

	<body>
		<div class="container-fluid">

		<!-- 采用抽取公共的页面 导航条等 -->
		<%@ include file="/jsp/header.jsp" %>

			<!--
            	描述：轮播条
            -->
			<div class="container-fluid" >
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${pageContext.request.contextPath}/img/ad/11.jpg">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/ad/001.jpg">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/ad/9.jpg">
							<div class="carousel-caption">

							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!--

            	描述：商品显示
            -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2 style="color:red">热门上架商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/11.png" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<a href="#">
							<img src="products/hao/323.jpg" width="516px" height="200px" style="display: inline-block;">
						</a>
					</div>
				
				<c:forEach items="${hots}" var="p">
					<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
						<a href="${pageContext.request.contextPath}/productServlet?method=findProductByPid&pid=${p.pid}">
							<img src="${pageContext.request.contextPath}/${p.pimage}"  width="130" height="130" style="display: inline-block;">
						</a>
						<p><a href="${pageContext.request.contextPath}/productServlet?method=findProductByPid&pid=${p.pid}" style='color:#666'>${p.pname}</a></p>
						<p><font color="#E4393C" style="font-size:16px">&yen;${p.shop_price}</font></p>
					</div>
				</c:forEach>
					
				</div>
			</div>
			<!--

            	描述：广告部分
            -->
            <div class="container-fluid">
				<img src="products/hao/ad.jpg" width="100%"/>
			</div>
			<!--

            	描述：商品显示
            -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2 style="color:blue">最新上架商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/22.png" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<a href="#">
							<img src="products/hao/324.jpg" width="516px" height="200px" style="display: inline-block;">
						</a>
					</div>
				
				<c:forEach items="${news}" var="p" >
					<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
						<a href="${pageContext.request.contextPath}/productServlet?method=findProductByPid&pid=${p.pid}">
							<img src="${pageContext.request.contextPath}/${p.pimage}"  width="130" height="130" style="display: inline-block;">
						</a>
						<p><a href="${pageContext.request.contextPath}/productServlet?method=findProductByPid&pid=${p.pid}" style='color:#666'>${p.pname}</a></p>
						<p><font color="#E4393C" style="font-size:16px">&yen;${p.shop_price}</font></p>
					</div>
				</c:forEach>
	
					
				</div>
			</div>	
			<div><img src="products/hao/ad.jpg" width="100%"/> </div>
			<!-- 月销量排行榜 -->
			
			<div style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 300px;">

			<h3 style="width: 50%;color:red ;float: left;font: 14px/30px " 微软雅黑 ";">月销量排行榜</h3>
			<div style="width: 50%;float: right;text-align: right;"><a href="">更多</a></div>
			<div style="clear: both;"></div>

			<div style="overflow: hidden;">

				<ul style="list-style: none;">
				
				<c:forEach items="${sale}" var="s"  varStatus="p">	
				
					<li style="width: 150px;height: 216;float: left;margin: 0 8px 0 0;padding: 0 18px 15px;text-align: center;">
						<a href="${pageContext.request.contextPath}/productServlet?method=findProductByPid&pid=${s.pid}"><img src="${pageContext.request.contextPath}/${s.pimage}" width="130px" height="150px" />${s.pname}</a>
						<h4 style="color:red"><img src="${pageContext.request.contextPath}/products/hao/fire.jpg" width="20px" height="27px" />&nbsp;&nbsp;第${p.count}名</h4>
						<h4 style="text-align:left;color:#FF8000">销量：<span style="color:blue">${s.psale}</span>&nbsp;件</h4>
					</li>
					
				</c:forEach>
				</ul>

			</div>
		</div>		
			
			<!-- 抽取公共的页脚 -->
			<%@ include file="/jsp/footer.jsp" %>
		</div>
	</body>

</html>