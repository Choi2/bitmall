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
</head>
<body>
<form name="form1" method="post" action="" enctype="multipart/form-data">
<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    	<td width="700" bgcolor="#F2F2F2">
			<select name="categoryNo">
				<option value="0" selected>상품분류를 선택하세요</option>
				<c:forEach items="${categoryList}" var="vo" varStatus="status">
					<option value='${vo.no}'>${vo.groupName}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="code" value="${vo.code}" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="name" value="${vo.name}" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="coname" value="${vo.company}" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="price" value="${vo.sellingPrice}" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
	    <td width="700"  bgcolor="#F2F2F2">
	    
	    <input type="hidden" name="memberOptionList[${status.index}].itemOptionNo" value="${vo.no}"/>
	    
				<c:forEach items="${itemOptionList}" var="vo" varStatus="status">
				<c:set var="values" value="${fn:split(vo.itemOptionValues,';')}" />
				<select name="memberOptionList[${status.index}].memberOptionValue">
					<option value="0">${vo.optionName}</option>
					<c:forEach items="${values}" var="val">
						<option value="${val}">${val}</option>
					</c:forEach>
				</select> &nbsp; &nbsp; 
				</c:forEach>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<textarea name="content" rows="4" cols="70">${vo.content}</textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    	<td width="700"  bgcolor="#F2F2F2">
			<input type="radio" name="status" value="판매중" <c:if test="${status eq '1'}">checked</c:if>> 판매중
			<input type="radio" name="status" value="판매중지" <c:if test="${status eq '2'}">checked</c:if>> 판매중지
			<input type="radio" name="status" value="품절" <c:if test="${status eq '3'}">checked</c:if>> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="checkbox" name="icon_new" value="New" <c:if test="${fn:substring(icon, 0,1) eq 1}">checked</c:if>> New &nbsp;&nbsp	
			<input type="checkbox" name="icon_hit" value="Hit" <c:if test="${fn:substring(icon, 1,2) eq 1}">checked</c:if>> Hit &nbsp;&nbsp	
			<input type="checkbox" name="icon_sale" value="Sale" <c:if test="${fn:substring(icon, 2,3) eq 1}">checked</c:if>onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
			할인율 : <input type="text" name="discount" value="10" size="3" maxlength="3" disabled> %
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">등록일</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="regday1" value="2007" size="4" maxlength="4"> 년 &nbsp
			<input type="text" name="regday2" value="2007" size="2" maxlength="2"> 월 &nbsp
			<input type="text" name="regday3" value="2007" size="2" maxlength="2"> 일 &nbsp
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700"  bgcolor="#F2F2F2">

			<table align="left">
				<tr>
					<td>
						<table width="390">
							<tr>
								<td>
									<input type='hidden' name='imagename1' value='s001_1.jpg'>
									&nbsp;<input type="checkbox" name="checkno1" value="${vo.imagePath}"> <b>이미지1</b>: s001_1.jpg
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" name="image1" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td><br>&nbsp;&nbsp;&nbsp;※ 삭제할 그림은 체크를 하세요.</td>
							</tr> 
				  	</table>
						<br><br><br><br><br>
						<table width="390">
							<tr>
								<td  valign="middle">&nbsp;
									<img src="${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg')">&nbsp;
									<img src="${pageContext.servletContext.contextPath }/assets/images/product/s001_2.jpg" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_2.jpg')">&nbsp;
									<img src="${pageContext.servletContext.contextPath }/assets/images/product/nopic.jpg"  width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/nopic.jpg')">&nbsp;
								</td>
							</tr>				 
						</table>
					</td>
					<td>
						<td align="right" width="310"><img name="big" src="${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg" width="300" height="300" border="1"></td>
					</td>
				</tr>
			</table>

		</td>
	</tr>
</table>

<br>
<table width="800" cellpadding="5">
	<tr> 
		<td align="center">
			<input type="submit" value="수정하기"> &nbsp;
			<a href="product.jsp"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
