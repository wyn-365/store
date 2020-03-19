 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>用户列表</strong>
						</TD>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="5%">
										序号
									</td>
									<td align="center" width="10%">
										用户名称
									</td>
									<td align="center" width="10%">
										用户密码
									</td>
										<td align="center" width="5%">
										性别
									</td>
									
									<td align="center" width="15%">
										生日
									</td>
									<td align="center" width="10%">
										邮箱
									</td>
										<td align="center" width="10%">
										电话
									</td>
										<td align="center" width="7%">
										账户是否激活
									</td>
									<td align="center" width="10%">
										真实姓名
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										删除
									</td>
								</tr>
									<c:forEach items="${users}" var="u" varStatus="p">
										<tr onmouseover="this.style.backgroundColor = 'pink'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="5%">
												${p.count}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${u.username}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${u.password}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="5%">
												${u.sex}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${u.birthday}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${u.email}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${u.telephone}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="7%">
												${u.state}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${u.name}
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/adminUserServlet?method=editUserUI&uid=${u.uid}">
													<img src="${pageContext.request.contextPath}/img/admin/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/adminUserServlet?method=deleteUserById&uid=${u.uid}">
													<img src="${pageContext.request.contextPath}/img/admin/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</c:forEach>
							</table>
						</td>
					</tr>
					<tr align="center">
						
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

