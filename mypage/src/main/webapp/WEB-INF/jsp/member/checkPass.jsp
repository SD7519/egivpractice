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
function fn_pass() {	
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
	var userid = $("#userid").val();
	userpass = $.trim(userpass);
	userid = $.trim(userid);
	
	if(userpass == ""){
		alert("비밀번호를 입력해주세요.");
		$("#userpass").focus();
		return false;
	}
	$("#userpass").val(userpass);
		  
	$.ajax({
		type:"POST",
		data:"userid=" + userid + "&userpass="+userpass,
		url:"modifyPass.do",
		dataType:"text", // 리턴 타입
		success: function (data) {
			if(data == "ok") {
				location = "modifyPassView.do";
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
<div class="div-main">
<%@ include file="../include/sidebar.jsp" %>
<div class="div-table">
	<form id="frm">
		<table>
			<caption>비밀번호 확인</caption>
			<tr>
				<th width="30%">비밀번호</th>
				<td>
					<input type="password" name="userpass" id="userpass">
					<input type="hidden" name="userid" id="userid" value="${userid}">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="fn_pass(); return false;">수정</button>
				</th>
			</tr>
		</table>
	</form>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>