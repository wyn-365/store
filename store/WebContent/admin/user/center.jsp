 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
</head>
<body>
<div>
 <h1 style="text-align: center;color:green">修改用户信息</h1>
</div>
<div>

<form action="${pageContext.request.contextPath}/userServlet?method=editUser&uid=${loginUser.uid}&username=${loginUser.username}" method="post">
  <div class="form-group"   align="center">
    <label for="exampleInputEmail1">用户名</label>
    <input type="text" disabled="disabled"   readonly="true" value="${loginUser.username}" class="form-control" id="exampleInputEmail1"  style="width:300px">
  </div>
  <div class="form-group"   align="center">
    <label for="exampleInputPassword1">密码</label>
    <input type="text" class="form-control" name="password" value="${loginUser.password}" id="exampleInputPassword1" placeholder="Password" style="width:300px">
  </div>
   <div class="form-group"   align="center">
    <label for="exampleInputPassword1">性别</label>
    <input type="text" class="form-control" name="sex" value="${loginUser.sex}" id="exampleInputPassword1" placeholder="sex" style="width:300px">
  </div>
   <div class="form-group"   align="center">
    <label for="exampleInputPassword1">生日</label>
    <input type="text" class="form-control" name="birthday" value="${loginUser.birthday}" id="exampleInputPassword1" placeholder="birthday" style="width:300px">
  </div>
   <div class="form-group"   align="center">
    <label for="exampleInputPassword1">邮箱</label>
    <input type="text" class="form-control" name="email" value="${loginUser.email}" id="exampleInputPassword1" placeholder="email" style="width:300px">
  </div>
   <div class="form-group"  align="center">
    <label for="exampleInputPassword1">电话</label>
    <input type="text" class="form-control" name="telephone" value="${loginUser.telephone}"id="exampleInputPassword1" placeholder="telephone" style="width:300px">
  </div>
   <div class="form-group"  align="center">
    <label for="exampleInputPassword1">真实姓名</label>
    <input type="text" class="form-control" name="name" value="${loginUser.name}"id="exampleInputPassword1" placeholder="name" style="width:300px">
  </div>
  
  <div class="form-group"  align="center" >
    <label for="exampleInputFile">上传头像</label>
    <input type="file" id="exampleInputFile">
   
  </div>
  <div  align="center" >
    <button type="submit" class="btn btn-success" style="width:120px">保存</button>
  </div>

</form>
</div>
</body>
</html>