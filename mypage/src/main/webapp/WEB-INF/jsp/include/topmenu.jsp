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
<title></title>
</head>
<style>
	* {
		margin:0 auto;
	}
	div {
		width: 60%
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
<% String UserID = (String) session.getAttribute("userid"); %>
<div class="top_menu">
	<div style="text-align: left;"><a href="/main.do">홈</a></div>
	<div style="text-align: right;">
	<% if(UserID == null) { %>
				<a href="/login.do">로그인</a>
				<a href="/register.do">회원가입</a>
	<%} else {%>
				<a href="/memberDetail.do"><%out.print(UserID);%>님</a>
				<a href="/logout.do">로그아웃</a>				
	<%} %>
	</div>
</div>
</body>
</html>