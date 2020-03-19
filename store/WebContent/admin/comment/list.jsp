 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
			<script type="text/javascript">
			function addGong(){
				window.location.href = "${pageContext.request.contextPath}/index02Servlet?method=addGongGao";
			}
			
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>留言列表</strong>
						</TD>
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
										留言用户
									</td>
									<td align="center" width="10%">
										姓名
									</td>
									<td align="center" width="10%">
										邮箱
									</td>
									<td align="center" width="10%">
										电话
									</td>
									<td align="center" width="20%">
										内容
									</td>
									<td align="center" width="10%">
										留言日期
									</td>
									<td width="10%" align="center">
										编辑
									</td>
									<td width="10%" align="center">
										删除
									</td>
								</tr>
									<c:forEach items="${comments}" var="c" varStatus="p">
										<tr onmouseover="this.style.backgroundColor = 'pink'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="5%">
												${p.count}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${c.uid}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${c.name}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${c.email}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${c.phone}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="20%">
												${c.comment}
											</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												${c.cdate}
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="">
													<img src="${pageContext.request.contextPath}/img/admin/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/index02Servlet?method=deleteComment&id=${c.id}">
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

