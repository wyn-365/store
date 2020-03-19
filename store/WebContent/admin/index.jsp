 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网上商城管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<%-- <link href="${pageContext.request.contextPath }/css/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet" type="text/css" />
 --%>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		

<style type="text/css">
 body {
 	background-color: navy;
 	background-size: 100%;
   	
} 
</style>

 
    <script type="text/javascript">
        //点击切换验证码
        function refreshCode() {
            //获取
            var vcode = document.getElementById("vcode");

            //设置时间捉 和图片路径
            vcode.src="${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();

        }
    </script>

</head>
<body>

<center><font style="color:#f00;font-size: 20px">${msg}</font></center>

<div style="float: left">

<form method="post" action="${pageContext.request.contextPath }/adminLoginServlet?method=login" target="_parent" name='theForm' onsubmit="return validate()">
 
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  </br>
  </br>
  </br>
  </br>
  </br>
  <tr>

    <td style="padding-left: 50px">
      <table>
      <tr>
        <td style="color: red">管理员姓名：</td>
        <td><input type="text" name="username" placeholder="请输入管理员账号" /></td>
      </tr>
      <tr>
        <td style="color: red">管理员密码：</td>
        <td><input type="password" name="password" placeholder="请输入密码"/></td>
        
      </tr>
     <tr>
     <td style="color: red">验证码：</td>
     <td><input type="text" name="password" name="verifycode" id="verifycode" placeholder="请输入验证码" />
      <a href="javascript:refreshCode();">
      <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
      </a>
     
     </td>
		
     </tr>
      <tr>
      <td>&nbsp;</td>  
      
      <td></br><input type="submit" value="点击登录" class="button" />
           
      </td>
      </tr>
      </table>
    </td>
  </tr>
  </table>
</form>
</div>
<script language="JavaScript">
<!--
  document.forms['theForm'].elements['username'].focus();
  
  /**
   * 检查表单输入的内容
   */
  function validate()
  {
    var validator = new Validator('theForm');
    validator.required('username', user_name_empty);
    //validator.required('password', password_empty);
    if (document.forms['theForm'].elements['captcha'])
    {
      validator.required('captcha', captcha_empty);
    }
    return validator.passed();
  }
  
//-->
</script>
</body>