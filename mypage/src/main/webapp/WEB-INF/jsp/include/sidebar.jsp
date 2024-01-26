<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.div-left {
		border:1px solid #cccccc;
		width:10%;
		margin-right:10px;
		height: 500px;
		text-align: center;
		margin-top: 20px;
	}
	.side-bar{
		width: 100%;
	}
	.side-caption{
		margin-top: 5px;
		margin-bottom: 5px;
	}
</style>
<body>
<div class="div-left">
	<table>
	<caption class="side-caption">바로가기</caption>
		<tr>
			<td><a href="/main.do">메인</a></td>
		</tr>
		<tr>
			<td><a href="/boardList.do?category=n">공지사항</a></td>
		</tr>
		<tr>
			<td><a href="/boardList.do?category=b">일반 게시판</a></td>
		</tr>
		<tr>
			<td><a href="/boardList.do?category=g">고민 게시판</a></td>
		</tr>
		<tr>
			<td><a href="/boardList.do?category=h">취미 게시판</a></td>
		</tr>
	</table>
</div>
</body>
</html>