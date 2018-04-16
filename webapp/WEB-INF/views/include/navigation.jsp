<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table width="181">
	<tr> 
		<td valign="top"> 
		<!--  Category 메뉴 : 세로인 경우 -------------------------------->
			<table width="177" cellpadding="2" cellspacing="1" bgcolor="#afafaf">
				<tr><td height="3"  bgcolor="#bfbfbf"></td></tr>
				<tr><td height="30" bgcolor="#f0f0f0" align="center" style="font-size:12pt;color:#333333"><b>Category</b></td></tr>
			<c:forEach items="${categoryList}" var="vo">
				<tr>
					<td bgcolor="#FFFFFF">
						<table>
							<tr>
								<td>
									<c:if test="${param.no eq vo.no}">
										<strong><a href="${pageContext.servletContext.contextPath}/menu?no=${vo.no}">${vo.groupName}</a></strong>
									</c:if>
									<c:if test="${param.no ne vo.no}">
										<a href="${pageContext.servletContext.contextPath}/menu?no=${vo.no}">${vo.groupName}</a>
									</c:if>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
			</table>
		</td>
	</tr>
				<tr><td height="10"></td></tr>
				<tr> 
					<td> 
						<!--  Custom Service 메뉴(QA, FAQ...) -->
						<table width="177" cellpadding="2" cellspacing="1" bgcolor="#afafaf">
							<tr><td height="3"  bgcolor="#a0a0a0"></td></tr>
							<tr><td height="25" bgcolor="#f0f0f0" align="center" style="font-size:11pt;color:#333333"><b>Customer Service</b></td></tr>
							<tr>
								<td bgcolor="#FFFFFF">
									<table>
										<tr><td><a href="board"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_qa.gif" border="0" width="176"></a></td></tr>
									</table>
								</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">
									<table>
										<tr><td><a href="faq"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_faq.gif" border="0" width="176"></a></td></tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>