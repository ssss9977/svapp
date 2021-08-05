<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<!-- 부트스트랩, 제이쿼리  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="./css/mycss.css">
<style type="text/css">
.content_1{
	background-color: #EAEAEA;
	height: 110px;
	margin-top: 10px;
	margin-bottom: 40px;
}
.hotellAllMenu{
	background-color: white;
	width: 90%;
	height: 35px;
	border-radius: 2em;
	align-content: center;
	margin-left: 5%;
}
.allMenu_p{
	text-align: center;
	padding-top: 5px; 
}
.Enter{
	height: 100px;
}

</style>
<title>제주도야 놀자!</title>
</head>
<body>

<!-- 상단 네비게이션,부트스트랩 -->
<jsp:include page="./top.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="top" /> --%>
<!-- 상단 이미지+검색바 시작 -->
<section>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://pbs.twimg.com/media/EGHYvttU4AAYKb7?format=jpg&name=large" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://pbs.twimg.com/media/EGHYvtkUcAAuc8T?format=jpg&name=large" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://pbs.twimg.com/media/EGHYvtjU0AAO8w1?format=jpg&name=large" class="d-block w-100" alt="...">
            </div>
            <!--https://upload.wikimedia.org/wikipedia/commons/8/8d/Yarra_Night_Panorama%2C_Melbourne_-_Feb_2005.jpg-->
        </div>
        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
<!-- <section class="search-sec">
    <div class="container">
        <form action="#" method="post" novalidate="novalidate">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="text" class="form-control search-slt" placeholder="Enter Pickup City">
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="text" class="form-control search-slt" placeholder="Enter Drop City">
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <select class="form-control search-slt" id="exampleFormControlSelect1">
                                <option>Select Vehicle</option>
                                <option>Example one</option>
                                <option>Example one</option>
                                <option>Example one</option>
                                <option>Example one</option>
                                <option>Example one</option>
                                <option>Example one</option>
                            </select>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <button type="button" class="btn btn-danger wrn-btn">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section> -->
<!-- 상단 이미지+검색바 끝 -->

<!------- MD추천 숙소 시작 ---------------->
<div class="content_1">
	<p class="content_1p">MD추천-호텔</p>
	<div class="hotellAllMenu">
		<a href="/svapp/Hotel/hotelList?page=&name=&priceType=&hotelType=">
			<p class="allMenu_p">+ 전체보기</p>
		</a>
	</div>
</div>
<div class="container">
	<div class="row">
		<c:forEach var="H" items="${list }">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <img src="./images/${H.hotelImg }.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title"><b>${H.hotelName}</b></h5>
				    <p class="card-text">${H.hotelAdd }</p>
				    <p class="card-text"><b>${H.hotelPrice }원</b></p>
				    <a href="/svapp/Hotel/hotelDetail?no=${H.hotelId }" class="btn btn-danger"><b style="color: white;">예약하기</b></a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class="Enter"></div>
<!-- MD추천 숙소 끝-->
<div class="content_1">
	<p class="content_1p">MD추천-리조트</p>
	<div class="hotellAllMenu">
		<a href="/svapp/Hotel/hotelList?page=&name=&priceType=&hotelType=">
			<p class="allMenu_p">+ 전체보기</p>
		</a>
	</div>
</div>
<div class="container">
	<div class="row">
		<c:forEach var="H" items="${list }">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <img src="./images/${H.hotelImg }.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title"><b>${H.hotelName}</b></h5>
				    <p class="card-text">${H.hotelAdd }</p>
				    <p class="card-text"><b>${H.hotelPrice }원</b></p>
				    <a href="/svapp/Hotel/hotelDetail?no=${H.hotelId }" class="btn btn-danger"><b style="color: white;">예약하기</b></a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- footer -->
<jsp:include page="./footer.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="footer" /> --%>

</body>
</html>
