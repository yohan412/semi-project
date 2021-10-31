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
	height: 800px;
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
.content_info,.ask_list{
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

#numbers{
	list-style: none;
}
#numbers li{
	display:inline-block;
	margin-left:5px;
	margin-right:5px;
}
#numbers li a {
	text-decoration: none;
	color:black;
	font-weight:bold;
}
#numbers li a.active {
	color:blue;
}
tbody a {
	text-decoration: none;
	color:black;
	cursor:pointer;
}
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
		
		uskList = new Array();
		
		var uskObj = function(no,writer,title,status,reg){
			this.no=no;
			this.writer=writer;
			this.title=title;
			this.status=status;
			this.reg=reg;
		}
		<c:choose>
		<c:when test="${!empty usklist}">
		<c:forEach items="${usklist}" var="usk">
			var tmpUsk = new uskObj("${usk.uskno}","${usk.userid}","${usk.usktitle}"
					,"${usk.uskstatus}","${usk.uskreg}");
			uskList.push(tmpUsk);
		</c:forEach>
		
		makeBoardList(uskList,false);
		</c:when>
		</c:choose>
	});
	
	function login_chk(){
		if(${loginUser==null}){
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
	
	function ask_detail(uskno,writer){
		
		//접근을 시도하는 사람이 판매자나 글 작성자인지 확인
		if( "${loginUser.userid}" == "${usedDto.userid}" || "${loginUser.userid}" == writer){
			
			var option="top=10,left=10,width=430,height=440, status=no,menubar=no,toolbar=no,resizable=yes";
			window.open("usedcontroller?command=used_ask_detail&writer=${loginUser.userid}&uskno="+uskno,"1:1 문의하기",option);
			
		} else{
			alert("판매자와 글 작성자만 접근 가능합니다.");
		}
		
	}
	
	//table에 리스트 요소를 만드는 함수
	function makeBoardList(list,reset_bl){
		//tbody의 자식 요소 초기화
		$("tbody").empty();
		
		//boardlist 초기화 여부 판단
		if(reset_bl){
			boardlist=list;
		}
		//list에 들어있는 center 정보 추가
		for(var i = 0 ; i < list.length ; i++){
			
			var status;
			if(list[i].status == 'N'){
				status="대기중";
			} else{
				status="답변완료";
			}
			$("tbody").append(
				"<tr>"
				+"<td>"
				+(i+1)+"</td>"
				+"<td>"+list[i].writer+"</td>"
				+"<td align='left'><a onclick='ask_detail("+list[i].no+",\""+list[i].writer+"\")'>"+list[i].title+"</a></td>"
				+"<td>"+status+"</td>"
				+"<td>"+list[i].reg+"</td>"
				+"</tr>"		
			);
		}
		//테이블 페이징
		tablePagenation();
	}
	
	function tablePagenation(){
		/*
		변수 생성
		- rowsPerPage페이지당 보여줄 개수 20
		- rows 가로행 tr 
		- rowsCount 개수 100
		- pageCount 페이지네이션 개수 = 100/20
		- pagenumbers
		콘솔에서 pageCount 찍어보고
		*/
		$("#numbers").empty();
		var rowsPerPage = 3,
			rows = $('.ask_list tbody tr'),
			rowsCount = rows.length
			pageCount = Math.ceil(rowsCount/rowsPerPage),
			numbers = $('#numbers');
		
		/* 페이지네이션 li를 생성 반복문*/
		for(var i = 0 ; i < pageCount;i++){
			numbers.append('<li><a href="">'+(i+1)+'</a></li>');
		}
		//#numbers li:first-child a
		numbers.find('li:first-child a').addClass('active');
		
		//페이지네이션 함수 displayRows
		function displayRows(idx){
			
			var start = (idx)*rowsPerPage;
				end = start + rowsPerPage;
				
			rows.hide();
			//해당하는 부분만 보여줌
			rows.slice(start,end).show();
		}
		
		displayRows(0);
		//페이지네이션 클릭시 보여주기
		/*
			클릭한 그 a 태그의 active,
			그 요소의 숫자를 dislplayRows의 매개변수로 지정
		*/
		numbers.find('li').click(function(e){
			//a태그의 이벤트를 막음
			e.preventDefault();
			
			numbers.find('li a').removeClass('active');
			$(this).find('a').addClass('active');
			var index = $(this).index();
			displayRows(index);
		});
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
				
				<div class="ask_list">
				<h3 align="left">1:1문의 게시글</h3><br>
				<table width="100%">
					<col width="40px">
					<col width="60px">
					<col width="200px">
					<col width="80px">
					<col width="120px">
					<thead>
						<tr>
							<th>번호</th><th>작성자</th><th>제목</th><th>답변상태</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="pagination">
					<ol id="numbers"></ol>
				</div>
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