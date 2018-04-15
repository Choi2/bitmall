<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<TITLE> 비트닷컴 쇼핑몰</TITLE>
<META HTTP-EQUIV="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<style>

body {
    width:524px;
    height:404px;
    margin:0;
    padding:0;
    font-family:"돋움", Dotum, "굴림",  Gulim;
    font-size:12px;
    line-height:140%;
    color:#515151;

    }

h1, h2, h3, h4, h5, h6, form, input, ul, li, dl, dt, dd {margin:0; padding:0;}
ul, li {list-style:none;}

a {text-decoration:none; color:#515151;}

img {border:none;}
li img {vertical-align:top;}
.frame {position:absolute; left:50%; top:50%;margin-left : -330px; margin-top:-202px}

.MarginNone {margin:0 !important;}

.BackgroundNone {background:none !important;}

.png24 {tmp:expression(setPng24(this));}


/* login 관련 스타일 */

.loginWrap {
    width:660px;
    height:208px;
    color:#6e6d6c;
    background:url(${pageContext.servletContext.contextPath}/assets/images/admin/login_bg.gif) no-repeat;
    border:4px solid #87bcf2;
    }
    .loginWrap h3 {float:left; margin:131px 85px 0 20px;}

    .loginForm {
        float:left;
        width:396px;
        height:160px;
        margin-top:23px;
        background:url(${pageContext.servletContext.contextPath}/assets/images/admin/login_content_bg.gif) left bottom no-repeat;
        }
    ul.login_tab {float:left; width:396px; background:url(${pageContext.servletContext.contextPath}/assets/images/admin/tab_bg.gif) left top repeat-x;}
    ul.login_tab li {float:left;}

    #loginType01 {position:absolute; clear:both; width:100%;}

    #loginType01 dl {
        clear:both;
        float:left;
        width:374px;
        margin:26px 0 0 22px;
        padding-bottom:11px;
        white-space:nowrap;
        background:url(${pageContext.servletContext.contextPath}/assets/images/admin/line_dot.gif) left bottom no-repeat;
        display:inline;
        }
        .loginForm dt {clear:both; float:left; margin-left:21px; display:inline;}
        .loginForm dd {float:left;}
            .loginInput {width:118px; border:1px solid #cecece;}
            .btn {margin:-4px 0 0 5px;}

        p.find {clear:both; float:left; width:100%; margin-top:10px; text-align:center;}
        p.find a {padding:0 9px 0 7px; display:inline-block;}
            .no_btn {background:none !important;}


    ul.explan {clear:both; width:630px; color:#666; padding:8px;}
    ul.explan li {margin-bottom:3px;}
    ul.explan li a {color:#4189d4;}
</style>
</head>

<body>
<form method="post" name="LoginForm" action="${pageContext.servletContext.contextPath}/admin/member/login">
<div class="frame">
<h2><img src="${pageContext.servletContext.contextPath}/assets/images/admin/title_admin_login.gif" alt="관리자 로그인"></h2>
<div class="loginWrap">
<h3><img src="${pageContext.servletContext.contextPath}/assets/images/admin/login_title.png" alt="LOG IN" class="png24"></h3>
	    <div class="loginForm">
	        <ul class="login_tab">
	            <li><a href="#"><img src="${pageContext.servletContext.contextPath}/assets/images/admin/tab01_on.gif" alt="대표운영자" id="login_tab01" onclick="chgTab(1)"></a></li>
	        </ul>
	
	        <div style="position:relative; float:left; width:100%;">
	        <div id="loginType01">
	        <dl>
	            <dt><img src="${pageContext.servletContext.contextPath}/assets/images/admin/text_id.gif" alt="대표아이디"></dt>
	            <dd><input type="text" class="loginInput" name="id" tabindex="1"> 
	            <input type="checkbox" name="password" tabindex="2" id="elm_hosting_id"> 
	            <label for="elm_hosting_id">저장</label></dd>
	            <dt><span id="elm_sub_admin1"></span></dt>
	            <dd><span id="elm_sub_admin2"></span></dd>
	            <dt><img src="${pageContext.servletContext.contextPath}/assets/images/admin/text_pw.gif" alt="비밀번호"></dt>
	            <dd><input class="loginInput" name="password" tabindex="3" type="password"> </dd>
	            <dd class="btn"><a href="#"><input type="image" tabindex="7" src="${pageContext.servletContext.contextPath}/assets/images/admin/btn_login.gif" alt="로그인"></a></dd>
	        </dl>
	        <p class="find"><a href="#" target="_blank">아이디/비밀번호 찾기</a></p>
	        </div>
	
	        </div>
	
	    </div>
</div>
</div>
</form>
</body>
</html>
