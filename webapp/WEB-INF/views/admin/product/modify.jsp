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
function readURL(input) {
	if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
                $('#image_upload_preview').attr('src', e.target.result)
                						  .css('display','block');
          }
          reader.readAsDataURL(input.files[0]);
     }
 }

$(function(){
	 $("#file").change(function () {
         readURL(this);
 	 });
	 
		
		$(document).on('click','input[name=modify-option]',function(){
			var open = $(this).closest('td').siblings('.option-values').children('input[name=option-values]').attr('disabled');
			/* alert($(this).closest('td').siblings('.option-values').children('input[name=option-values]').val()); */
			if(open == 'disabled') {
				$(this).closest('td').siblings('.option-values').children('input[name=option-values]').attr('disabled', false);
			} else {
				$(this).closest('td').siblings('.option-values').children('input[name=option-values]').attr('disabled', true);
			}
			
		});
	 
		$('input[type=submit]').click(function(e){
			alert("click!");
			e.preventDefault();
			var icon = 	($('input[name=icon_new]').is(':checked') == true ? '1' : '0')+ 
						($('input[name=icon_hit]').is(':checked') == true ? '1' : '0') +
						($('input[name=icon_sale]').is(':checked') == true ? '1' : '0');
			
			var itemOptionValue = $('input[name=option-values]').val();
			var length = $("#option-menu-detail").find('tr').length - 2;
			
			
			for(var i = 0; i < length; i++) {
				var name = "input[name='itemOptionList["+ i +"].itemOptionValues]'";
				$(name).val(itemOptionValue[i]);
			}
			
			
			$('input[name=icon]').val(icon);			
			$('#form1').attr({
								'method' : 'post',
								'enctype': 'multipart/form-data',
								'action' :'${pageContext.servletContext.contextPath}/admin/product/modify'
							}).submit();	
		}); //등록하기 버튼
		
		$(document).on('change','#option', function() {
			var no = $(this).val();
			var length = $("#option-menu-detail").find('tr').length - 2;
			
			
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/admin/product/option_menu",
				type:"post",
				data: "no=" + no,
				dataType:"json",
				success: function(response) {
					$('#option-menu-detail').css('display','block');
					$('#option-menu-detail').append(
							'<tr>'+ 
								'<input type="hidden" name="itemOptionList['+ length +'].optionNo" value="'+ no +'"/>'+
								'<input type="hidden" name="itemOptionList['+ length +'].optionName" value="'+ response.name +'"/>'+
								'<input type="hidden" name="itemOptionList['+ length +'].itemOptionValues" value="'+ response.basicValue +'"/>'+
								'<td>'+ response.name +'</td>' +
								'<td class="option-values"><input type="text" name="option-values" value="'+ response.basicValue + '" disabled/></td>' +
								'<td>'+ '<input type="button" name="modify-option" value="옵선값 수정"/>'+ '</td>' +
							'</tr>'
						);
				}
			});
			
		}); //옵션 메뉴를 선택하면 해당 옵션을 수정할 수 있음
		
});
</script>
</head>
<body>
<form name="form1" id="form1">
	  
<input type="hidden" name="no" value="${vo.no}"/>
<table width="800" border="1"  cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    	<td width="700" bgcolor="#F2F2F2">
			<select name="categoryNo">
				<option value="0" selected>상품분류를 선택하세요</option>
				<c:forEach items="${categoryList}" var="category" varStatus="status">
					<option value='${category.no}' <c:if test="${vo.categoryNo eq category.no}">selected</c:if>>${vo.groupName}</option>
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
			<input type="text" name="company" value="${vo.company}" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="sellingPrice" value="${vo.sellingPrice}" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
	    <td width="700"  bgcolor="#F2F2F2">
	    
	    <input type="hidden" name="memberOptionList[${status.index}].itemOptionNo" value="${vo.no}"/>
	    		<select id="option">
					<option value="0" selected>옵션선택</option>
						<c:forEach items="${optionList}" var="vo">
						<option value="${vo.no}">${vo.name}</option>
					</c:forEach> 
				</select>
				
	    <table id="option-menu-detail">
				<tr>
					<td align="center">옵션명</td>
					<td align="center">옵션값</td>
				<tr>
				<c:forEach items="${itemOptionList}" var="vo" varStatus="status">
				<tr>
					<td> 
						<input type="hidden" name="itemOptionList[${status.index}].optionNo" value="${vo.no}"/>
						<input type="hidden" name="itemOptionList[${status.index}].optionName" value="${vo.optionName}"/>
						<input type="hidden" name="itemOptionList[${status.index}].itemOptionValues" value="${vo.itemOptionValues}"/>
						${vo.optionName}
					</td>
					<td class="option-values"><input type="text" name="option-values" value="${vo.itemOptionValues}" disabled/></td>
					<td><input type="button" name="modify-option" value="옵선값 수정"/></td>
				</tr>
				</c:forEach>
		</table>
			
				
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
			<input type="radio" name="status" value="1" <c:if test="${vo.status eq '1'}">checked</c:if>> 판매중
			<input type="radio" name="status" value="2" <c:if test="${vo.status eq '2'}">checked</c:if>> 판매중지
			<input type="radio" name="status" value="3" <c:if test="${vo.status eq '3'}">checked</c:if>> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="hidden" name="icon" value="${vo.icon}" />
			<input type="hidden" name="icon2" value="${fn:substring(vo.icon, 2,3)}" />
			<input type="checkbox" name="icon_new" value="New" <c:if test="${fn:substring(vo.icon, 0,1) eq 1}">checked</c:if>> New &nbsp;&nbsp	
			<input type="checkbox" name="icon_hit" value="Hit" <c:if test="${fn:substring(vo.icon, 1,2) eq 1}">checked</c:if>> Hit &nbsp;&nbsp	
			<input type="checkbox" name="icon_sale" value="Sale" <c:if test="${fn:substring(vo.icon, 2,3) eq 1}">checked</c:if> onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
			할인율 : <input type="text" name="discount" value="${vo.discount}" size="3" maxlength="3" <c:if test="${fn:substring(vo.icon, 2,3) ne 1}">disabled</c:if> > %
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
									<input type='hidden' name='imagePath' value='${vo.imagePath}'>
									&nbsp;<input type="checkbox" name="checkno1" value="${vo.imagePath}"> <b>이미지1</b>:
									<input type="file" name="file" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td><br>&nbsp;&nbsp;&nbsp;※ 삭제할 그림은 체크를 하세요.</td>
							</tr> 
				  	</table>
						<br><br><br><br><br>
						<table width="390">
							<tr>
								<td  valign="middle">
									<img src="${vo.imagePath}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg')">&nbsp;
									<img id="image_upload_preview"/>
								</td>
							</tr>				 
						</table>
					</td>
					<td align="right" width="310">
						<img name="big" src="${vo.imagePath}" width="300" height="300" border="1">
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
