<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<script>
	$(function(){
		$('#login-image').click(function(){
			$('#login')
				.attr({
					'method' : 'post',
					'action' :'${pageContext.servletContext.contextPath }/member/login'
					})
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

			<!---- 화면 우측(로그인) S -------------------------------------------------->	
			<table width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="47"></td></tr>
			</table>
			<table width="720">
				<tr>
					<td width="747" align="center" valign="top">
						<table cellspacing="8" width="523" bgcolor="E9E9E9">
							<tr>
								<td height="210" align="center" bgcolor="white">
									<table height="120" width="440">
										<tr>
											<td width="120" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image1.gif" width="110" height="90" border="0"></td>
											<td width="320">
												<table width="320">
													<tr>
														<td height="35">
															<p style="padding-left:10px;"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image2.gif" width="220" height="21" border="0"></p>
														</td>
													</tr>
												</table>
												<table width="320">
													<!-- form2 시작 ------>
													<form id ="login">
													<tr>
														<td width="220" height="25">
															<p style="padding-left:10px;">
															<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/login_id.gif" width="40" height="13" border="0"> 
															<input type="text" name="id" size="20" maxlength="12" class="cmfont1">
															</p>
														</td>
														<td width="100" rowspan="2">
															<input type="image" id='login-image' align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_login.gif" width="50" border="0">
														</td>
													</tr>
													<tr>
														<td width="220" height="25">
															<p style="padding-left:10px;">
															<img align="middle" src="${pageContext.servletContext.contextPath }/assets/images/login_pw.gif" width="40" height="13" border="0"> 
															<input type="password" name="password" size="20" maxlength="12" class="cmfont1">
															</p>
														</td>
													</tr>
													</form>
													<!--form2 끝 ------>
												</table>
											</td>
										</tr>
									</table>
									<table width="512">
										<tr><td height="15"></td></tr>
										<tr><td height="2" bgcolor="E9E9E9"></td></tr>
										<tr><td height="15"></td></tr>
									</table>
									<table width="511">
										<tr>
											<td align="center">
												<table>
													<tr>
														<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image6.gif" border="0"></td>
														<td height="30">
															<a href="#" onfocus="this.blur()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_id.gif" width="64" height="19" border="0" align="middle"></a> &nbsp; 
															<a href="#" onfocus="this.blur()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_pw.gif" width="64" height="19" border="0" align="middle"></a>
														</td>
													</tr>
												</table>												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>