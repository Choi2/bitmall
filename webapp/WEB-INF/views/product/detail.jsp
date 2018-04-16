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
			$('a[class=cart]').on("click", function(e){
				e.preventDefault();
				var url = $(this).closest('a').attr('href');
				$('#detail').attr({
					'method' : 'post',
					'action' : url
				}).submit();
			});
			
			$('a[class=order]').on("click", function(e){
				e.preventDefault();
				var url = $(this).closest('a').attr('href');
				$('#detail').attr({
					'method' : 'post',
					'action' : url
				}).submit();
			});
		});
	</script>
</head>
<body style="margin:0">
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

			<table width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/product_title3.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<!-- form2 시작  -->
			<form id="detail">
			<input type="hidden" name="itemNo" value="${vo.no}">

			<table width="745">
				<tr>
					<td width="335" align="center" valign="top">
						<!-- 상품이미지 -->
						<table cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
							<tr>
								<td bgcolor="white" align="center">
									<img src="${vo.imagePath}" height="315" border="0" align="absmiddle" ONCLICK="Zoomimage('0000')" STYLE="cursor:hand">
								</td>
							</tr>
						</table>
					</td>
					<td width="410" align="center" valign="top">
						<!-- 상품명 -->
						<table width="370">
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<tr>
								<td width="80" height="45" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>제품명</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<font color="282828">${vo.name}</font><br>
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1"> 
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 시중가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>소비자가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td width="289" style="padding-left:10px"><font color="666666">${vo.sellingPrice}원</font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 판매가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>판매가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px"><font color="0288DD"><b>${vo.discountPrice}원</b></font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							
							<!-- 옵션 -->
							<c:forEach items="${itemOptionList}" var="vo" varStatus="status">
								<tr>
									<td width="80" height="35" style="padding-left:10px">
										<input type="hidden" name="memberOptionList[${status.index}].optionName" value="${vo.optionName}"/>
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="middle">
										<font color="666666"><b>${vo.optionName}</b></font>
									</td>
									<td width="1" bgcolor="E8E7EA"></td>
									<td style="padding-left:10px">
										
										<input type="hidden" name="memberOptionList[${status.index}].itemOptionNo" value="${vo.no}"/>
							
											<c:set var="values" value="${fn:split(vo.itemOptionValues,';')}" />
											<select name="memberOptionList[${status.index}].memberOptionValue">
												<option value="">선택하세요</option>
												<c:forEach items="${values}" var="val">
													<option value="${val}">${val}</option>
												</c:forEach>
											</select>
									</td>
								</tr>
							</c:forEach>
							
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 수량 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="middle">
									<font color="666666"><b>수량</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<input type="text" name="itemCount" value="1" size="3" maxlength="5"> 
									<font color="666666">개</font>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
						</table>
						<table width="370">
							<tr>
								<td height="70" align="center">
									<a class="order" href="${pageContext.servletContext.contextPath}/order?itemNo=${vo.no}&type=one">
										<img src="${pageContext.servletContext.contextPath }/assets/images/b_order.gif" border="0" align="middle">
									</a>&nbsp;&nbsp;&nbsp;
									<a class="cart" href="${pageContext.servletContext.contextPath}/product/cart?itemNo=${vo.no}">
										<img src="${pageContext.servletContext.contextPath }/assets/images/b_cart.gif"  border="0" align="middle">
									</a>
								</td>
							</tr>
						</table>
						<table width="370">
							<tr>
								<td height="30" align="center">
									<img src="${pageContext.servletContext.contextPath }/assets/images/product_text1.gif" border="0" align="absmiddle">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			<!-- form2 끝  -->

			<table width="747">
				<tr><td height="22"></td></tr>
			</table>

			<!-- 상세설명 -->
			<table width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table width="746">
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
					</td>
				</tr>
			</table>
			<table width="746" style="font-size:9pt">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="200" valign=top style="line-height:14pt">
						${vo.content}
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