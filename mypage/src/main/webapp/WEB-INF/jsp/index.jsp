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
<title>메인페이지</title>
<script src="/script/jquery-3.7.1.js"></script>
<script src="/script/jquery-3.7.1.min.js"></script>
</head>
<style>
	* {
		margin:0 auto;
	}
	/*div {
		width: 80%;
	}*/
	table {
		border-collapse:collapse;
	}
	.div-banner {
		text-align: left;
		border: 1px solid #000000;
		height: 200px;
		width: 1250px;
	}
	.div-main{
		display: flex;
		margin-top: 10px;
		width: 1250px;
	}
	.main1 {
		width: 50%;
		border: 1px solid #000000;
		height: 200px;
	}
	.main2 {
		width: 50%;
		border: 1px solid #000000;
		height: 200px;
	}
	.table-1 {
		width: 100%;
	}
	.banner-img {
		width: 100%;
		height:100%;
    	object-fit:cover;
	}
	header {
		width: 1250px;
	}
</style>
<script type="text/javascript">
</script>
<body>
<%@ include file="../jsp/include/topmenu.jsp" %>
<%@ include file="../jsp/include/boardmenu.jsp" %>

<div class="div-banner">
	<img class="banner-img" src="/images/banner/banner-3.jpg" >
</div>
<div class="div-main">
	<div class="main1">
		<table class="table-1">
		<caption>최근 게시물</caption>
			<tr>
				<td><a href="">◇ 가</a></td>
			</tr>
			<tr>
				<td><a href="">◇ 가</a></td>
			</tr>
			<tr>
				<td><a href="">◇ 가</a></td>
			</tr>
			<tr>
				<td><a href="">◇ 가</a></td>
			</tr>
			<tr>
				<td><a href="">◇ 가</a></td>
			</tr>
		</table>
	</div>
	<div class="main2">
	</div>
</div>
<div class="div-main">
	<div class="main2">뭘</div>
	<div class="main2">넣</div>
</div>
<div class="div-main">
	<div class="main2">어</div>
	<div class="main2">야</div>
</div>
<div class="div-main">
	<div class="main2">하</div>
	<div class="main2">지</div>
</div>
<%@ include file="../jsp/include/footer.jsp" %>
</body>
</html>