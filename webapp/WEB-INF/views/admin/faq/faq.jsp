<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<table width="600" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left"  height="50" valign="bottom">&nbsp 자료수 : <font color="#FF0000">2</font></td>
		<td align="right" height="50" valign="bottom">
			<a href="${pageContext.servletContext.contextPath }/admin/faq_new"><input type="button" value="신규입력"></a> &nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="2"></td></tr>
</table>

<table width="600" border="1" cellspacing="0" cellpadding="4"  bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="20"> 
		<td width="50"  align="center"><font color="#142712">번호</font></td>
		<td width="450" align="center"><font color="#142712">제목</font></td>
		<td width="100" align="center"><font color="#142712">수정/삭제</font></td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="50"  align="center">1</td>
		<td width="450" align="left">자주질문1</td>
		<td width="100" align="center">
			<a href="faq_edit.jsp?no=1">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="50"  align="center">2</td>
		<td width="450" align="left">자주질문2</td>
		<td width="100" align="center">
			<a href="faq_edit.jsp?no=2">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
</table>
<br>
</body>
</html>