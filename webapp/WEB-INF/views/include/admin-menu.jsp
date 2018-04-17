<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<style>
#admin-menu {
	width : 500px;
	height : 44px;
	float : left;
	height : 10px;
}
#admin-menu > ul {
	display : inline-block;
	position : relative;
	list-style: none;
}
#admin-menu > ul > li{
	float: left;
	height : 44px;
	padding: 0 15px;
	box-sizing : border-box;
}
</style>

<div id="admin-header">
	<div id="admin-menu">
		<ul>
			<li>
				<font color='#0457A2'>▶ </font> 
				<a href='${pageContext.servletContext.contextPath }/admin/member'>
				<font color='#0457A2'>회원관리</font></a>
			</li>
			<li>
				<font color='#0457A2'>▶ </font>
				<a href='${pageContext.servletContext.contextPath }/admin/product'>
				<font color='#0457A2'>상품관리</font></a>
			</li>
			<li>
				<font color='#0457A2'>▶ </font>
				<a href='${pageContext.servletContext.contextPath }/admin/jumun'>
				<font color='#0457A2'>주문관리</font></a>
			</li>
			<li>
				<font color='#0457A2'>▶ </font>
				<a href='${pageContext.servletContext.contextPath }/admin/option'>
					<font color='#0457A2'>옵션관리</font></a>
			</li>
			<li>
				<font color='#0457A2'>▶ </font>
				<a href='${pageContext.servletContext.contextPath }/admin/faq'>
				<font color='#0457A2'>FAQ관리</font></a>
			</li>
		</ul>
	</div>
	
	<div id="login">
		<c:if test="${sessionScope.authMember.id eq 'root'}">
			<a href="${pageContext.servletContext.contextPath }/member/logout"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02_1.gif" border="0"></a>
		</c:if>
	</div>
</div>