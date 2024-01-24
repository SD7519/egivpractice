<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 화면</title>
<script src="../script/jquery-3.7.1.min.js"></script>
<script src="../script/jquery-3.7.1.min.js"></script>
</head>
<style>
	* {
		margin: 0 auto;
	}
	table{
		width:1000px;
		border-collapse:collapse;
	}
	th,td {
		border:1px solid #cccccc;
		padding: 3px;
	}
	.input1 {
		width:98%;
	}
	.textarea {
		width:98%;
		height:300px;
	}
</style>

<script>
function fn_msave() {	
	//trim() -> 앞뒤 공백 제거, java, jsp 	
	if( $.trim( $("#title").val() ) == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return false;
	}
	$("#title").val( $.trim($("#title").val()) );
	
	if( $.trim( $("#pass").val() ) == "") {
		alert("암호를 입력해주세요.");
		$("#pass").focus();
		return false;
	}
	$("#pass").val( $.trim($("#pass").val()) );
	
	var caterory = $("#category").val();
	
	var formData = $("#frm").serialize();
	
	var unq = $("#unq").val();
	  
	$.ajax({
		type:"POST",
		data:formData,
		url:"boardModifySave.do",
		dataType:"text", // 리턴 타입
		success: function (data) {
			if(data == "1") {
				alert("수정완료");
				location = "boardDetail.do?unq="+unq;
			} else {
				alert("수정실패");
			}
		},
		error:function() {
				alert("오류발생");			
		}
	});
		
}
</script>

<body>
<%@ include file="../include/topmenu.jsp" %>
<%@ include file="../include/boardmenu.jsp" %>
<div>
	<form id="frm">
		<table>
			<caption>게시글 수정</caption>
			<tr>
				<th width="20%"><label for="title">제목</label></th>
				<td width="80%"><input type="text" name="title" id="title" class="input1" value="${BoardVO.title}"></td>
			</tr>
			<tr>
				<th><label for="category">카테고리</label></th>
				<td>
					${ct}
					<input type="hidden" name="category" id="category" value="${BoardVO.category}">
					<input type="hidden" name="unq" id="unq" value="${BoardVO.unq}">
				</td>
			</tr>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" id="name" value="${BoardVO.name}" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" class="textarea">${BoardVO.content}</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="fn_msave(); return false;">저장</button>
					<button type="reset">취소</button>
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>