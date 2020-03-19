 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree" >

	<a href="javascript: d.openAll();" style="font-size: 15px;color:blue;">[展开所有]</a>/<a href="javascript: d.closeAll();" style="font-size: 15px;color:blue">[关闭所有]</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">
	
		d = new dTree('d');
		d.add('01',-1,'系统菜单树');
		
		d.add('0102','01','分类管理','','','mainFrame');
		d.add('010201','0102','分类管理','${pageContext.request.contextPath}/adminCategoryServlet?method=findAllCats','','mainFrame');
		d.add('0104','01','商品管理');
		d.add('010401','0104','商品管理','${pageContext.request.contextPath}/adminProductServlet?method=findAllProductsWithPage&num=1','','mainFrame');
		d.add('010402','0104','已下架商品管理','${pageContext.request.contextPath}/adminProductServlet?method=findAllPutDownProductsWithPage&num=1','','mainFrame');
		d.add('0105','01','订单管理');
		d.add('010501','0105','订单管理','${pageContext.request.contextPath}/adminOrderServlet?method=findOrders','','mainFrame');
		d.add('010502','0105','未付款的订单','${pageContext.request.contextPath}/adminOrderServlet?method=findOrders&state=1','','mainFrame');
		d.add('010503','0105','已付款订单','${pageContext.request.contextPath}/adminOrderServlet?method=findOrders&state=2','','mainFrame');
		d.add('010504','0105','已发货的订单','${pageContext.request.contextPath}/adminOrderServlet?method=findOrders&state=3','','mainFrame');
		d.add('010505','0105','已完成的订单','${pageContext.request.contextPath}/adminOrderServlet?method=findOrders&state=4','','mainFrame');
		
		d.add('0106','01','用户管理');
		d.add('010601','0106','用户管理','${pageContext.request.contextPath}/adminUserServlet?method=findAllUsers','','mainFrame');
		d.add('010602','0106','管理员','${pageContext.request.contextPath}/adminUserServlet?method=findAllAdmin','','mainFrame');
		
		d.add('0107','01','公告管理');
		d.add('010701','0107','公告管理','${pageContext.request.contextPath}/index02Servlet?method=adminFindGongGao','','mainFrame');
		
		d.add('0108','01','留言管理');
		d.add('010801','0108','留言管理','${pageContext.request.contextPath}/index02Servlet?method=adminfindAllComment','','mainFrame');
		document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
