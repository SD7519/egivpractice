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
		width: 1000px;
	}
</style>
<script>
function fn_psave() {	
	//trim() -> 앞뒤 공백 제거, java, jsp
	/*
	if( $.trim( $("#userpass").val() ) == "") {
		alert("비밀번호를 입력해주세요.");
		$("#uesrpass").focus();
		return false;
	}
	$("#userpass").val( $.trim($("#userpass").val()) );
	*/
	var userpass = $("#userpass").val();
	var userpass2 = $("#userpass2").val();
	var userid = $("#userid").val();
	userpass = $.trim(userpass);
	userpass2 = $.trim(userpass2);
	userid = $.trim(userid);
	
	if(userpass == ""){
		alert("비밀번호를 입력해주세요.");
		$("#userpass").focus();
		return false;
	}
	if(userpass2 == ""){
		alert("확인 비밀번호를 입력해주세요.");
		$("#userpass2").focus();
		return false;
	}
	
	if(userpass !== userpass2){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	$("#userpass").val(userpass);
	$("#userpass2").val(userpass2);
	
	
		  
	$.ajax({
		type:"POST",
		data:"userid=" + userid + "&userpass=" + userpass,
		url:"modifyPassSave.do",
		dataType:"text", // 리턴 타입
		success: function (msg) {
			if(msg == "ok") {
				alert("비밀번호가 변경되었습니다.");
				location = "memberDetail.do?userid=" + userid;
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		},
		error:function() {
				alert("오류발생");			
		}
	});
		
}
</script>
<%@ include file="../include/topmenu.jsp" %>
<body>
<div class="warp">
<div class="div-main">
<%@ include file="../include/sidebar.jsp" %>
<div class="div-table">
	<form id="frm">
		<table>
			<caption>비밀번호 확인</caption>
			<tr>
				<th width="30%">새로운 비밀번호</th>
				<td>
					<input type="password" name="userpass" id="userpass">
					<input type="hidden" name="userid" id="userid" value="${userid}">
				</td>
			</tr>
			<tr>
				<th width="30%">비밀번호 재입력</th>
				<td><input type="password" name="userpass2" id="userpass2"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="fn_psave(); return false;">확인</button>
				</th>
			</tr>
		</table>
	</form>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>