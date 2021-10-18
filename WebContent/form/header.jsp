<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
.sub_menu a {
	text-decoration: none;
	color:white;
}

#header {
	text-align:center;
	justify-content:space-between;
	height: 65px;
	width: 100%;
	display: flex;
	overflow:hidden;
}

#logo ,#blank{
	dispaly: inline-block;
	width: 200px;
	height: 60px;
}
#login{
	width: 200px;
	align-self:flex-end;
	display:block;
}
#logout{
	width: 200px;
	align-self:flex-end;
	display:none;
}
#nav {
	margin-top:10px;
	align: "center";
	width: 100%;
	height:30px;
	background-color:gray;
	display: flex;
	overflow: hidden;
	justify-content:center;
	align-items: center;
}

#nav .sub_menu {
	margin-right: 50px;
	margin-left: 50px;
	float: left;
	width: 100px;
	font-weight: bold;
	text-align: center;
}
</style>
</head>
<body>
		<div id="header">
			<div id="blank"></div>
			<div id="logo">
				<a href="#"><img src="./img/tmp.png" width="200px" height="60px" alt="내주변 헬스장"></a>
			</div>

			<div id="login">
				<button onclick="location.href='#'">로그인</button>
				<button onclick="location.href='#'">회원가입</button>
			</div>
			<div id="logout">
				<button onclick="location.href='#'">로그아웃</button>
				<button onclick="location.href='#'">마이페이지</button>
			</div>
		</div>
		<div id="nav">
			<div class="sub_menu">
				<a href="#">스포츠 센터</a>
			</div>
			<div class="sub_menu">
				<a href="#">사업장 등록</a>
			</div>
			<div class="sub_menu">
				<a href="#">중고거래</a>
			</div>
			<div class="sub_menu">
				<a href="#">Q&A</a>
			</div>
		</div>
</body>
</html>