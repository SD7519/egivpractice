<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<style>
	* {
		margin:0 auto;
	}
	div {
		width: 80%
	}
	.div-banner {
		text-align: center;
		border: 1px solid #000000;
		height: 200px;
	}
	.div-main{
		display: flex;
		border: 1px solid #000000;
		margin-top: 10px;
	}
	.top_menu{
		display: flex;
	}
	a {
		text-decoration-line: none;
		color: black;
	}
</style>
<body>
<% String UserID = (String) session.getAttribute("UserID"); %>
<div class="top_menu">
	<div style="text-align: left;"><a href="/main.do">홈</a></div>
	<div style="text-align: right;">
		<c:choose>
			<c:when test="not empty ${UserID}">${UserID}님</c:when>
			<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
		</c:choose>
		<a href="/register.do">회원가입</a>
	</div>
</div>
<div class="div-banner">
	<p>대충 배너 들어갈 자리</p>
</div>
<div class="div-main">
	<div>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<br>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
	</div>
	<div>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<br>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
		<p>대충 메인 채울 것들</p>
	</div>
</div>
</body>
</html>