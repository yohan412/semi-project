<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주변 센터</title>
<!-- kakao map api + services 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf6a0311e8ff428c0d13bd95e775d7f3&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
<!-- ajax통신으로 검색값 받아오기
$.ajax({
    url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('숭의동'),
    type:'GET',
    headers: {'Authorization' : 'KakaoAK f897ab2bc89e5486a5355b613e9fd8a7'},
	success:function(data){
		console.log(data);
	},
	error : function(e){
		console.log(e);
	}
}); -->
	$(documen)
</script>

<style type="text/css">
h1 {
	text-align: center;
}
#wrap{
	width:80%;
	margin: 0 auto;
	text-align: center;
}
#map {
	width: 600px;
	height: 300px;
	display:inline-block;
}


#search {
	display: flex;
	align-items: center;
	justify-content: center;
}

#sorting {
	display:flex;
	justify-content: center;
	font-size: 15px;
	font-weight: bold;
	text-align:center;
}
.sorting_sub{
	width:180px;
	height:30px;
}
#sorting select {
	width: 100px;
	height: 20px;
}
#centerboard_list img{
	border-radius: 30%;
	width:200px;
	height:200px;
}
.center_brief{
	width:100%;
	height:200px;
	border:1px solid black;
	border-radius: 25px;
	min-width:600px;
}

/*찜 버튼 구현*/
.checkbox-wrap{
	cursor:pointer;
	position: relative;
	left:95%;
	top:10px;
}
.checkbox-wrap .check-icon  {
	display: inline-block; 
	width: 30px; height: 30px; 
	background: url('img/emt_heart.png') left center no-repeat; 
	vertical-align: middle; 
	transition-duration: .3s; }	
.checkbox-wrap input[type=checkbox]{display:none;}
.checkbox-wrap input[type=checkbox]:disalbed + .check-icon{
	background-image:url('img/emt_heart.png');
}
input[type=checkbox]:checked + .check-icon{
	background-image:url('img/heart.png');
}
</style>

</head>
<body>
	<header>
		<%@ include file="./form/header.jsp"%>
	</header>
	<h1>내 주변 센터 목록</h1>
	<hr>
	<br>
	<div id="wrap">
		<div id="map">
		</div>
<!-- 지도부분 구현 -->
<script type="text/javascript">

	var container = document.getElementById('map'); //지도를 표시할 div
	var options = {
		center: new kakao.maps.LatLng(37.498095, 127.027610), //지도의 중심 좌표
		level: 4 //지도 확대 레벨
	};
	
	//지도 생성
	var map = new kakao.maps.Map(container, options);
	
	// 주소-좌표 변환 객체를 생성	
	var geocoder = new kakao.maps.services.Geocoder();
	
	
	//Centercontroller에서 centerlist를 받아옴
	//javascript와 jstl혼용시 JSTL에선 Javascript 값을 받을수 없고 Javascript에선 JSTL값 받기 가능
	//웹 동작 순서 JAVA>JSTL>HTML>Javascript 
	
	//객체를 담기위한 배열
	var centerlist = new Array();
	// center 객체
	var centerObj = function(name,loc){
		this.name=name;
		this.loc=loc;
	}
	
	//controller 에서 보내준 centerlist의 값을 넣어줌
	<c:forEach items="${centerlist}" var="center">
		var tempCenter = new centerObj("${center.centername}","${center.centerloc}");
		centerlist.push(tempCenter);
	</c:forEach>
	
	for(var i = 0 ; i < centerlist.length ; i++){
		
		//주소 검색하여 주소를 좌표로 변환
		geocoder.addressSearch(centerlist[i].loc,  function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+centerlist[i].name+'</div>'
		        });
		        infowindow.open(map, marker);
		    } 
		});    
	}
	
	
</script>
		<br>
		<div id="search">
			<img alt="searchicon" src="img/tmp_image.png" width="60px" height="60px">
			<input type="text" placeholder="서울시 성북구" style="width:500px;height:60px;font-size:15px;">
		</div>
		<br>
		<div id="sorting">
			<div class="sorting_sub">
			센터종류&nbsp; <select name="center_category">
				<option value="gym">헬스장</option>
				<option value="yoga">요가</option>
				<option value="pilates">필라테스</option>
				<option value="crossfit">크로스핏</option>
				<option value="etc">기타</option>
			</select>
			</div>
			<div class="sorting_sub">
			가격&nbsp; <select name="price">
				<option value="desc_price">가격 높은 순</option>
				<option value="asc_price">가격 낮은 순</option>
			</select>
			</div>
			<div class="sorting_sub">
			평점&nbsp; <select name="rate">
				<option value="desc_rate">평점 높은 순</option>
				<option value="asc_rate">평점 낮은 순</option>
			</select>
			</div>
		</div>
		<br><br>
		<div id="centerboard_list">
			<table width="100%">
				<col width="200px">
				<tr>
					<td><a href="#"><img src="img/tmp_image.png"></a></td>
					<td><a href="#"><div class="center_brief">
						<label class="checkbox-wrap"><input type="checkbox" name="wish_list" id="center_no1"><i class="check-icon"></i></label>
					</div></a></td>
				</tr>
				<tr>
					<td><a href="#"><img src="img/tmp_image.png"></a></td>
					<td><a href="#"><div class="center_brief">
						<label class="checkbox-wrap"><input type="checkbox" name="wish_list" id="center_no2"><i class="check-icon"></i></label>
					</div></a></td>
				</tr>
				<tr>
					<td><a href="#"><img src="img/tmp_image.png"></a></td>
					<td><a href="#"><div class="center_brief">
						<label class="checkbox-wrap"><input type="checkbox" name="wish_list" id="center_no3"><i class="check-icon"></i></label>
					</div></a></td>
				</tr>
			</table>
		</div>
	</div>
	<footer>
		<%@ include file="./form/footer.jsp"%>
	</footer>
</body>
</html>