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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
		$(function(){
			$('a[class=order]').on("click", function(e){
				e.preventDefault();
				var url = $(this).closest('a').attr('href');
				$('#cart').attr({
					'method' : 'post',
					'action' : url
				}).submit();
			});
		});
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<form id="cart">
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

			<table width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table width="746">
				<tr>
					<td height="30" align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title.gif" width="746" height="30" border="0"></td>
				</tr>
			</table>
			<table width="747">
				<tr><td height="13"></td></tr>
			</table>

			<table width="710">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0"></td>
				</tr>
			</table>

			<table width="710">
				<tr><td height="10"></td></tr>
			</table>
			
			
			<table cellpadding="5" cellspacing="1" width="710" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23">
					<td width="420" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="80"  align="center">가격</td>
					<td width="90"  align="center">합계</td>
					<td width="50"  align="center">삭제</td>
				</tr>
				
				<c:if test="${list.size() eq 0}">
					<tr>
						<td colspan="5" align="center">카트에 담긴 상품이 없습니다 !</td>
					</tr>
				</c:if>
				
				<c:set var="total" value="0" />
				<c:forEach items="${list}" var="vo" varStatus="status">
					<tr>
						
						<td height="60" align="center" bgcolor="#FFFFFF">
							<table>
								<tr>
									<td width="60">
										<a href="${pageContext.servletContext.contextPath}/product/detail?no=${vo.no}">
										<img src="${vo.imagePath}" width="50" height="50" border="0"></a>
									</td>
									<td class="cmfont">
										<a href="${pageContext.servletContext.contextPath}/product/detail?no=${vo.no}">
										<font color="#0066CC">${vo.name}</font></a><br>
										<span>[옵션]</span>
									 	<c:forEach items="${optionResult[status.index]}" var="result">
											<span>${result.optionName} : </span> 
											<span>${result.memberOptionValue}</span> 
										</c:forEach>
									</td>
								</tr>
							</table>
						</td>
						<td align="center" bgcolor="#FFFFFF">
							<input type="text" name="itemCount" size="3" value="${vo.itemCount}" class="cmfont1">&nbsp<font color="#464646">개</font>
						</td>
						<td align="center" bgcolor="#FFFFFF">
						<font color="#464646">${vo.discountPrice}</font>
						</td>
						<td align="center" bgcolor="#FFFFFF"><font color="#464646">${vo.discountPrice * vo.itemCount}</font></td>
						<td align="center" bgcolor="#FFFFFF">
							<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
							<a href = "#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
						</td>
						
					</tr>
					<input type="hidden" value="${total = total + (vo.discountPrice * vo.itemCount)}" />
				</c:forEach>
				
				<c:if test="${list.size() ne 0}">
					<tr>
						<td colspan="5" bgcolor="#F0F0F0">
							<table>
								<tr>
									<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
									<td align="right" bgcolor="#F0F0F0">
										<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(${total}원) + 배송료(2,500원) = <font color="#FF3333"><b>${total + 2500}원</b></font>&nbsp;&nbsp
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>
			</table>
			<table width="710">
				<tr height="44">
					<td width="710" align="center" valign="middle">
						<a href="${pageContext.servletContext.contextPath}"><img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" alt="계속 쇼핑하기" ></a>&nbsp;&nbsp;
						<c:if test="${list.size() ne 0}">
							<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" alt="장바구니 전부지우기"></a>&nbsp;&nbsp;
							<a class="order" href="${pageContext.servletContext.contextPath }/order"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></a>
						</c:if>
					</td>
				</tr>
			</table>

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	


		</td>
	</tr>
</table>
</form>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>