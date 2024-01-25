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
<title>회원가입</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<script>
$( function() {
    $("#birth").datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: 'c-80:c+10',
      dateFormat:"yy-mm-dd"
    });
    
    $("#btn_submit").click(function() {
    	var userid = $("#userid").val();
    	var userpass = $("#userpass").val();
    	var name = $("#name").val();
    	userid = $.trim(userid);
    	uesrpass = $.trim(userpass);
    	name = $.trim(name);
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
    	if(name == ""){
    		alert("이름를 입력해주세요.");
    		$("#name").focus();
    		return false;
    	}
    	
    	$("#userid").val(userid);
    	$("#userpass").val(userpass);
    	$("#name").val(name);
    	
    	var formData = $("#frm").serialize();
    	
    	$.ajax({
    		type:"POST",
    		data:formData,
    		url:"registerWrite.do",
    		dataType:"text", // 리턴 타입
    		success: function (data) {
    			if(data == "ok") {
    				alert("저장완료");
    				location = "login.do";
    			} else {
    				alert("저장실패");
    			}
    		},
    		error:function() {
    				alert("오류발생");			
    		}
    	});
    });
  });
function fn_check() {
	 
	 var userid = $("#userid").val();
	 userid = $.trim(userid);
	 
	 $.ajax({
 		type:"POST",
 		data:"userid=" + userid,
 		url:"checkid.do",
 		dataType:"text", // 리턴 타입
 		success: function (data) {
 			if(data == "ok") {
 				alert("사용 가능한 아이디입니다.");
 			} else {
 				alert("사용할 수 없는 아이디입니다.");
 				location = "register.do?";
 			}
 		},
 		error:function() {
 				alert("오류발생");			
 		}
 	});	 
}
</script>
<style>
	* {
		margin: 0 auto;
	}
	.register-table{
		width:500px;
		border-collapse:collapse;
		height: 70%;
	}
	.register-th, .register-td {
		border:1px solid #cccccc;
		padding: 3px;
	}
	.input1 {
		width:98%;
	}
	caption {
		font-weight: bold;		
	}
	.div_button {
		width:600px;
		text-align:center;
		margin-top:5px;
	}
	.warp {
		position: relative;
		min-height: 100%;
	}
</style>
<body>
<%@ include file="../include/topmenu.jsp" %>
<%@ include file="../include/boardmenu.jsp" %>
<div class="warp">
<form id="frm">
	<table class="register-table">
		<caption>회원가입</caption>
		<tr>
			<th class="register-th"><label for="userid">*아이디</label></th>
			<td class="register-td"><input type="text" name="userid" id="userid" class="input1"/><button type="button" onclick="fn_check(); return false;">아이디 중복체크</button></td>
		</tr>
		<tr>
			<th class="register-th"><label>*비밀번호</label></th>
			<td class="register-td"><input type="password" name="userpass" id="userpass" class="input1"/></td>
		</tr>
		<tr>
			<th class="register-th"><label>이메일</label></th>
			<td class="register-td">
				<input type="hidden" name="email" id="email"/>
				<input type="text" name="emailh" id="emailh"/>
				<label>@</label>
				<select id="emailt" name="emailt">
					<option value="naver">naver.com</option>
					<option value="google">google.com</option>
					<option value="daum">daum.net</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="register-th"><label>이름</label></th>
			<td class="register-td"><input type="text" name="name" id="name" class="input1"/></td>
		</tr>
		<tr>
			<th class="register-th"><label>생년월일</label></th>
			<td class="register-td"><input type="text" name="birth" id="birth" readonly class="input1"></td>
		</tr>
		<tr>
			<th class="register-th"><label>전화번호</label></th>
			<td class="register-td"><input type="text" name="phonenum" id="phonenum" class="input1"/> ex) 010-1234-1234</td>
		</tr>
	</table>
	<div class="div_button">
		<button type="button" id="btn_submit">가입</button>
		<button type="reset">취소</button>
	</div>
</form>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>