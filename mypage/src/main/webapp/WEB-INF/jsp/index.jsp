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
	div {
		width: 80%
	}
	table {
		border-collapse:collapse;
	}
	.div-banner {
		text-align: center;
		border: 1px solid #000000;
		height: 200px;
	}
	.div-main{
		display: flex;
		margin-top: 10px;
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
	
	/* Slideshow container */
.slideshow-container {
	width: 100%;
	height: 100%;
 	position: relative;
	overflow: hidden;
	}

/* effect */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: relative;
  top: 50%;	
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
</style>
<script type="text/javascript">

$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
	$(".mySlideDiv").hide(); //모든 div 숨김
	var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".mySlideDiv").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".mySlideDiv").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

</script>
<body>
<%@ include file="../jsp/include/topmenu.jsp" %>
<%@ include file="../jsp/include/boardmenu.jsp" %>

<div class="div-banner">
	<div class="slideshow-container">
	    <div class="mySlideDiv fade active">
	       <img src="/images/banner/banner-1.jpg"> 
	    </div>
	           
	    <div class="mySlideDiv fade">
	        <img src="/images/banner/banner-2.jpg"> 
	    </div>
	            
	    <div class="mySlideDiv fade">
	    	<img src="/images/banner/banner-3.jpg"> 
	    </div>
	
	    <a class="prev" onclick="prevSlide()">&#10094;</a>
	    <a class="next" onclick="nextSlide()">&#10095;</a>
	</div>
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
</body>
</html>