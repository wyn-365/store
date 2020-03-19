<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form class="form-horizontal" style="margin-top:5px;" action="${pageContext.request.contextPath}/userServlet?method=userRegist2" method="post">
			 <div class="form-group">
			    <label for="username"  class="col-sm-2 control-label">用户名</label>
			    
			    <div class="col-sm-6">
			      <input type="text" name="username" class="form-control" id="empName_add_input" placeholder="请输入用户名">
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-6">
			      <input type="password" name="password"class="form-control" id="inputPassword3" placeholder="请输入密码">
			    </div>
			  </div>

			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <input type="submit"  width="100" value="注册" name="submit" border="0"
				    style="background: url('${pageContext.request.contextPath}/img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
			    </div>
			  </div>
			</form>
</body>
</html>