<%@page import="com.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "com.user.dto.UserDto" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

#logout, #login{
	width: 200px;
	align-self:flex-end;
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
<% 
	UserDto loginUser = (UserDto)session.getAttribute("loginUser");
%>

		<div id="header">
			<div id="blank"></div>
			<div id="logo" onclick="img">
				<a href="main.jsp"><img src="./img/logo.png" width="239px" height="114px" alt="우리동네 헬스장"></a>
			</div>
			<c:if test="${loginUser==null }">
			<div id="login">
				<button onclick="location.href='usercontroller?command=loginform'">로그인</button>
				<button onclick="location.href='usercontroller?command=registform'">회원가입</button>
			</div>		
			</c:if>
			<c:if test="${loginUser !=null }">
				<div id="logout">
				<label>${loginUser.username }님(회원등급은 : ${loginUser.role }) 방문을 환영합니다.</label><br>
				<button onclick="location.href='usercontroller?command=logout'">로그아웃</button>
				<button onclick="location.href='mypage.jsp'">마이페이지</button>
				</div>
			</c:if>
		</div>
		<div id="nav">
			<div class="sub_menu">
				<a href="CenterController?command=centerlist">스포츠 센터</a>
			</div>
			<div class="sub_menu">
				<a href="CenterController?command=business&user_no=${ loginUser.userno }">사업장 등록</a>
			</div>
			<div class="sub_menu">
				<a href="usedcontroller?command=usedlist">중고거래</a>
			</div>
			<div class="sub_menu">
				<a href="qna.jsp">Q&A</a>
			</div>
		</div>
</body>
</html>