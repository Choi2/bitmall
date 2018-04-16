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
	
	$('.modify-status').click(function(){
		var open = 	$(this).siblings('select[name=status]').attr('disabled');
		if(open == 'disabled') {
			$(this).siblings('select[name=status]').attr('disabled', false);
		} else {
			var no = $(this).siblings('input[name=no]').val();
			var status = $(this).siblings('select[name=status]').val();
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/admin/jumun/modifyStatus",
				type:"post",
				data: "no=" + no + "&status=" + status,
				dataType:"json",
				success: function(response) {
					$('input[name=status]').val(status);
					$('select[name=status]').attr('disabled', 'disabled');
				}
			});
		}
	});
});
</script>
</head>
<body>
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form name="form1" method="get" action="">
<table width="800">
	<tr height="40">
		<td align="left"  width="100" valign="bottom">&nbsp 주문수 : <font color="#FF0000">20</font></td>
		<td align="right" width="650" valign="bottom">
			기간 : 
			<input type="text" name="day1_y" size="4" value="2008">
			<select name="day1_m">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="day1_d">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select> - 
			<input type="text" name="day2_y" size="4" value="2008">
			<select name="day2_m">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="day2_d">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select> &nbsp
			<select name="sel1">
				<option value="0" selected>전체</option>
				<option value="1">주문신청</option>
				<option value="2">주문확인</option>
				<option value="3">입금확인</option>
				<option value="4">배달중</option>
				<option value="5">주문완료</option>
				<option value="6">주문취소</option>
			</select> &nbsp 
			<select name="sel2">
				<option value="1">주문번호</option>
				<option value="2">고객명</option>
				<option value="3">상품명</option>
			</select>
			<input type="text" name="text1" size="10" value="">&nbsp
		</td>
		<td align="left" width="50" height="50" valign="bottom">
			<input type="button" value="검색"> &nbsp;
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form>

<table width="800" border="1" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="70"  align="center">주문번호</td>
    <td width="70"  align="center">주문일</td>
	  <td width="250" align="center">상품명</td>
		<td width="40"  align="center">제품수</td>	
		<td width="70"  align="center">총금액</td>
    <td width="65"  align="center">주문자</td>
		<td width="50"  align="center">결재</td>
    <td width="135" align="center">주문상태</td>
    <td width="50"  align="center">삭제</td>
	</tr>
	
	<c:forEach items="${list}" var="vo" varStatus="status">
		<tr bgcolor="#F2F2F2" height="23">
			<td width="70"  align="center"><a href="${pageContext.servletContext.contextPath}/admin/jumun/info?no=${vo.no}">${vo.no}</a></td>
			<td width="70"  align="center"><fmt:formatDate value="${vo.orderDate}" pattern="yyyy-MM-dd"/></td>
			<td width="250" align="left">${vo.itemName}</td>	
			<td width="40" align="center">${vo.itemCount}</td>	
			<td width="70"  align="right">${vo.totalPrice}</td>	
			<td width="65"  align="center">${vo.orderer}</td>	
			<td width="50"  align="center">
				<c:if test="${vo.bankNo != 0}">
					<span>무통장</span>
				</c:if>
				
				<c:if test="${vo.cardNo != 0}">
					<span>카드</span>
				</c:if>
			</td>
			
			<td width="135" align="center" valign="bottom">
				<input type="hidden" name="status" value="${vo.status}"/>
				<select name="status" disabled="disabled">
					<option value="주문신청"<c:if test="${vo.status eq '주문신청'}">selected</c:if>>주문신청</option>
					<option value="주문확인"<c:if test="${vo.status eq '주문확인'}">selected</c:if>>주문확인</option>
					<option value="입금확인"<c:if test="${vo.status eq '입금확인'}">selected</c:if>>입금확인</option>
					<option value="배송중"<c:if test="${vo.status eq '배송중'}">selected</c:if>>배송중</option>
					<option value="주문완료"<c:if test="${vo.status eq '주문완료'}">selected</c:if>>주문완료</option>
					<option value="주문취소"<c:if test="${vo.status eq '주문취소'}">selected</c:if>>주문취소</option>
				</select>&nbsp;
				<input class="modify-status" type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" alt="수정하기">
				<input type="hidden" name="no" value="${vo.no}"/> 
			</td>	
			<td width="50" align="center">
				<a href="${pageContext.servletContext.contextPath }/admin/jumun/delete?no=${vo.no}">
					<img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" alt="삭제하기">
				</a>
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
			<a href="jumun.jsp?page=2&sel1=&sel2=&text1=&day1_y=&day1_m=&day1_d=&day2_y=&day2_m=&day2_d="><font color="#7C7A77">[2]</font></a>&nbsp;
			<a href="jumun.jsp?page=3&sel1=&sel2=&text1=&day1_y=&day1_m=&day1_d=&day2_y=&day2_m=&day2_d="><font color="#7C7A77">[3]</font></a>&nbsp;
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
		</td>
	</tr>
</table>
</body>
</html>