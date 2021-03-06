<%@page import="com.itheima.store.domain.Product"%>
<%@page import="com.itheima.store.service.impl.ProductServiceImpl"%>
<%@page import="com.itheima.store.service.ProductService"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fu" %>
<!doctype html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css"
	type="text/css" />

<script type="text/javascript">
	function fileDownLoad(pid){
		window.local.href="${pageContext.request.contextPath}/ProductServlet?method=fileDownLoad&pid="+pid;
	}

</script>

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body>

	<%@ include file="menu.jsp"%>


	<div class="row" style="width: 1210px; margin: 0 auto;">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
			</ol>
		</div>
		<c:forEach var="p" items="${pageBean.list }">
			<div class="col-md-2">
				<a ondblclick="fileDownLoad('${p.pid}')" 
				href="${pageContext.request.contextPath }/ProductServlet?method=findByPid&pid=${p.pid}"> <img src="${p.pimage }" width="170"
					height="170" style="display: inline-block;">
				</a>
				<p>
					<a href="${pageContext.request.contextPath }/ProductServlet?method=findByPid&pid=${p.pid}" style='color: green'>${ fu:substring(p.pname,0,12) }</a>
				</p>
				<p>
					<font color="#FF0000">商城价：&yen;${p.shop_price }</font>
				</p>
			</div>
		</c:forEach>
	</div>

	<!--分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
			<li <c:if test="${pageBean.currPage==1 }"> class='disabled' </c:if>><a href="${pageContext.request.contextPath }/ProductServlet?method=findByCid&currPage=${pageBean.currPage-1 }&cid=${param.cid }" aria-label="Previous"><span
					aria-hidden="true">&laquo;</span></a></li>

			<c:forEach var="i" begin="${pageBean.currPage < 2 ? 1 : pageBean.currPage }"
				end="${pageBean.totalPage < 2 ? pageBean.totalPage : (pageBean.currPage < 2 ? 1 : pageBean.currPage)+1 }">
				<li <c:if test="${pageBean.currPage==i }">class="active"</c:if>>
					<a 
					href="${pageContext.request.contextPath }/ProductServlet?method=findByCid&currPage=${i }&cid=${param.cid }">${i }</a>
				</li>
			</c:forEach>
			
<%-- 			<c:forEach var="i" begin="1"
				end="${pageBean.totalPage < 7 ? pageBean.totalPage : 7 }">
				<li <c:if test="${pageBean.currPage==i }">class="active"</c:if>>
					<a
					href="${pageContext.request.contextPath }/ProductServlet?method=findByCid&currPage=${i }&cid=${param.cid }">${i }</a>
				</li>
			</c:forEach> --%>

			<li <c:if test="${pageBean.currPage==pageBean.totalPage }"> class='disabled' </c:if> ><a href="${pageContext.request.contextPath }/ProductServlet?method=findByCid&currPage=${pageBean.currPage+1 }&cid=${param.cid }" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</div>
	<!-- 分页结束=======================        -->

	<!--
       		商品浏览记录:
        -->
	<div
		style="width: 1210px; margin: 0 auto; padding: 0 9px; border: 1px solid #ddd; border-top: 2px solid #999; height: 246px;">

		<h4 style="width: 50%; float: left; font: 14px/30px"微软雅黑 ";">浏览记录&nbsp;|&nbsp;<a href="${pageContext.request.contextPath }/UserServlet?method=clearHistory&currPage=${pageBean.currPage}&cid=${param.cid}">清除记录</a></h4><br>
		<div style="width: 50%; float: right; text-align: right;">
			<a href="">more</a>
		</div>
		<div style="clear: both;"></div>

		<div style="overflow: hidden;">

			<ul style="list-style: none;">
			
			<c:if test="${history == null }">
				<h3>你还没有浏览任何商品！</h3>
			</c:if>
			<c:if test="${history != null }">
				<%
					List<String> list = (List<String>)session.getAttribute("history");
					ProductService productService = new ProductServiceImpl();
					for(String pid : list){
					
						Product p =	productService.findByPid(pid);
						pageContext.setAttribute("p", p);
						
					%>
					<li
					style="width: 150px; height: 216; float: left; margin: 0 8px 0 0; padding: 0 18px 15px; text-align: center;"><a href="${pageContext.request.contextPath }/ProductServlet?method=findByPid&pid=${p.pid}"><img
					src="${pageContext.request.contextPath }/${p.pimage}" width="130px" height="130px" /></a></li>
					<%
					}
					
				
				
				%>
			</c:if>		
					
			</ul>

		</div>
	</div>
	<div style="margin-top: 50px;">
		<img src="${pageContext.request.contextPath }/image/footer.jpg" width="100%" height="78" alt="我们的优势"
			title="我们的优势" />
	</div>

	<div style="text-align: center; margin-top: 5px;">
		<ul class="list-inline">
			<li><a>关于我们</a></li>
			<li><a>联系我们</a></li>
			<li><a>招贤纳士</a></li>
			<li><a>法律声明</a></li>
			<li><a>友情链接</a></li>
			<li><a target="_blank">支付方式</a></li>
			<li><a target="_blank">配送方式</a></li>
			<li><a>服务声明</a></li>
			<li><a>广告声明</a></li>
		</ul>
	</div>
	<div style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
		Copyright &copy; 2005-2016 传智商城 版权所有</div>

</body>

</html>