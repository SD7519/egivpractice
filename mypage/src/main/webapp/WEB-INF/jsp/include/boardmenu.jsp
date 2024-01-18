<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	#board_btn {
		width:100%;
		padding: 0;
		background-color: silver;
		cursor: pointer;
	}
	table {
		width: 100%;
		padding: 0;
	}
</style>
</head>
<body>
<div>
	<table>
		<tr>
			<th width="25%"><button id="board_btn" onclick="location='/boardWrite.do'">게시글 작성</button></th>
			<th width="25%"><button id="board_btn" onclick="location='/boardList.do'">전체 게시판</button></th>
			<th width="25%"><button id="board_btn">3번</button></th>
			<th width="25%"><button id="board_btn">4번</button></th>
		</tr>
	</table>
</div>
</body>
</html>