<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>쇼핑몰 관리자 홈페이지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color : white;
	margin : 0;
}

#image_upload_preview {
	width:100px;
	height:100px;
	display:none;
}
</style>
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
			
			
			$('input[type=submit]').click(function(e){
				e.preventDefault();
				var icon = 	($('input[name=icon_new]').is(':checked') == true ? '1' : '0')+ 
							($('input[name=icon_hit]').is(':checked') == true ? '1' : '0') +
							($('input[name=icon_sale]').is(':checked') == true ? '1' : '0');
				
				var itemOptionValue = $('input[name=option-values]').val();
				var length = $("#option-menu-detail").find('tr').length - 2;
				
				
				for(var i = 0; i < length; i++) {
					var name = "input[name='itemOptionList["+ i +"]'.itemOptionValues]";
					$(name).val(itemOptionValue[i]);
				}
				
				
				$('input[name=icon]').val(icon);			
				$('#form1').attr({
									'method' : 'post',
									'enctype': 'multipart/form-data',
									'action' :'${pageContext.servletContext.contextPath}/admin/product/insert'
								}).submit();	
			}); //등록하기 버튼
			
			
			$("input[name=used-option]").on('click', function() { 
				if ( $(this).val() == 'used-option') { 
					$('#unused-option').attr('checked',false);
					$('#used-option').attr('checked',true);
					$('#option-menu-detail').before(
							'<select id="option">' +
							'<option value="0" selected>옵션선택</option>' +
							'<c:forEach items="${optionList}" var="vo">' +
							'<option value="${vo.no}">${vo.name}</option>' +
							'</c:forEach> </select>'
						);
					
				} else { 
					$('#used-option').attr('checked',false);
					$('#unused-option').attr('checked',true);
					$('#option').remove();
					$('#option-menu-detail').empty();
					$('#option-menu-detail').css('display','none');
				} 
			}); //옵션 사용함을 하게 되면 메뉴가 뜸(사용안함 선택하면 메뉴 사라짐)
			
			
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
			
			
			$(document).on('click','input[name=modify-option]',function(){
				var open = $(this).closest('td').siblings('.option-values').children('input[name=option-values]').attr('disabled');
				/* alert($(this).closest('td').siblings('.option-values').children('input[name=option-values]').val()); */
				if(open == 'disabled') {
					$(this).closest('td').siblings('.option-values').children('input[name=option-values]').attr('disabled', false);
				} else {
					$(this).closest('td').siblings('.option-values').children('input[name=option-values]').attr('disabled', true);
				}
				
			});
			
		});
</script>
</head>
<body>
<form id="form1">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
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
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="code" value="" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="name" value="" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="company" value="" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="sellingPrice" value="" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    	<td id='add-option' width="700" bgcolor="#F2F2F2">
    		<input type="radio" id="used-option" name="used-option" value="used-option"/> 
    			<span>사용함</span>
    		<input type="radio" id="unused-option" name="used-option" value="unused-option" checked/>
				<span>사용안함 </span><br/>
			<table id="option-menu-detail" style="display:none">
				<tr>
					<td align="center">옵션명</td>
					<td align="center">옵션값</td>
				<tr>
			</table>
			
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700" bgcolor="#F2F2F2">
			<textarea name="content" rows="10" cols="80"></textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    	<td width="700" bgcolor="#F2F2F2">
			<input type="radio" name="status" value="1" checked> 판매중
			<input type="radio" name="status" value="2"> 판매중지
			<input type="radio" name="status" value="3"> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="hidden" name="icon" value=""/>
			<input type="checkbox" name="icon_new" value="1"> New &nbsp;	
			<input type="checkbox" name="icon_hit" value="1"> Hit &nbsp;	
			<input type="checkbox" name="icon_sale" value="1" onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;
			할인율 : <input type="text" name="discount" value="0" size="3" maxlength="3" disabled> %
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700" bgcolor="#F2F2F2">
			<b>이미지1</b>: <input type="file" id="file" name="file" size="30" value="찾아보기"><br>
			<img id="image_upload_preview"/>	 
			<!-- <b>이미지2</b>: <input type="file" name="file2" size="30" value="찾아보기"><br>
			<b>이미지3</b>: <input type="file" name="file3" size="30" value="찾아보기"><br> -->
		</td> 
	</tr>
</table>
<br>
<table width="800" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="등록하기"> &nbsp;&nbsp
			<a href="product.jsp"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
