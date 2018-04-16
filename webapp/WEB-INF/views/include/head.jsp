<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.login {
	float : right;
}
.header-image {
	float : left;
}
</style>
<div id="header">
	<div class="login">
		<c:choose>		
			<c:when test="${sessionScope.authMember eq null}">
				<a href="${pageContext.servletContext.contextPath}"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<a href="${pageContext.servletContext.contextPath }/member/login"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<a href="${pageContext.servletContext.contextPath }/member/member_agree"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand">
			</c:when>
			
			<c:otherwise>
				<a href="${pageContext.servletContext.contextPath }"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<!-- 로그아웃 -->
				<a href="${pageContext.servletContext.contextPath }/member/logout"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02_1.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<!-- 회원정보수정 -->
				<a href="${pageContext.servletContext.contextPath }/member/modify/${authUser.no }"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03_1.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<a href="${pageContext.servletContext.contextPath }/product/cart"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
				<a href="${pageContext.servletContext.contextPath }/jumun"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11">
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="header-image">
		<img src="${pageContext.servletContext.contextPath }/assets/images/main_image0.jpg" width="930" height="175">
	</div>	
</div>

