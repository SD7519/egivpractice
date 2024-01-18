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
<title>전체 게시글 목록</title>
</head>
<style>
	body {
		font-size:9pt;
	}
	button {
		font-size:9pt;
	}
	table{
		width:600px;
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
	.div1 {
		width: 600px;
		text-align:center;
		font-size:15pt;'
	}
	.div2 {
		width:600px;
		font-size:8pt;
		display:flex;
		align-items:center;
	}
</style>
<body>
<%@ include file="../include/topmenu.jsp" %>
<%@ include file="../include/boardmenu.jsp" %>
<div>
	<table>
		<tr>
			<th><div class="div1">전체 게시글 목록</div></th>
		</tr>
		<tr>
			<th><div class="div2">Total : ${total}</div></th>
			<th>
			<div class="div2">
				<form id="searchFrm" method="post" action="boardList.do">
					<select name="searchGubun" id="searchGubun">
						<option value="title">제목</option>
						<option value="name">글쓴이</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchText" id="searchText">
					<button type="submit">검색</button>
				</form>
			</div>
			</th>
		</tr>
		<tr>
			<th width="10%">번호</th>
			<th width="10%">카테고리</th>
			<th width="35%">제목</th>
			<th width="15%">글쓴이</th>
			<th width="15%">등록일</th>
			<th width="15%">조회수</th>
		</tr>
		
		<c:set var="cnt" value="${rowNumber}"/>
		
		<c:forEach var="result" items="${resultList}">
			<tr align="center">
				<td><c:out value="${cnt}"/></td>
				<td><c:out value="${result.category}"/></td>
				<td align="left">
					<a href="boardDetail.do?uno=${result.uno}"><c:out value="${result.title}"/></a>
				</td>
				<td><c:out value="${result.name}"/></td>
				<td><c:out value="${result.rdate}"/></td>
				<td><c:out value="${result.hits}"/></td>
			</tr>		
			<c:set var="cnt" value="${cnt-1}"/>
		</c:forEach>
	</table>
	
	<div style="width:600px; margin-top:5px; text-align:center;">
		<c:forEach var="i" begin="1" end="${totalPage}">
			<a href="boardList.do?viewPage=${i}">${i}</a>
		</c:forEach>
	</div>
	
	<div style="width:600px; margin-top:5px; text-align:right;">
		<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
	</div>
</div>

</body>
</html>