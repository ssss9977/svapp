<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<script>
</script>

<!------ 상단 디자인 시작 ---------->
<style type="text/css">
html{display: block;}
body{min-width: 1020px;}

a:link{color: black;}
a:visited{color: black;}
a:hover{text-decoration: none;}

.search-sec{padding: 2rem;}
.search-slt{
    display: block;
    width: 100%;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #55595c;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
.wrn-btn{
    width: 100%;
    font-size: 16px;
    font-weight: 400;
    text-transform: capitalize;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
@media (min-width: 992px){
    .search-sec{
        position: relative;
        top: -114px;
        background: rgba(26, 70, 104, 0.51);
    }
}

@media (max-width: 992px){
    .search-sec{
        background: #1A4668;
    }
}

</style>

<!------ 상단 타이틀, 네비게이션 ---------->
<div class="container">
    <div class="row pt-1 pb-1">
        <div class="col-lg-12" style="text-align: center;">
            <a id="top_title" href="/svapp/index">제주도야-놀자 <i class="fa fa-plane" aria-hidden="true"></i></a>
            <h6>전국 제주도호텔 판매율1위 업체 선정</h6>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#"><i class="fa fa-plane" aria-hidden="true"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    	<li class="" >
        <a class="nav-link" href="/svapp/index">메인<span class="sr-only">(current)</span></a>
      </li>
      <li class="">
        <a class="nav-link" href="/svapp/Hotel/hotelList?page=&name=&priceType=&hotelType=">호텔</a>
      </li>
      <li class="">
        <a class="nav-link" href="#">my예약확인</a>
      </li>
      <li class="">
        <a class="nav-link" href="#">이용후기</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="아이디">
      <input class="form-control mr-sm-2" type="password" placeholder="비밀번호">
      <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">로그인</button>
    </form>
    <div class="ml-2">
    	<button class="btn btn-outline-danger my-2 my-sm-0" type="button" onclick="#">회원가입</button>
    </div>
  </div>
</nav>



<!-- 상단 디자인 끝 -->
