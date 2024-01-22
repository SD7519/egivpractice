<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="/script/jquery-3.7.1.js"></script>
<script src="/script/jquery-3.7.1.min.js"></script>
</head>
<style>
	table{
		width: 100%;
		border-collapse:collapse;
	}
	th,td {
		border:1px solid #cccccc;
		padding: 3px;
	}
	.div-left {
		border:1px solid #cccccc;
		width:10%;
		margin-right:10px;
	}
	.div-table {
		width:90%;
	}
	.div-main {
		display: flex;
		height: 100%;
	}

</style>
<%@ include file="../include/topmenu.jsp" %>
<%@ include file="../include/boardmenu.jsp" %>
<body>
<div class="div-main">
<div class="div-left"></div>
<div class="div-table">
	<form id="frm">
		<table>
			<caption>회원 정보</caption>
			<tr>
				<th width="30%">ID</th>
				<td>${MemberVO.userid}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><button type="button" onclick="location='checkPass.do?userid=${MemberVO.userid}'">비밀번호 변경</button></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${MemberVO.email}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${MemberVO.name}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${MemberVO.phonenum}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${MemberVO.birth}</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="location='memberModifyWrite.do?uno=${MemberVO.userid}'">수정</button>
				</th>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>