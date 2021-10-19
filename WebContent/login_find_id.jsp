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
	div{
		width: 100%;
	}
	.button{
		position: absolute;
		top: 65%;
		left:0;
		text-align: center;
	}
	.button input{
		width: 170px;
		height: 40px;
		font-size: 20px;
	}
	.notice{
		position: absolute;
		top: 40%;
		left:0;
		text-align: center;
	}
	header{
		position:absolute;
		left: 0;
		top:0;
		width: 100%;
	}
	footer{
		position:absolute;
		left: 0;
		bottom:0;
		width: 100%;
	}
</style>
</head>
<body>
	<header><%@ include file="form/login_header.jsp" %></header>
	
	<div class="notice">
		<a>여기에 안내사항</a>
		<br><br><br>
		<a>기타안내사항</a>
	</div>
	<br><br><br><br><br><br>
	<div class="button">
		<input type="button" id="login" value="로그인 하기"><br>
		<input type="button" id="find_pw" value="비밀번호 찾기">
	</div>
	<footer><%@ include file="form/login_footer.jsp" %></footer>
</body>
</html>