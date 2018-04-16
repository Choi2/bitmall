<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<table width="959">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td width="10"></td>
		<td valign="top">

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

<!-- 주문상품 내역 -->
			<table width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title2.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>

			<table width="685">
				<tr><td colspan="6" height="2" bgcolor="8B9CBF"></td></tr>
				<tr>
					<td width="60"  bgcolor="F2F2F2" align="center" height="30"></td>
					<td width="395" bgcolor="F2F2F2" align="center">상품명</td>
					<td width="50"  bgcolor="F2F2F2" align="center">수량</td>
					<td width="90"  bgcolor="F2F2F2" align="center">금액</td>
					<td width="90"  bgcolor="F2F2F2" align="center">합계</td>
				</tr>
				<tr><td colspan="6" bgcolor="DEDCDD"></td></tr>
				
				<c:set var="total" value="0" />
				<c:forEach items="${list}" var="vo" varStatus="status">
					<tr>
						<td width="60">
							<a href="${pageContext.servletContext.contextPath}/product/detail?no=${vo.no}">
							<img src="${vo.imagePath}" width="50" height="50" border="0"></a>
						</td>
						<td height="52">
							<font color="686868">${vo.name}</font><br>
							<font color="#0066CC">[옵션]</font>
							<c:forEach items="${optionResult[status.index]}" var="result">
								<span>${result.optionName} : </span> 
								<span>${result.memberOptionValue}</span> 
							</c:forEach>
						</td>
						<td align="center"><font color="686868">${vo.itemCount}</font></td>
						<td align="right"><font color="686868">${vo.discountPrice}</font></td>
						<td align="right"><font color="686868">${vo.itemCount * vo.discountPrice}</font></td>
					</tr>
					<tr><td colspan="6" background="${pageContext.servletContext.contextPath }/assets/images/line_dot.gif"></td></tr>
					<input type="hidden" value="${total = total + (vo.discountPrice * vo.itemCount)}" />
				</c:forEach>
			</table>

			<br><br><br> 

			<table width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title3.gif" border="0" align="middle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>
			<table width="685">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>
			<table cellspacing="1" width="685" bgcolor="#EEEEEE" >
				<c:if test="${order.cardNo ne 0}">
					<tr height="25">
						<td width="100" bgcolor="#F2F2F2">&nbsp;주문번호</td>
						<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.no}<font></td>
						<td width="100" bgcolor="#F2F2F2">&nbsp;결제금액</td>
						<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#D06404"><b>${total}</b></font></td>
					</tr>
					<tr height="25">
						<td width="100" bgcolor="#F2F2F2">&nbsp;결제방식</td>
						<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">카드</font></td>
						<td width="100" bgcolor="#F2F2F2">&nbsp;승인번호</td>
						<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">12341234</font></td>
					</tr>
					<tr height="25">
						<td width="100" bgcolor="#F2F2F2">&nbsp;카드종류</td>
						<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">국민카드</font></td>
						<td width="100" bgcolor="#F2F2F2">&nbsp;할부</td>
						<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">일시불</font></td>
					</tr>
				</c:if>
				<c:if test="${order.bankNo ne 0}">
					<tr height="25">
						<td width="100" bgcolor="#F2F2F2">&nbsp;결제방식</td>
						<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">온라인 (${bank.bankName}:000-00-0000-0000)</font></td>
						<td width="100" bgcolor="#F2F2F2">&nbsp;보낸사람</td>
						<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${bank.sender}</font></td>
					</tr>
				</c:if>
			</table>
			<table width="685">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<br><br><br>

			<table width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title4.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>
			<table width="685">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>
			<table cellspacing="1" width="685" bgcolor="#EEEEEE" class="cmfont">
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;주문자명</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${member.name}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;전화번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${member.phone}</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;휴대폰</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${member.cellphone}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;이메일</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${member.email}</font></td>
				</tr>
				<tr><td height="1" bgcolor="8B9CBF" colspan="4"></td></tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;수취인명</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${order.receiver}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;전화번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.phone}</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;휴대폰</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.cellphone}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;배달주소</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${order.address}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;메모</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${order.content}</font></td>
				</tr>
				
			</table>
			<table width="685">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<table width="690">
				<tr>
					<td height="40" class="cmfont" align="right">
						<a href="jumun.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/b_list.gif" border="0"></a>&nbsp;&nbsp;&nbsp
					</td>
				</tr>
			</table>


<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>