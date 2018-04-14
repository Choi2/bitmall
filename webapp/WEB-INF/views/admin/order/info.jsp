<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문번호</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE"><font size="3"><b>${order.no}</b></font></td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문일</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE"><fmt:formatDate value="${vo.orderDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${member.name}</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자전화</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${member.phone}</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자 E-Mail</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${member.email}</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자핸드폰</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${member.cellphone}</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자주소</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE" colspan="3">${member.address}</td>
	</tr>
	</tr>
</table>
<img src="blank.gif" width="10" height="5"><br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.receiver}</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자전화</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.phone}</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자 E-Mail</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.email}</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자핸드폰</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.cellphone}</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자주소</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE" colspan="3">${order.address}</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">메모</font></td>
        <td width="300" height="50" bgcolor="#EEEEEE" colspan="3">${order.content}</td>
	</tr>
</table>
<br>

<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<c:if test="${order.cardNo ne 0}">
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">지불종류</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">카드</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">카드승인번호 </font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">12345678&nbsp</td>
		</tr>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">카드 할부</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">일시불</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">카드종류</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">개인</td>
		</tr>
	</c:if>
	<c:if test="${order.bankNo ne 0}">
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">무통장</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${bank.bankName}</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">입금자이름</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${bank.sender}</td>
		</tr>
	</c:if>
</table>

<br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC"> 
    <td width="340" height="20" align="center"><font color="#142712">상품명</font></td>
		<td width="50"  height="20" align="center"><font color="#142712">수량</font></td>
		<td width="70"  height="20" align="center"><font color="#142712">단가</font></td>
		<td width="70"  height="20" align="center"><font color="#142712">금액</font></td>
		<td width="50"  height="20" align="center"><font color="#142712">할인</font></td>
		<td width="60"  height="20" align="center"><font color="#142712">옵션</font></td>
	</tr>
	
	<c:set var="total" value="0" />
	<c:forEach items="${list}" var="vo" varStatus="status">
		<tr bgcolor="#EEEEEE" height="20">	
			<td width="340" height="20" align="left">${vo.name}</td>	
			<td width="50"  height="20" align="center">${vo.itemCount}</td>	
			<td width="70"  height="20" align="right">${vo.sellingPrice}</td>	
			<td width="70"  height="20" align="right">${vo.discountPrice}</td>	
			<td width="50"  height="20" align="center">${vo.discount}</td>	
			<td width="60"  height="20" align="center">
				<c:forEach items="${optionResult[status.index]}" var="result">
					<span>${result.optionName} : </span> 
					<span>${result.memberOptionValue}</span> 
				</c:forEach>
			</td>	
		</tr>
		<input type="hidden" value="${total = total + (vo.discountPrice * vo.itemCount)}" />
	</c:forEach>
</table>
<img src="blank.gif" width="10" height="5"><br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
	  <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">총금액</font></td>
		<td width="700" height="20" bgcolor="#EEEEEE" align="right"><font color="#142712" size="3"><b>${total}</b></font> 원&nbsp;&nbsp</td>
	</tr>
</table>

<br>
<table width="800" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<a href="jumun.jsp"><input type="button" value="이 전 화 면"></a>&nbsp
			<input type="button" value="프린트" onClick="javascript:print();">
		</td>
	</tr>
</table>
<br>
</body>
</html>
