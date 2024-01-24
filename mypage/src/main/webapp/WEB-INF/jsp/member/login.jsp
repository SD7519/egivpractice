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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>로그인</title>
<script>
$( function() {
    $("#btn_submit").click(function() {
    	var userid = $("#userid").val();
    	var userpass = $("#userpass").val();
    	userid = $.trim(userid);
    	userpass = $.trim(userpass);
    	if(userid == ""){
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	}
    	if(userpass == ""){
    		alert("비밀번호를 입력해주세요.");
    		$("#userpass").focus();
    		return false;
    	}
    	$("#userid").val(userid);
    	$("#userpass").val(userpass);
    	//var formData = $("#frm").serialize();
    	
    	$.ajax({
    		type:"POST",
    		data:"userid="+userid+"&userpass="+userpass,
    		url:"loginMember.do",
    		dataType:"text", // 리턴 타입
    		success: function (data) {
    			if(data == "ok") {
    				alert(userid +"님 로그인 되었습니다.");
    				location = "main.do";
    			} else {
    				alert("아이디 또는 비밀번호를 확인해주세요.");
    			}
    		},
    		error:function() {
    				alert("오류발생");			
    		}
    	});
    });
  });
</script>
<style>
	* {
		margin: 0 auto;
	}
	.register-table{
		width:20%;
		border-collapse:collapse;
		height: 50%;
		text-align: center;
	}
	.register-th, .register-td {
		border:1px solid #cccccc;
		padding: 3px;
	}
	.input1 {
		width:95%;
	}
	caption {
		font-weight: bold;	
		caption-side: top;
		text-align: center;
	}
	.div_button {
		width:600px;
		text-align:center;
		margin-top:5px;
	}
	div {
		width: 80%
	}
</style>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<div>
<form id="frm" name="frm" >
	<table class="register-table">
		<caption>LOGIN</caption>
		<tr>		
			<th class="register-th"><label for="userid">ID</label></th>
			<td class="register-td"><input type="text" id="userid" name="userid" class="input1"></td>
		</tr>
		<tr>
			<th class="register-th"><label for="userpass">PW</label></th>
			<td class="register-td"><input type="password" id="userpass" name="userpass" class="input1"></td>
		</tr>
	</table>
		<div class="div_button">
			<button type="button" id="btn_submit">로그인</button>
		</div>
</form>
</div>
</body>
</html>