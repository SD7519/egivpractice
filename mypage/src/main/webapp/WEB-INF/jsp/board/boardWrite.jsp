<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 화면</title>
<script src="../script/jquery-3.7.1.min.js"></script>
<script src="../script/jquery-3.7.1.min.js"></script>
</head>
<style>
	* {
		margin: 0 auto;
	}
	body {
		font-size:9pt;
	}
	button {
		font-size:9pt;
	}
	table{
		/*width:70%;*/
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
		height:70px;
	}
</style>

<script>
$(function(){
	$("#title").val("제목입력");
});


function fn_save() {	
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
	
	var formData = $("#frm").serialize();
	  
	$.ajax({
		type:"POST",
		data:formData,
		url:"boardWriteSave.do",
		dataType:"text", // 리턴 타입
		success: function (data) {
			if(data == "ok") {
				alert("저장완료");
				location = "boardList.do";
			} else {
				alert("저장실패");
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
			<caption>게시글 등록</caption>
			<tr>
				<th width="20%"><label for="title">제목</label></th>
				<td width="80%"><input type="text" name="title" id="title" class="input1"></td>
			</tr>
			<tr>
				<th><label for="category">카테고리</label></th>
				<td>
				<select name="category">
					<option value="b">일반</option>
					<option value="g">고민</option>
					<option value="h">취미</option>
				</select>
				</td>
			</tr>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" class="textarea"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="fn_save(); return false;">저장</button>
					<button type="reset">취소</button>
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>