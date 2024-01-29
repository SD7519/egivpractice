<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>

<% pageContext.setAttribute("newline", "\n"); %>

<c:set var="content" value="${fn:replace(detailVO.content, newline, '<br>') }"/>
<c:set var="Uname" value='<%=(String) session.getAttribute("username")%>'/>
<c:set var="Uid" value='<%=(String) session.getAttribute("userid")%>'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 화면</title>
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
	.div-table {
		width:90%;
	}
	.div-main {
		display: flex;
		width: 1000px;
	}
	.reply {
		border: 1px solid #cccccc;
		width:100%;
		display: flex;
		text-align: center;
		justify-content: center;
	}
	.input-rp {
		width: 80%;
		height:50px;
		margin: 0;
		padding: 5px;
		resize: none;
		width: 750px;
	}
	.rpname {
		width: 80px;
		margin: 0;
		padding-top: 20px;
		text-align: center;
		border:none;
		outline:none;
	}
	.rpbtn {
		margin: 0;
		padding: 0;	
	}
</style>
<script>
function fn_del() {	
	var unq = ${detailVO.unq};
	var category = "${detailVO.category}";
	
	var sendData = "unq="+ unq;
	
	if(confirm("삭제하시겠습니까?") == true){
		$.ajax({
			type:"POST",
			data:sendData,
			url:"deleteBoard.do",
			dataType:"text", // 리턴 타입
			
			success: function(result) {
				if(result == "1") {
					alert("삭제완료");
					location = "boardList.do?category="+ category;
				} else {
					alert("삭제실패\n관리자에게 연락주세요.");
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
<body>
<div class="warp">
<div class="div-main">
<%@ include file="../include/sidebar.jsp" %>
<div class="div-table">
	<form id="frm">
		<table>
			<caption>게시글 상세</caption>
			<tr>
				<th width="20%">제목</th>
				<td width="80%">${detailVO.title}</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>${boardCT}</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><c:out value="${detailVO.name}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td height="50">${detailVO.content}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${detailVO.rdate}</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="location='boardList.do?category=${detailVO.category}'">목록</button>
					<button type="button" onclick="fn_upr(); return false;">${detailVO.rcm} 추천</button>
					<c:if test="${detailVO.name == Uname or Uid == 'admin'}">
						<button type="button" onclick="location='boardModifyWrite.do?unq=${detailVO.unq}'">수정</button>
						<button type="button" onclick="fn_del(); return false;">삭제</button>
					</c:if>
				</th>
			</tr>
		</table>
	</form>
	<br>
<%if(UserName != null){ %>
<div>
	<form name="replyfrm" id="replyfrm" class="reply">
		<div><input type="text" name="rpname" id="rpname" value="<%out.print(UserName);%>" class="rpname" readonly></div>
		<div><textarea name="rpcontent" id="rpcontent" class="input-rp"></textarea></div>
		<div class="rpbtn"><button type="button" onclick="fn_rep(); return false;" style="margin-top:20px;">등록</button></div>
		<input type="hidden" name="rpboardunq" id="rpboardunq" value="${detailVO.unq}">
	</form>
</div>
<%} %>
<script>
function fn_rep() {
	
	var unq = ${detailVO.unq};
	
	var formData = $("#replyfrm").serialize();
	
	$.ajax({
		type:"POST",
		data:formData,
		url:"insertReply.do",
		dataType:"text", // 리턴 타입
		
		success: function(result) {
			if(result == "ok") {
				location = "boardDetail.do?unq="+unq + "&rpboardunq=" + unq;
			} else {
				alert("등록실패\n관리자에게 연락주세요.");
			}
		},
		error:function() {
				alert("오류발생");			
		}
	});
}

function fn_upr() {
	
	var unq = ${detailVO.unq};
	
//	var formData = $("#replyfrm").serialize();
	
	$.ajax({
		type:"POST",
		data:"unq=" + unq,
		url:"updateRcm.do",
		dataType:"text", // 리턴 타입
		
		success: function(result) {
			if(result == "1") {
				location = "boardDetail.do?unq="+unq + "&rpboardunq=" + unq;
			} else {
				alert("관리자에게 연락주세요.");
			}
		},
		error:function() {
				alert("오류발생");			
		}
	});
}
</script>
<br>
<div>
	<table>
		<c:forEach var="result" items="${replyVO}">
			<tr>
				<th width="20%"><c:out value="${result.rpname}"/></th>
				<td width="68%"><c:out value="${result.rpcontent}"/></td>
				<td width="12%" style="text-align: center;">
					<c:if test="${result.rpname == Uname or Uid == 'admin'}">
						<a href="">수정</a>
						<a href="#" onclick="fn_rpdel(${result.rpunq}); return false;">삭제</a><br>
					</c:if>
					<c:out value="${result.rpdate}"/>
				</td>
			</tr>
		</c:forEach>
	</table>
<script>
function fn_rpdel(rpunq) {
	
	var unq = ${detailVO.unq};
//	var rpunq = $('#rpunq').val();
	
	var SendData = "rpunq=" + rpunq;
	
	
	$.ajax({
		type:"POST",
		data:SendData,
		url:"deleteReply.do",
		dataType:"text", // 리턴 타입
		
		success: function(result) {
			if(result == "1") {
				alert("삭제완료");
				location = "boardDetail.do?unq="+unq + "&rpboardunq=" + unq;
			} else {
				alert("삭제실패\n관리자에게 연락주세요.");
			}
		},
		error:function() {
				alert("오류발생");			
		}
	});
}
</script>
</div>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>