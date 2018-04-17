<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/common.css" rel="stylesheet" type="text/css">
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
		<td valign="top" align="center">

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

			<!--  현재 페이지 자바스크립  -------------------------------------------->
			<script Language="Javascript">
				function Search_qa()	
				{
					form2.page.value=1;
					form2.submit();
				}
			</script>

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/qa_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/qa_title1.gif" border="0"></td>
				</tr>
				<tr>
					<td align="right" class="cmfont">
						<font color="#686868">게시물:</font>1000 &nbsp;&nbsp; <font color="#686868">페이지:</font>1/100
					</td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr><td colspan="5" height="3" bgcolor="8B9CBF"></td></tr>
				<tr bgcolor="F2F2F2" >
					<td width="90" height="25" align="center">번호</td>
					<td align="center">제목</td>
					<td width="90" align="center">작성자</td>
					<td width="90" align="center">작성일</td>
					<td width="90" align="center">조회</td>
				</tr>

				<c:forEach items="${list}" var="vo" varStatus="status">		
					<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
					<tr height="25" bgcolor="#FFFFFF">	
						<td width="90" align="center"><font color="#686868">${vo.no}</font></td>	
						<td><a href="${pageContext.servletContext.contextPath}/board/${vo.no}"><font color="#4186C7">${vo.title}</font></a></td>	
						<td width="90" align="center"><font color="#686868">${vo.name}</font></td>	
						<td width="90" align="center"><font color="#686868"><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></font></td>	
						<td width="90" align="center"><font color="#686868">${vo.readCount}</font></td>
					</tr>
				</c:forEach>
				<%-- <tr>
					<div class="pager">
						<ul>
							<c:if test="${pager.leftArrow eq true}">
								<li><a href="${pageContext.servletContext.contextPath}/board?page=${pager.startPage - 1}&word=${pager.word}">◀</a></li>
							</c:if>
							
							<c:forEach begin="${pager.startPage}" end="${pager.endPage}" varStatus="status">
								<li>
									<c:if test="${param.page == status.index}">	
										<a style="color:red;" href="${pageContext.servletContext.contextPath}/board?page=${status.index}&word=${word}">${status.index}</a>
									</c:if>
										
									<c:if test="${param.page != status.index}">
										<a href="${pageContext.servletContext.contextPath}/board?page=${status.index}&word=${word}">${status.index}</a>
									</c:if>
								</li>
							</c:forEach>
							
							<c:forEach begin ="${pager.endPage + 1}" end = '5'  varStatus="status">
								<li style="color:gray;">${status.index}</li>
							</c:forEach>
							
							<c:if test="${pager.rightArrow eq true}">
								<li><a href="${pageContext.servletContext.contextPath}/board?page=${pager.endPage + 1}&word=${pager.word}">▶</a></li>
							</c:if>
						</ul>
					</div>
				</tr> --%>
				<tr><td colspan="5" height="2" bgcolor="8B9CBF"></td></tr>
				
			</table>

			<table width="690">
				<!-- 검색 부분 -->
				<tr>
					<td height="40">&nbsp;
						<select name="sel1" class="cmfont1">
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">작성자</option>
						</select>
						<input type='text' name='text1' size="10" maxlength="20" value="" class="cmfont1">			
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/i_search.gif" align="absmiddle" border="0" onclick="javascript:Search_qa();">
					</td>
					<td align="right">
						<a href="${pageContext.servletContext.contextPath}/board/write">
							<img src="${pageContext.servletContext.contextPath }/assets/images/b_new.gif" border="0">
						</a>&nbsp;
					</td>
				</tr>

				<!-- form2 끝 -->
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