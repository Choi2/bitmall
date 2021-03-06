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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	$(function(){
		$('.modify').click(function(e){
			e.preventDefault();
			var url = $(this).attr('href');
			window.open(url,"수정","width=1000, height=780");
			return false;
		});
		
		$('.delete').click(function(e){
			e.preventDefault();
			alert("hi!");
			var deleteLocation = $(this).parents('td').parents('.product');
	 		var url = $(this).attr('href');
			$.ajax({
				url: url,
				type:"post",
				success: function(response) {
					deleteLocation.remove();
				}
			}); 
		});	
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<form name="form1">
<table width="800">
	<tr height="40">
		<td align="left"  width="150" valign="bottom">&nbsp; 제품수 : <font color="#FF0000">${list.size()}</font></td>
		<td align="right" width="550" valign="bottom">
			<select name="sel1">
				<option value="0" >상품상태</option>
				<option value="1" >판매중</option>
				<option value="2" >판매중지</option>
				<option value="3" >품절</option>
			</select> &nbsp;
			<select name="sel2">
				<option value="0" >아이콘선택</option>
				<option value="1" >New</option>
				<option value="2" >Hit</option>
				<option value="3" >Sale</option>
			</select> &nbsp; 
			<select name="sel3">
				<option value="0" >분류선택</option>
				<option value="1" >바지</option>
				<option value="2" >코트</option>
				<option value="3" >브라우스</option>
			</select> &nbsp;
			<select name="sel4">
				<option value="1" selected>제품이름</option>
				<option value="2" >제품번호</option>
			</select>
			<input type="text" name="text1" size="10" value="">&nbsp;
		</td>
		<td align="left" width="120" valign="bottom">
			<input type="submit" value="검색">
			&nbsp;
			<a href="product/new"><input type="button" value="새상품"></a>
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form>

<table width="800" border="1" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">제품분류</td>
		<td width="100" align="center">제품코드</td>
		<td width="280" align="center">제품명</td>
		<td width="70"  align="center">판매가</td>
		<td width="50"  align="center">상태</td>
		<td width="120" align="center">이벤트</td>
		<td width="80"  align="center">수정/삭제</td>
	</tr>
	
	<c:forEach items="${list}" var="vo">
		<tr class="product" bgcolor="#F2F2F2" height="23">
			<c:set var="icon" value="${vo.icon}"/>	
			<td width="100">${vo.groupName}</td>
			<td width="100">&nbsp; ${vo.code}</td>
			<td width="280">&nbsp; ${vo.name}</td>	
			<td width="70"  align="right">${vo.discountPrice} &nbsp; </td>	
			<td width="50"  align="center">
				<c:if test="${vo.status == 1}">
					<span>판매중</span>
				</c:if>
				<c:if test="${vo.status == 2}">
					<span>판매중지</span>
				</c:if>
				<c:if test="${vo.status == 3}">
					<span>품절</span>
				</c:if>
			</td>	
			<td width="120" align="center">
				<c:if test="${fn:substring(icon, 0,1) eq 1}">
					<img src="${pageContext.servletContext.contextPath}/assets/images/i_new.gif">
				</c:if>
				<c:if test="${fn:substring(icon, 1,2) eq 1}">
					<img src="${pageContext.servletContext.contextPath}/assets/images/i_hit.gif">		
				</c:if>
				<c:if test="${fn:substring(icon, 2,3) eq 1}">
					<img src="${pageContext.servletContext.contextPath}/assets/images/i_sale.gif">
				</c:if>
			</td>	
			<td width="80"  align="center">
				<a class="modify" href="${pageContext.servletContext.contextPath}/admin/product/modify?no=${vo.no}">수정</a>/
				<a class="delete" href="${pageContext.servletContext.contextPath}/admin/product/delete?no=${vo.no}">삭제</a>
			</td>
		</tr>	
	</c:forEach>
</table>

<br>
<table width="800">
	<tr>
		<td height="30" class="cmfont" align="center">
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
			<font color="#FC0504"><b>1</b></font>&nbsp;
			<a href="product.jsp?page=2&sel1=&sel2=&sel3=&sel4=&text1="><font color="#7C7A77">[2]</font></a>&nbsp;
			<a href="product.jsp?page=3&sel1=&sel2=&sel3=&sel4=&text1="><font color="#7C7A77">[3]</font></a>&nbsp;
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="middle" border="0">
		</td>
	</tr>
</table>
</body>
</html>