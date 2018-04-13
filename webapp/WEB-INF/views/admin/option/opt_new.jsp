<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script>
		$(function(){
			$('#submit').click(function(){
				$('#form1').attr('method','post');
				$('#form1').attr('action','${pageContext.servletContext.contextPath}/admin/option/insert');
				$('#form1').submit();
			});
		});
	</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form id="form1">

<table width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr> 
		<td width="130" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">새 옵션명</font>
		</td>
		<td width="250" height="20"  bgcolor="#F2F2F2">
			<input type="text" name="name" value="" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="130" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">기본 옵션값(';'로 구분해주세요.)</font>
		</td>
		<td width="250" height="20"  bgcolor="#F2F2F2">
			<input type="text" name="basicValue" value="" size="20" maxlength="20">
		</td>
	</tr>
</table>
<br>
<table width="500" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input id="submit" type="submit" value="등 록 하 기"> &nbsp;&nbsp
			<a href="opt.jsp"><input type="button" value="이 전 화 면"></a>
		</td>
	</tr>
</table>

</form>
</body>
</html>
