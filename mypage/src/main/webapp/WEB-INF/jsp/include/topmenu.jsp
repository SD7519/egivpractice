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
	header{
		width: 1250px;
	}
	a {
		text-decoration-line: none;
		color: black;
	}
</style>
<script>
</script>
<body>
<%
String UserName = (String) session.getAttribute("username");
String UserID = (String) session.getAttribute("userid");
%>
<header>
	<div style="text-align: center; width: 100%;"><a href="/main.do">대충 로고</a></div>
	<div style="text-align: right; width: 100%;">
	<% if(UserName == null) { %>
				<a href="/login.do">로그인</a>
				<a href="/register.do">회원가입</a>
	<%} else {%>
				<a href="/memberDetail.do?userid=<%out.print(UserID);%>" style="color: blue;"><%out.print(UserName);%>님</a>
				<a href="/logout.do" onclick="alert('로그아웃 되었습니다.')">로그아웃</a>				
	<%} %>
	</div>
</header>
</body>
</html>