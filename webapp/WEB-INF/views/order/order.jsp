<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<script>

$(function(){
	$('#submit-order').click(function(){

		var phone = 	$('#tel1').val() + '-' +
					    $('#tel2').val() + '-' +
					    $('#tel3').val();

		var cellphone = $('#phone1').val() + '-' +
	    				$('#phone2').val() + '-' +
	   					$('#phone3').val();

		$('input[name=phone]').val(phone);
		$('input[name=cellphone]').val(cellphone);
		
		if($('input[name=pay_type]').val() == 'card') {
			
			
			var number = $('#card_no1').val() + '-' +
					     $('#card_no2').val() + '-' +
					     $('#card_no3').val() + '-' +
					     $('#card_no4').val();

			var period = $('#card_month').val() + '-' +
							$('#card_year').val();
			
			$('input[name=number]').val(number);
			$('input[name=period]').val(period);
		}
		
		
		if($('input[name=itemCount]').val() > 1 && $('input[name=type]').val() != "one") {
			$('input[name=itemName]').val($('input[name=itemName]').val() + " 외 " + $('input[name=itemCount]').val());
		}
 		
		$('#order').attr('method','post')
					.attr('action','${pageContext.servletContext.contextPath }/order/add')
					.submit();
	});
	
});

			function Check_Value() {
				if (!order.o_name.value) {
					alert("주문자 이름이 잘 못 되었습니다.");	order.o_name.focus();	return;
				}
				if (!order.o_tel1.value || !order.o_tel2.value || !order.o_tel3.value) {
					alert("전화번호가 잘 못 되었습니다.");	order.o_tel1.focus();	return;
				}
				if (!order.o_phone1.value || !order.o_phone2.value || !order.o_phone3.value) {
					alert("핸드폰이 잘 못 되었습니다.");	order.o_phone1.focus();	return;
				}
				if (!order.o_email.value) {
					alert("이메일이 잘 못 되었습니다.");	order.o_email.focus();	return;
				}
				if (!order.o_zip1.value || !order.o_zip2.value) {
					alert("우편번호가 잘 못 되었습니다.");	order.o_zip1.focus();	return;
				}
				if (!order.o_juso.value) {
					alert("주소가 잘 못 되었습니다.");	order.o_email.focus();	return;
				}

				if (!order.r_name.value) {
					alert("받으실 분의 이름이 잘 못 되었습니다.");	order.r_name.focus();	return;
				}
				if (!order.r_tel1.value || !order.r_tel2.value || !order.r_tel3.value) {
					alert("전화번호가 잘 못 되었습니다.");	order.r_tel1.focus();	return;
				}
				if (!order.r_phone1.value || !order.r_phone2.value || !order.r_phone3.value) {
					alert("핸드폰이 잘 못 되었습니다.");	order.r_phone1.focus();	return;
				}
				if (!order.r_email.value) {
					alert("이메일이 잘 못 되었습니다.");	order.r_email.focus();	return;
				}
				if (!order.r_zip1.value || !order.r_zip2.value) {
					alert("우편번호가 잘 못 되었습니다.");	order.r_zip1.focus();	return;
				}
				if (!order.r_juso.value) {
					alert("주소가 잘 못 되었습니다.");	order.r_email.focus();	return;
				}

				order.submit();
			}


			function SameCopy(str) {
				if (str == "Y") {
					
					$.ajax({
						url:"${pageContext.servletContext.contextPath}/member/same",
						type:"post",
						dataType:"json",
						success: function(response) {
							var phone = response.phone.split('-');
							var cellphone = response.cellphone.split('-');
							$('input[name=orderer]').val(response.name);
							$('input[name=receiver]').val(response.name);
							
							$('input[name=tel1]').val(phone[0]);
							$('input[name=tel2]').val(phone[1]);
							$('input[name=tel3]').val(phone[2]);
							
							$('input[name=phone1]').val(cellphone[0]);
							$('input[name=phone2]').val(cellphone[1]);
							$('input[name=phone3]').val(cellphone[2]);
							
							$('input[name=email]').val(response.email);
							$('input[name=zipcode]').val(response.zipcode);
							$('input[name=address]').val(response.address);	
						}
					});
					
				}
				else {
					order.r_name.value = "";
					order.r_zip1.value = "";
					order.r_zip2.value = "";
					order.r_juso.value = "";
					order.r_tel1.value = "";
					order.r_tel2.value = "";
					order.r_tel3.value = "";
					order.r_phone1.value = "";
					order.r_phone2.value = "";
					order.r_phone3.value = "";
					order.r_email.value = "";
				}
			}
			
			
			function Check_Value() 
			{
				if (order.pay_method[0].checked)
				{
					if (!order.card_kind.value) {
						alert("카드종류를 선택하세요.");	order.card_kind.focus();	return;
					}
					if (!order.card_no1.value || order.card_no1.value.length!=4) {
						alert("카드번호를 입력하세요.");	order.card_no1.focus();	return;
					}
					if (!order.card_no2.value || order.card_no2.value.length!=4) {
						alert("카드번호를 입력하세요.");	order.card_no2.focus();	return;
					}
					if (!order.card_no3.value || order.card_no3.value.length!=4) {
						alert("카드번호를 입력하세요.");	order.card_no3.focus();	return;
					}
					if (!order.card_no4.value || order.card_no4.value.length!=4) {
						alert("카드번호를 입력하세요.");	order.card_no4.focus();	return;
					}
					if (!order.card_year.value) {
						alert("카드기간 년도를 선택하세요.");	order.card_year.focus();	return;
					}
					if (!order.card_month.value) {
						alert("카드기간 월을 선택하세요.");	order.card_month.focus();	return;
					}
					if (!order.card_pw.value) {
						alert("카드 암호 뒷의 2자리를 선택하세요.");	order.card_pw.focus();	return;
					}
				}
				else
				{
					if (!order.bank_kind.value) {
						alert("입금할 은행을 선택하세요.");	order.bank_kind.focus();	return;
					}
					if (!order.bank_sender.value) {
						alert("입금자 이름을 입력하세요.");	order.bank_sender.focus();	return;
					}
				}
				
				order.submit();
			}

			function PaySel(n) {
				if (n == 0) { //카드
					$('input[name=pay_type]').val('card');
					order.sort.disabled = false;
					order.card_no1.disabled = false;
					order.card_no2.disabled = false;
					order.card_no3.disabled = false;
					order.card_no4.disabled = false;
					order.card_year.disabled = false;
					order.card_month.disabled = false;
					order.password.disabled = false;
					order.bankName.disabled = true;
					order.sender.disabled = true;
				}
				else { //무통장
					$('input[name=pay_type]').val('bank');
					order.sort.disabled = true;
					order.card_no1.disabled = true;
					order.card_no2.disabled = true;
					order.card_no3.disabled = true;
					order.card_no4.disabled = true;
					order.card_year.disabled = true;
					order.card_month.disabled = true;
					order.password.disabled = true;
					order.bankName.disabled = false;
					order.sender.disabled = false;
				}
			}

