<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath}/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<table id="items" width="959" >
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td width="10"></td>
		<td valign="top">

		<!-------------------------------------------------------------------------------------------->	
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<!---- 화면 우측(신상품) 시작 -------------------------------------------------->	
			<table width="767">
				<tr>
					<td height="60">
						<img src="${pageContext.servletContext.contextPath }/assets/images/main_newproduct.jpg" width="767" height="40">
					</td>
				</tr>
			</table>

			<table>
				<!---1번째 줄-->
				
					<c:forEach items="${itemList}" var="vo" varStatus="status">
						<c:if test="${status.index % 5 eq 0}">
						<tr>
						</c:if>
						<td width="150" height="205" align="center" valign="top">
							<table width="100">
								<tr> 
									<td align="center"> 
										<a href="${pageContext.servletContext.contextPath}/product/detail?no=${vo.no}">
										<img src="${vo.imagePath}" width="120" height="140" border="0"></a>
									</td>
								</tr>
								<tr><td height="5"></td></tr>
								<tr> 
									<td height="20" align="center">
										<font color="444444">${vo.name}</font>
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="middle" vspace="1"> 
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="middle" vspace="1"> 
									</td>
								</tr>
								<tr><td height="20" align="center"><b>${vo.sellingPrice} 원</b></td></tr>
							</table>
						</td>
						<c:if test="${(status.index + 1) % 5 == 0}">
						</tr>
						</c:if>
					</c:forEach>
				<tr><td height="10"></td></tr>
			</table>

			<!---- 화면 우측(신상품) 끝 -------------------------------------------------->	

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->

		</td>
	</tr>
</table>
<br><br>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>