<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<!-- 부트스트랩, 제이쿼리  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------------ 커스텀 CSS ------------>
<link rel="stylesheet" href="../css/mycss.css">

<style type="text/css">
	ul li{
		list-style-type: none;
		float: left;
		margin-right: 15px;
	}
	
	#content1_1{
		font-size: 36px;
	}
	#content2 ,
	#content1{
		text-align: center;
	}
</style>

<title>제주도야 놀자!</title>
</head>

<body>
<!-- 상단 네비게이션,부트스트랩 -->
<jsp:include page="../top.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="top" /> --%>


<!-------- 숙박형태 검색 ---------->
<div id="navi_cont" class="mb-5">
	<ul>
		<a href="/svapp/index"><li>홈</li></a>
		<li>></li>
		<a href="/svapp/Hotel/hotelList?page=&name=&priceType=&hotelType="><li>호텔검색</li></a>
		<li>></li>
		<a href=#><li>예약완료</li></a>
	</ul>
</div>

<!-- 예약완료 내용 보여주기 -->
<div class="container">
	<div id="content1">
		<b id="content1_1">예약이 완료되었습니다!</b>
	</div>
	<div id="content2">
		<p>입실일: ${sDate }  ~  퇴실일: ${eDate } </p>
	</div>
</div>



<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="footer" /> --%>
</body>
</html>