</script>
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

<form id="order">
			<input type="hidden" name="type" value="${param.type}"/>			
			<input type="hidden" name="memberNo" value="${sessionScope.authMember.no}"/>			
			<table width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>

			<table cellpadding="5" cellspacing="1" width="710" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="440" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="100" align="center">가격</td>
					<td width="100" align="center">합계</td>
				</tr>
				
				
				<c:if test="${param.type eq 'one'}">
					<input type="hidden" name="itemNo" value="${list.no}"/>
					<input type="hidden" name="itemCount" value="${list.itemCount}"/>
					<input type="hidden" name="price" value="${list.discountPrice * list.itemCount}"/>
					<input type="hidden" name="totalPrice" value="${list.discountPrice * list.itemCount}"/>
					<input type="hidden" name="itemName" value="${list.name}"/>
					<c:set var="total" value="0" />
					<tr bgcolor="#FFFFFF">
						<td height="60" align="center">
							
							<table>
								<tr>
									<td width="60">
										<a href="${pageContext.servletContext.contextPath}/product/detail?no=${list.no}">
										<img src="${list.imagePath}" width="50" height="50" border="0"></a>
									</td>
									<td class="cmfont">
										<a href="${pageContext.servletContext.contextPath}/product/detail?no=${vo.no}">
										<font color="#0066CC">${list.name}</font></a><br>
										<span>[옵션]</span>
										<c:forEach items="${optionResult}" var="result" varStatus="status">
											<input type="hidden" name="memberOptionList[${status.index}].optionName" value="${result.optionName}"/>
											<input type="hidden" name="memberOptionList[${status.index}].itemOptionNo" value="${result.itemOptionNo}"/>
											<input type="hidden" name="memberOptionList[${status.index}].memberOptionValue" value="${result.memberOptionValue}"/>
											<span>${result.optionName} : </span> 
											<span>${result.memberOptionValue}</span> 
										</c:forEach>
									</td>
								</tr>
							</table>
						</td>
						<td align="center"><font color="#464646">${list.itemCount}개</font></td>
						<td align="center"><font color="#464646">${list.discountPrice}</font> 원</td>
						<td align="center"><font color="#464646">${list.discountPrice * list.itemCount}</font> 원</td>
					</tr>
					<input type="hidden" value="${total = total + (list.discountPrice * list.itemCount)}" />
				</c:if>
				
				<!-- 장바구니 인경우 -->
				
				<c:if test="${param.type ne 'one'}">
					<c:set var="total" value="0" />
					<c:set var="count" value="0" />
					<input type="hidden" name="itemName" value="${list[0].name}"/>
					<c:forEach items="${list}" var="vo" varStatus="status">
					<c:if test="${cartList[status.index].isOrder eq false}">
						<input type="hidden" name="cartList[${status.index}].itemNo" value="${vo.no}"/>
						<input type="hidden" name="cartList[${status.index}].itemCount" value="${vo.itemCount}"/>
						<input type="hidden" name="cartList[${status.index}].price" value="${vo.discountPrice * vo.itemCount}"/>
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
								<td align="center" bgcolor="#FFFFFF"><font color="#464646">${vo.discountPrice}</font></td>
								<td align="center" bgcolor="#FFFFFF"><font color="#464646">${vo.discountPrice * vo.itemCount}</font></td>
								<td align="center" bgcolor="#FFFFFF">
									<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
									<a href = "#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
								</td>
								
							</tr>
							<input type="hidden" value="${total = total + (vo.discountPrice * vo.itemCount)}" />
							<input type="hidden" value="${count = count + vo.itemCount}" />
						</c:if>
					</c:forEach>
					<input type="hidden" name="itemCount" value="${count}"/>
					<input type="hidden" name="totalPrice" value="${total}"/>
				</c:if>	

				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table>
							<tr>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(${total}원) + 배송료(2,500원) = <font color="#FF3333"><b>${total + 2500 }원</b></font>&nbsp;&nbsp
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br>

			<!-- 주문자 정보 -->

			<!-- order 시작  -->
			
			
			<!-- 배송지 정보 -->
			<table width="710">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>배송지 정보</b></font></td>
					<td align="center" width="560">

						<table width="560">
							<tr height="25">
								<td width="150"><b>주문자정보와 동일</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="radio" name="same" onclick="SameCopy('Y')">예 &nbsp;
									<input type="radio" name="same" onclick="SameCopy('N')">아니오
								</td>
							</tr>
							
							<tr height="25">
								<td width="150"><b>주문자 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="orderer" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							
							
							<tr height="25">
								<td width="150"><b>받으실 분 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="receiver" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="phone" value=""/>
									<input type="text" id="tel1" name="tel1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="tel2" name="tel2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="tel3" name="tel3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="cellphone" value=""/>
									<input type="text" id="phone1" name="phone1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="phone2" name="phone2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="phone3" name="phone3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="email" size="50" maxlength="50" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="zipcode" size="6" maxlength="10" value="" /> 
									<a href="javascript:FindZip(2)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="middle" border="0"></a> <br>
									<input type="text" id='address' name='address' size = "50" maxlength = "200" value = "" class="cmfont1"><br>
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>배송시요구사항</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<textarea name="content" cols="60" rows="3" class="cmfont1"></textarea>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>


			<!-- 결재방법 선택 및 입력 -->
			<table width="710">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>결재방법</b></font></td>
					<td align="center" width="560">

						<table width="560">
							<tr height="25">
								<td width="150"><b>결재방법 선택</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="pay_type" value=""/>
									<input type="radio" name="pay_method" onclick="javascript:PaySel(0);" checked>카드 &nbsp;
									<input type="radio" name="pay_method" onclick="javascript:PaySel(1);">무통장
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710">
				<tr height="1" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>
			
			
			<!------------- 카드 --------------->
			<table id="card">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>카드</b></font></td>
					<td align="center" width="560">
						<table width="560">
							<tr height="25">
								<td width="150"><b>카드종류</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<select name="sort">
										<option value="">카드종류를 선택하세요.</option>
										<option value="국민카드">국민카드</option>
										<option value="신한카드">신한카드</option>
										<option value="우리카드">우리카드</option>
										<option value="하나카드">하나카드</option>
									</select>
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>카드번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="number" value=""/>
									<input type="text" id="card_no1" name="card_no1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="card_no2" name="card_no2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="card_no3" name="card_no3" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="card_no4" name="card_no4" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>카드기간</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="period" value=""/>
									<input type="text" id="card_month" name="card_month" size="2" maxlength="2" value="" class="cmfont1"> 월 / 
									<input type="text" id="card_year" name="card_year"  size="2" maxlength="2" value="" class="cmfont1"> 년
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>카드비밀번호(뒷2자리)</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									**<input type="password" name="password" size="2" maxlength="2" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>할부</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<select name="divide">
										<option value="0">일시불</option>
										<option value="3">3 개월</option>
										<option value="6">6 개월</option>
										<option value="9">9 개월</option>
										<option value="12">12 개월</option>
									</select>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710">
				<tr height="1" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>
			
			
			<!-- 무통장 -->
			<table id="bank" width="710">
				<tr>
					<td align="left" valign="top" width="150" style="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>무통장 입금</b></font></td>
					<td align="center" width="560">
						<table width="560">
							<tr height="25">
								<td width="150"><b>은행선택</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<select name="bankName" disabled>
										<option value="">입금할 은행을 선택하세요.</option>
										<option value="국민은행">국민은행 000-00000-0000</option>
										<option value="신한은행">신한은행 000-00000-0000</option>
									</select>
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>입금자 이름</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="sender" size="15" maxlength="20" value="" class="cmfont1" disabled>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>
			
			<table width="710">
				<tr>
					<td align="center">
						<input id="submit-order" type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
					</td>
				</tr>
				<tr height="20"><td></td></tr>
			</table>
			
			</form>
		


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