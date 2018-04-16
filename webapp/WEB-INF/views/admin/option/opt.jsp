<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>쇼핑몰 관리자 홈페이지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<style>
#count {
	margin: 0;
	padding: 0;
	display: block;
}
</style>
</head>
<body>
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>

<div id="count">
	<span>옵션수 : ${list.size()}</span>
	<a href="${pageContext.servletContext.contextPath }/admin/option/insert"><input type="button" value="신규입력"></a>
</div>
		
<div id="content">
	<table width="450" border="1" cellspacing="0" cellpadding="4"  bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="20"> 
		<td width="50"  align="center"><font color="#142712">번호</font></td>
		<td width="200" align="center"><font color="#142712">옵션명</font></td>
		<td width="100" align="center"><font color="#142712">수정/삭제</font></td>
		<td width="100" align="center"><font color="#142712">소옵션편집</font></td>
	</tr>
	
	<c:forEach items="${list}" var="vo">
		<tr bgcolor="#F2F2F2" height="20">	
			<td width="50"  align="center">${vo.no}</td>
			<td width="200" align="left">${vo.name}</td>
			<td width="100" align="center">
				<a href="edit">수정</a>/
				<a href="#">삭제</a>
			</td>
			<td width="100" align="center"><a href="${pageContext.servletContext.contextPath }/admin/option/opts">소옵션편집</a></td>
		</tr>
	</c:forEach>
</table>
</div>			

</body>
</html>