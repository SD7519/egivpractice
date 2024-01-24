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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
<script>
$( function() {
    $("#birth").datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: 'c-80:c+10',
      dateFormat:"yy-mm-dd"
    });
});

function fn_mem() {	
	//trim() -> 앞뒤 공백 제거, java, jsp 	
	if( $.trim( $("#name").val() ) == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	$("#name").val( $.trim($("#name").val()) );
	
	var formData = $("#frm").serialize();
	
	var userid = ${MemberVO.userid};
	
	
	if(confirm("수정하시겠습니까?") == true){
		$.ajax({
			type:"POST",
			data:formData,
			url:"memberModifySave.do",
			dataType:"text", // 리턴 타입
			success: function (data) {
				if(data == "1") {
					alert("수정완료");
					location = "memberDetail.do?userid="+userid;
				} else {
					alert("수정실패");
				}
			},
			error:function() {
					alert("오류발생");			
			}
		});
	} else {
		alert("취소되었습니다.");
		return false;
	}
		
}
</script>
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
				<td><input type="text" name="userid" id="userid" value="${MemberVO.userid}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><button type="button" onclick="location='checkPass.do?userid=${MemberVO.userid}'">비밀번호 변경</button></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" value="${MemberVO.email}"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" value="${MemberVO.name}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phonenum" id="phonenum" value="${MemberVO.phonenum}"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth" id="birth" readonly value="${MemberVO.birth}"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="fn_mem(); return false;">수정</button>
				</th>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>