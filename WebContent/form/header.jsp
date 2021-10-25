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
	align-items: center;
	height: 110px;
	width: 100%;
	display: flex;
	overflow:hidden;
}

#logo ,#blank{
	dispaly: inline-block;
	width: 239px;
	height: 114px;
}
#login{
	width: 239px;
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
	height:40px;
	background-color:rgb(00,68,137);
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

#nav .sub_menu a:hover{
	color:skyblue;
}

</style>
</head>
<body>
		<div id="header">
			<div id="blank"></div>
			<div id="logo" onclick ="img">
				<a href="main.jsp"><img src="./img/logo.png"  width="239px" height="114px" alt="우리동네 헬스장"></a>
			</div>
			<div id="login">
				<button onclick="location.href='login.jsp'">로그인</button>
				<button onclick="location.href='join_user.jsp'">회원가입</button>
			</div>
			<div id="logout">
				<button onclick="#">로그아웃</button>
				<button onclick="location.href='mypage.jsp'">마이페이지</button>
			</div>
		</div>
		<div id="nav">
			<div class="sub_menu">
				<a href="center_list.jsp">스포츠 센터</a>
			</div>
			<div class="sub_menu">
				<a href="join_business.jsp">사업장 등록</a>
			</div>
			<div class="sub_menu">
				<a href="used_list.jsp">중고거래</a>
			</div>
			<div class="sub_menu">
				<a href="qna.jsp">Q&A</a>
			</div>
			<div class="sub_menu">
				<a href="#">마이페이지</a>
			</div>
		</div>
</body>
</html>