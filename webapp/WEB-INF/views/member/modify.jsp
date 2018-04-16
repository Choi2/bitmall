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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#zipcode').val(data.zonecode); //5자리 새우편번호 사용
           	$('#address').val(fullAddr);

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

$(function(){
	
	$('img[name=zipcode]').click(function(){
		execDaumPostcode();
	});
	
	
	$('input[name=modify]').click(function(){
	
		var phone = $('#tel1').val() + '-' +
				    $('#tel2').val() + '-' +
				    $('#tel3').val();

		var cellphone = $('#phone1').val() + '-' +
	    				$('#phone2').val() + '-' +
	   					$('#phone3').val();

		
		$('input[name=phone]').val(phone);
		$('input[name=cellphone]').val(cellphone);
		
		$('#form2').attr('method','post')
				   .attr('action','${pageContext.servletContext.contextPath }/member/modify')
					.submit();
	});
});
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
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<table width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table width="685">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/member_edit.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<form id="form2">
			<input type="hidden" name="no" value="${vo.no}"/>
			<table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
				<tr>
					<td align="center" bgcolor="efefef">
						<table cellspacing="5" bgcolor="white">
							<tr>
								<td align="center">
									<table width="635">
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>아이디</b></font>
											</td>
											<td>
												<input type="text" name="id" maxlength = "12" value="${vo.id}" size="20" disabled="disabled"> 
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호</b></font>
											</td>
											<td>
												<input TYPE="password" name="password1" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호 확인</b></font>
											</td>
											<td>
												<input TYPE="password" name="password2" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table width="635">
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> 
												<font color="898989"><b>이 름</b></font>
											</td>
											<td>
												<input type="text" name="name" maxlength="10" value="${vo.name}" size="20" disabled="disabled">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>생년월일</b></font>
											</td>
											<td>
												<input type="text" name='birthday1' size = "4" maxlength = "4" value = "****" disabled="disabled"> <font color="898989">년</font> 
												<input type="text" name='birthday2' size = "2" maxlength = "2" value = "**" disabled="disabled"> <font color="898989">월</font> 
												<input type="text" name='birthday3' size = "2" maxlength = "2" value = "**" disabled="disabled"> <font color="898989">일</font> 
											</td>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table width="635">
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>전화 번호</b></font>
											</td>
											<td>
												<input type="hidden" name='phone' />
												<input type="text" id='tel1' name='tel1' size = "4" maxlength = "4" value = "${phone[0]}" class="cmfont1"><font color="898989">-</font>
												<input type="text" id='tel2' name='tel2' size = "4" maxlength = "4" value = "${phone[1]}" class="cmfont1"><font color="898989">-</font>
												<input type="text" id='tel3' name='tel3' size = "4" maxlength = "4" value = "${phone[2]}" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> 
												<font color="898989"><b>핸드폰 번호</b></font>
											</td>
											<td>
												<input type="hidden" name='cellphone' />
												<input type="text" id='phone1' name='phone1' size = "4" maxlength = "4" value = "${cellphone[0]}" ><font color="898989">-</font>
												<input type="text" id='phone2' name='phone2' size = "4" maxlength = "4" value = "${cellphone[1]}" ><font color="898989">-</font>
												<input type="text" id='phone3' name='phone3' size = "4" maxlength = "4" value = "${cellphone[2]}" >
											</td>
										</tr>
										<tr>
											<td width="127" height="50">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>주 소</b></font>
											</td>
											<td>
												<input type="text" id="zipcode" name='zipcode' size = "6" maxlength = "10" value="${vo.zipcode}"><font color="898989">-</font>
												<img name='zipcode' align="middle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"><br>
												<input type="text" id="address" name='address' size = "50" maxlength = "200" value="${vo.address}" ><br>
												<span id="guide" style="color:#999"></span>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> 
												<font color="898989"><b>E-Mail</b></font>
											</td>
											<td>
												<input type="text" name='email' size="50" maxlength="50" value="${vo.email}">
											</td>
										</tr>
									</table>
			
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="685">
				<tr>
					<td height="45" align="right">
						<input name="modify" type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_add.gif" border="0">&nbsp;&nbsp;
						<a href="javascript:form2.reset();"><img src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" border="0"></a>
					</td>
				</tr>
			</table>
			</form>

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