 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminUserServlet?method=updateUserById&uid=${user.uid}" method="post" >
			<input type="hidden" name="uid" value="" />
			<input type="hidden" name="state" value="" />
			<input type="hidden" name="code" value="" />
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<h3>编辑用户
						</h3>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						用户名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="username" value="${user.username}" id="userAction_save_do_logonName" class="bg"/>
						
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						密码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="password" value="${user.password}" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				
					<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						生日：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="birthday" value="${user.birthday}" id="userAction_save_do_logonName" class="bg"/>
						</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						性别：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="sex" value="${user.sex}" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				
				
				
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						真实姓名：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="name" value="${user.name}" id="userAction_save_do_logonName" class="bg"/>
						</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						邮箱：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="email" value="${user.email}" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						电话：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="telephone" value="${user.telephone}" id="userAction_save_do_logonName" class="bg"/>
						</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						状态：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="state" value="${user.state}" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
			
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>