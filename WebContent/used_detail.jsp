<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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

.title a{
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

.map{
	margin-top: 40px;
}

.pic{
	margin-top: 40px;
}

.content_info{
	margin-top: 40px;
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

</style>
</head>
<body>

	<header><%@ include file="form\header.jsp" %></header>
	
	<div class="wrap">
		<div class="used_detail">
			<div class="headline">
				<div class="title">
					<a>[헬 스]</a>
					<a>ㅇㅇ동 3개월 양도합니다</a>
					<img src="./img/emt_heart.png" width="30px" height="30px">
				</div>
				
				<div class="write_info">
					<a>작성자</a>
					<a>2020.02.02</a>
				</div>
				<br><hr>
			</div>
			
			<div class="content">
				<div class="map">
					<img src="./img/tmp_image.png" width="500px" height="260px">
				</div>
				
				<div class="pic">
					<img src="./img/tmp_image.png" width="230px" height="230px">
				</div>
				
				<div class="content_info">
					<p>가격:</p>
					<p>사업장명:</p>
					<p>주소:</p>
					<p>기간별 가격:</p>
					<p>관련 정보:</p>
				</div>
			</div>
			
			
		</div>
		<div class="regist">
				<input type="button" id="ask" value="문  의" onclick="">&nbsp;&nbsp;
				<input type="button" id="list" value="목  록" onclick="">
			</div>
	</div>
	
	<footer><%@ include file="form\footer.jsp" %></footer>	
</body>
</html>