<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}
	
.wrap{
	width: 100%;
	height: 1000px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 0 100px 0;
}

.used_detail{
	display: flex;
	position: absolute;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	background: rgb(234, 234, 234);
	width: 800px;
}

.headline{
	margin: 15px;
	width: 750px;
}

.title span{
	font-weight: bold;
	font-size: 20px;
}

.title img{
	padding-left: 400px;
}

.write_info a{
	font-size: 12px;
}

.content{
	width: 700px;
	height: 750px;
	background: white;
	margin: 20px;
	text-align: center;
}

#map{
	display:inline-block;
	margin-top: 40px;
	width:500px;
	height:260px;
}

.pic{
	display:inline-block;
	margin-top: 40px;
	width:500px;
	text-align:left;
}
.pic img{
	width:150px;
	height:100px;
}
.content_info{
	display:inline-block;
	margin-top: 40px;
	width:500px;
}

.content_info p{
	text-align: left;
}

.regist{
	margin-top: 1000px;
}

.regist input{
	width: 85px;
	height: 35px;
	border-radius: 5px;
	border: none;
	font-weight: bold;
}

#ask{
	background: rgb(75, 161, 231);
	color: white;
}

#list{
	background: grey;
	color: white;
}
/*찜 버튼 구현 시작*/
.checkbox-wrap{
	cursor:pointer;
	position: relative;
	left: 60%;
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
/*찜 버튼 구현 끝*/
</style>
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf6a0311e8ff428c0d13bd95e775d7f3&libraries=services"></script>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	$(function(){
		
		var centerAddr = "${usedDto.usedaddr}";
		
		
		// 주소-좌표 변환 객체를 생성	
		var geocoder = new kakao.maps.services.Geocoder();
		
		//주소 검색하여 주소를 좌표로 변환
		geocoder.addressSearch(centerAddr,function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				var container = document.getElementById('map'); //지도를 표시할 div
				var options = {
					center : new kakao.maps.LatLng(result[0].y, result[0].x), //지도의 중심 좌표
					level : 4
				//지도 확대 레벨
				};
				//지도 생성
				map = new kakao.maps.Map(container, options);

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				//마커로 표시
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});
				
				// 인포윈도우로 장소에 대한 설명을 표시
				var infowindow = new kakao.maps.InfoWindow(
					{
						content : '<div style="width:150px;text-align:center;padding:6px 0;">'
								+ "${usedDto.usedcenternm}"
								+ '</div>',
						position : coords
					});
				infowindow.open(map, marker);
			}
			
		});
	});
	
	function login_chk(){
		if(${loginUser==null }){
			if(confirm("로그인이 필요한 작업입니다.\n 로그인 하시겠습니까?")){
				location.href="login.jsp"
			}else{
				
			}
		} else{
			question1On1();
		}
	}
	
	function question1On1(){
		var option="top=10,left=10,width=430,height=440, status=no,menubar=no,toolbar=no,resizable=no";
		window.open("usedcontroller?command=askwriteform&usedno=${usedDto.usedno}&writer=${loginUser.userid}","1:1 문의하기",option);
	}
</script>
</head>
<body>

	<header><%@ include file="form\header.jsp" %></header>
	
	<div class="wrap">
		<div class="used_detail">
			<div class="headline">
				<div class="title">
					<span>[${usedDto.usedcategory}]</span>
					<span>${usedDto.usedtitle}</span>
					<label class='checkbox-wrap'><input type='checkbox' name='wish_list' id='center_no1'><i class='check-icon'></i></label>
				</div>
				
				<div class="write_info">
					<a>${usedDto.userid}</a>
					<a>${usedDto.usedreg}</a>
				</div>
				<br><hr>
			</div>
			
			<div class="content">
				<div id="map">					
				</div>
				
				<div class="content_info">
					<p>가격:${usedDto.usedprice}</p>
					<p>사업장명:${usedDto.usedcenternm}</p>
					<p>주소:${usedDto.usedaddr}</p>
					<p>관련 정보:${usedDto.usedcontent}</p>
				</div>
				
				<div class="pic">
					<img src="./img/tmp_image.png">
					<img src="./img/tmp_image.png">
					<img src="./img/tmp_image.png">
				</div>
				
			</div>			
			
		</div>
		<div class="regist">
				<input type="button" id="ask" value="문  의" onclick="login_chk()">&nbsp;&nbsp;
				<input type="button" id="list" value="목  록" onclick="location.href='usedcontroller?command=usedlist'">
			</div>
	</div>
	
	<footer><%@ include file="form\footer.jsp" %></footer>	
</body>
</html>