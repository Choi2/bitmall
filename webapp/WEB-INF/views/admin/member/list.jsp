<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>쇼핑몰 관리자 홈페이지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	$(function(){
		$('.modify').click(function(e){
			e.preventDefault();
			var url = $(this).attr('href');
			window.open(url,"수정","width=780, height=550");
			return false;
		});
	});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<table width="800">
	<tr height="40">
		<td width="200" valign="bottom">&nbsp 회원수 : <font color="#FF0000">${list.size()}</font></td>
		<td width="200">&nbsp</td>
		<td width="350" align="right" valign="bottom">
			<select name="sel1" class="combo1">
				<option value="1" >이름</option>
				<option value="2" >아이디</option>
			</select>
			<input type="text" name="text1" size="15" value="">&nbsp;
		</td>
		<td width="50" valign="bottom">
			<input type="submit" value="검색">&nbsp;
		</td>
	</tr>
	<tr><td height="5" colspan="4"></td></tr>
</table>

<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">ID</td>
		<td width="100" align="center">이름</td>
		<td width="100" align="center">전화</td>
		<td width="100" align="center">핸드폰</td>
		<td width="200" align="center">E-Mail</td>
		<td width="100" align="center">회원구분</td>
		<td width="100" align="center">수정/삭제</td>
	</tr>
		
	<c:forEach var="vo" items="${list}" varStatus="status">
		<tr bgcolor="#F2F2F2" height="23">	
			<td width="100">${vo.id}</td>	
			<td width="100">${vo.name}</td>	
			<td width="100">${vo.phone}</td>	
			<td width="100">${vo.cellphone}</td>	
			<td width="200">${vo.email}</td>	
			<td width="100" align="center">${vo.auth}</td>	
			<td width="100" align="center">
				<a class="modify" href="${pageContext.servletContext.contextPath }/admin/member/modify?no=${vo.no}">수정</a>/
				<a class="delete" href="${pageContext.servletContext.contextPath }/admin/member/delete?no=${vo.no}">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>
<br>
<table width="800">
	<tr>
		<td height="30" class="cmfont" align="center">
			<img src="${pageContext.servletContext.contextPath}/assets/images/admin/i_prev.gif" align="middle" border="0"> 
			<font color="#FC0504"><b>1</b></font>&nbsp;
			<a href="member.jsp?page=2"><font color="#7C7A77">[2]</font></a>&nbsp;
			<a href="member.jsp?page=3"><font color="#7C7A77">[3]</font></a>&nbsp;
			<img src="${pageContext.servletContext.contextPath}/assets/images/admin/i_next.gif" align="middle" border="0">
		</td>
	</tr>
</table>
</center>
</body>
</html>