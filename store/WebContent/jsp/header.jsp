<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>关于我们</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.backgroundpos.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/menu.js" type="text/javascript"></script>
	
	
	
	</head>
	<body>
		<!--
            	描述：菜单栏
            -->
			<div class="container-fluid">
				<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/img/logo1.png" />
				</div>
				<div class="col-md-5">
					<img src="${pageContext.request.contextPath}/img/header.png" />
				</div>
				<div class="col-md-3" style="padding-top:20px">
					<ol class="list-inline">
					
					<!-- jstl标签实现登录的不同状态限制页面  -->
					<c:if test="${empty loginUser}">
					<li><a href="${pageContext.request.contextPath}/index02Servlet?method=index02UI" style="color:red">【切换新版】</a></li>
					
						<li><a href="${pageContext.request.contextPath}/userServlet?method=loginUI" >登录</a></li>
						<li><a href="${pageContext.request.contextPath}/userServlet?method=registUI" >注册</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/index.jsp" >管理员登录</a></li>
						<li><a href="${pageContext.request.contextPath}/index02Servlet?method=comment" >【点我留言】</a></li>
					</c:if>
					
					<c:if test="${not empty loginUser}">	
						<li style="color:red">欢迎您回来，<a href="${pageContext.request.contextPath}/userServlet?method=centerUI" style="color:brown" title="进入个人中心">[ ${loginUser.username} ]</a> </li>
						<li><a href="${pageContext.request.contextPath}/userServlet?method=logOut">退出</a></li>
						<li><a href="${pageContext.request.contextPath}/userServlet?method=index02UI" style="color:red">【老王易购】</a></li>
						<li><a href="${pageContext.request.contextPath}/jsp/cart.jsp">购物车</a></li>
						<li><a href="${pageContext.request.contextPath}/orderServlet?method=findMyOrdersWithPage&num=1">我的订单</a></li>
						<li><a href="${pageContext.request.contextPath}/index02Servlet?method=comment" >点我留言</a></li>
					</c:if>	
					</ol>
				</div>
			</div>
			<!--
            	描述：导航条
            -->
			<div class="container-fluid">
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="${pageContext.request.contextPath}/indexServlet">首页</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav" id="myUL">
								 <c:forEach items="${allCats}" var = "c">
									<li><a href="${pageContext.request.contextPath}/productServlet?method=findProductsByCidWithPage&num=1&cid=${c.cid}">
									${c.cname}</a>
									</li>
								</c:forEach>  
							
							</ul>
							
							<form action="${pageContext.request.contextPath}/findProductServlet" class="navbar-form navbar-right" role="search" method="post">
								<div class="form-group">
									<input type="text" name="pname" value="${condition.pname[0]}" class="form-control" placeholder="按名称搜索" style="width:150px; height:35px;">
									<input type="text" name="shop_price" value="${condition.shop_price[0]}" class="form-control" placeholder="按价格搜索" style="width:150px; height:35px;">
								</div>
								<button type="submit" class="btn btn-danger">搜索</button>
							</form>

						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>

	</body>
	<!-- <script>
		$(function(){
			//向服务端CategoryServlet发送ajax请求，返回json数据，获取所有的分类
			var url = "/store/categoryServlet";
			var obj = {"method":"findAllCats"};
			$.post(url,obj,function(data){
				//alert(data);
				
				//遍历data数据
				$.each(data,function(i,obj){
					var li = "<li><a href='/store/productServlet?method=findProductsByCidWithPage&num=1&cid="+obj.cid+"'>"+obj.cname+"</a></li>";
					$("#myUL").append(li);
				});
			},"json");
		}); -->
    </script>

</html>