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

#details{
	margin-top: 75px;
}

#datepicker{
	margin-top: 50px;
	text-align: center;
	background-color: #EAEAEA;
	height: 50px;
	padding-top: 10px;
}

#detailName{
	font-size: 36px;
	
}

#detailTable th{
	background-color: #EAEAEA;
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
		<a href="/svapp/Hotel/hotelDetail"><li>호텔예약</li></a>
	</ul>
</div>

<!------------ 객실상세페이지 + 예약시스템  ------------>
<div class="container">
	<div id="details" class="row">
		<ul>
			<li><img src="../images/${hotelimg }.jpg"></li>
			<li>
				<table>
					<tbody>
						<tr><b id="detailName">${hotelname }</b></tr>
					</tbody>
				</table>
				<table id="detailTable">
					<tbody>
						<tr>
							<th>숙소타입</th>
							<td>${hotelsection }</td>
						</tr>
						<tr>
							<th>숙소주소</th>
							<td>${hoteladd }</td>
						</tr>
						<tr>
							<th>투숙인원</th>
							<td>기준: ${hotellimit }명/ 최대: ${hotellimit }명</td>
						</tr>
						<tr>
							<th>1박가격</th>
							<td>${hotelprice }원</td>
						</tr>
					</tbody>
				</table>
			</li>
		</ul>
	</div>




	<!---- 객실예약 시스템 datepicker 시작 ---->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	            $.datepicker.setDefaults($.datepicker.regional['ko']); 
	            $( "#startDate" ).datepicker({
	                 changeMonth: true, 
	                 changeYear: true,
	                 nextText: '다음 달',
	                 prevText: '이전 달', 
	                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 dateFormat: "yy-mm-dd",
	                 minDate: '0',      //오늘날짜 이전은 선택불가
	                 onClose: function( selectedDate ) {    
	                      //시작일(startDate) datepicker가 닫힐때
	                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                     $("#endDate").datepicker( "option", "minDate", selectedDate );
	                 }    
	 
	            });
	            $( "#endDate" ).datepicker({
	                 changeMonth: true, 
	                 changeYear: true,
	                 nextText: '다음 달',
	                 prevText: '이전 달', 
	                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 dateFormat: "yy-mm-dd",
	                 minDate: '0',      //오늘날짜 이전은 선택불가
	                 onClose: function( selectedDate ) {    
	                     // 종료일(endDate) datepicker가 닫힐때
	                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
	                 }    
	 
	            });    
	    });
	</script>
	<form action="/svapp/Hotel/confirmPage">
		<div id="datepicker">
			입실일 <input type="text" id="startDate" name="startDate">
			퇴실일 <input type="text" id="endDate" name="endDate">
			<input type="submit" id="date_Btn" value="예약하기">
			<!-- 버튼 누를때 alert으로 리체크 해주면 좋을듯 -->
		</div>
	</form>
	<!---- 객실예약 시스템 datepicker 끝 ---->
</div>




<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
<%-- <tiles:insertAttribute name="footer" /> --%>
</body>
</html>
