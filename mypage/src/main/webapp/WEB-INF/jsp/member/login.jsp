<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
    	uesrpass = $.trim(userpass);
    	if(userid == ""){
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	}
    	if(userpass == ""){
    		alert("암호를 입력해주세요.");
    		$("#userpass").focus();
    		return false;
    	}
    	$("#userid").val(userid);
    	$("#userpass").val(userpass);
    	
    	var formData = $("#frm").serialize();
    	
    	$.ajax({
    		type:"POST",
    		data:formData,
    		url:"loginMember.do",
    		dataType:"text", // 리턴 타입
    		success: function (data) {
    			if(data == "ok") {
    				//alert(user);
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
		margin:0 auto;
	}
	div {
		width: 80%
	}
	.div_login {
		width: 70%;
		text-align: center;
	}
	.top_menu{
		display: flex;
	}
	a {
		text-decoration-line: none;
		color: black;
	}
	.div-default {
		width: 50%;
		border: 1px solid #000000;
		border-radius: 50px;
		height: 500px;
		
	}
</style>
</head>
<body>
<div class="top_menu">
	<div style="text-align: left;"><a href="/main.do">홈</a></div>
	<div style="text-align: right;">
		<a href="/login.do">로그인</a>
		<a href="/register.do">회원가입</a>
	</div>
</div>
<div class="div-default">
	<div class="div_login">
		<div style="height: 200px; border:1px solid #000000f;">
			Login
		</div>
		<form id="frm">
			<div class="input-group mb-3">
			  <label for="userid"><span class="input-group-text">ID</span></label>
			  <input type="text" class="form-control" id="userid" name="userid" aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3">
			  <label for="userpass"><span class="input-group-text">PW</span></label>
			  <input type="password" class="form-control" id="userpass" name="userpass" aria-describedby="basic-addon1">
			</div>
		</form>
		<div>
			<button type="button" id="btn_submit">로그인</button>
		</div>
	</div>
</div>
</body>
</html>