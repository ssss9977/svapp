<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<!-- 부트스트랩, 제이쿼리  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------------ CSS ------------>
<link rel="stylesheet" href="../css/mycss.css">
<style type="text/css">

ul li{
	list-style-type: none;
	float: left;
	margin-right: 15px;
}

#H_radio{
	background-color: #0A90B2;
	clear: both;
}
.search_Box {padding-bottom: 100px;}
.search_Box th{
	background-color: #f7f7f7;
	width: 100px;
	height: 40px;
	text-align: center;
}
.search_Box td{padding-left: 15px;}
input{margin-left: 15px;}
#search_btn{text-align: center;}
#H_list{display: inline-block;}

#H_list ul li{
	float: left;
	width: 330px;
	height: 410px;
	border: 1px solid #e1e1e1;
}
#H_list ul li .photo{
	width: 320px;
	height: 210px;
	padding-top: 5px;
	padding-left: 5px;
}
#H_List td{
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 10px;
}
#pager{text-align: center;}

#H_listName{
	font-size: 21px;
	font-weight: bold;
}
#H_listAdd{
	height: 60px;
}
#H_listSection b{
	color: #4641D9;
	height: 34px;
}
#H_listPrice{
	font-size: 18px;
	font-weight: bold;
}
</style>

<title>제주도야 놀자!</title>
</head>

<body>

<!-- 상단 네비게이션,부트스트랩 -->
<jsp:include page="../top.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="top" /> --%>

<!-------- 숙박형태 검색하기 ---------->
<div class="mb-5" id="navi_cont">
	<ul>
		<a href="/svapp/index"><li>홈</li></a>
		<li>></li>
		<a href="/svapp/Hotel/hotelList?page=&name=&priceType=&hotelType="><li>호텔검색</li></a>
	</ul>
</div>

<form action="?" method="get">
	<div class="container">
		<div id="H_radio">
			<img src="../images/search_tit.gif" align="absmiddle">
			<b style="color: white;">간편하게 숙박형태를 검색해보세요.</b>
		</div>
		<div class="search_Box">
				<table>
					<tbody>
						<tr>
							<th>가격별</th>
							<td>
								<input type="radio" name="priceType" id="priceType0" value="" ${param.priceType==''? 'checked':'' }>
								<label for="priceType0">전체보기</label>
								<input type="radio" name="priceType" id="priceType1" value="5만원이하" ${param.priceType=='5만원이하'? 'checked':'' }>
								<label for="priceType1">~5만원대</label>
								<input type="radio" name="priceType" id="priceType2" value="10만원이하" ${param.priceType=='10만원이하'? 'checked':'' }>
								<label for="priceType2">~10만원대</label>
								<input type="radio" name="priceType" id="priceType3" value="20만원이하" ${param.priceType=='20만원이하'? 'checked':'' }>
								<label for="priceType3">~20만원대</label>
								<input type="radio" name="priceType" id="priceType4" value="50만원이하" ${param.priceType=='50만원이하'? 'checked':'' }>
								<label for="priceType4">~50만원대</label>
								<label style="color: red;"> 준비중 </label>
							</td>
						</tr>
						<tr>
							<th>타입별</th>
							<td>
								<input type="radio" name="hotelType" id="hotelType0" value="" ${param.hotelType==''? 'checked':'' }>
								<label for="people0">전체보기</label>
								<input type="radio" name="hotelType" id="hotelType1" value="호텔" ${param.hotelType=='호텔'? 'checked':'' }>
								<label for="people1">호텔</label>
								<input type="radio" name="hotelType" id="hotelType2" value="리조트" ${param.hotelType=='리조트'? 'checked':'' }>
								<label for="people2">리조트</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="search_btn">
					<input type="text" name="hotelname" id="hotelname" placeholder="숙소명" value="${param.hotelname}">
					<input type="submit" value="검색">
				</div>
			</div>
		</div>

	<!---------- 호텔리스트 출력 ---------->
	<div class="container">
		<div id="H_list">
			<ul>
				<c:forEach var="H" items="${list }">
					<a href="/svapp/Hotel/hotelDetail?no=${H.hotelId }"> <!-- p=&n=&t=&a=&l=&pr= -->
						<li style="margin-bottom: 10px;">
							<table>
								<tbody>
									<tr>
										<img src="../images/${H.hotelImg }.jpg" class="photo">
									</tr>
									<tr>
										<td id="H_listName">${H.hotelName}</td>
									</tr>
									<tr>
										<td id="H_listAdd">${H.hotelAdd }</td>
									</tr>
									<tr>
										<td id="H_listSection"><b>[${H.hotelSection }]</b> 1박가:</td>
									</tr>
									<tr>
										<td id="H_listPrice">${H.hotelPrice }원</td>
									</tr>
								</tbody>
							</table>
						</li>
					</a>
				</c:forEach>
			</ul>
		</div>
		<!------- pager ------->
		<div id="pager">
			<div>
				${page }/${pageCount } page
			</div>
			<div>
				<c:if test="${pStart > 5}">
		     	<b><a href="/svapp/Hotel/hotelList?name=&priceType=&hotelType=&page=${pStart-5}">[이전]</a></b>
		   	</c:if>
		   	<c:if test="${searchCount >= 9}">
			    <c:forEach var="i" begin="${pStart}" end="${pEnd}" step="1">
			     	<b><a href="/svapp/Hotel/hotelList?name=&priceType=&hotelType=${searchOption }&page=${i}" style="color: ${(page==i)?'#ED0000;':'#828282;'}"> [${i}] </a></b>
			    </c:forEach>
			  </c:if>
		   	<c:if test="${(pStart+5) <= pageCount}">
		     	<b><a href="/svapp/Hotel/hotelList?name=&priceType=&hotelType=&page=${pStart+5}">[다음]</a></b>
		    </c:if>
			</div>
		</div>
	</div>
	
	
</form>


<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="footer" /> --%>

</body>
</html>
