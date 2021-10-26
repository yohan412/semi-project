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
	.notice{
		left: 0;
		top: 30%;
		width:100%;
		text-align: center;
		margin-top: 70px;
		margin-bottom: 50px;
	}
	.text{
		left: 0;
		top: 50%;
		width:100%;
		text-align: center;
	}
	.button{
		left: 0;
		top: 70%;
		width:100%;
		text-align: center;
		margin-bottom: 70px;
	}
	.text input{
		width:200px;
		height:40px;
	}
	.button input{
		width: 170px;
		height: 40px;
		font-size: 20px;
	}
	input{
		margin: 5px;
	}
</style>

</head>
<body>
	<header><%@ include file="form/login_header.jsp" %></header>
	<div class="notice">
		<a>새로운 비밀번호를 작성해 주세요.</a>
		<br><br>
		<a style="font-weight:200;">영문,숫자,특수문자를 함께 사용하시면(8자이상 16자 이하)보다 안전합니다.</a>
	</div>
	
	<div class="text">
		<input type="text" placeholder="새 비밀번호"><br>
		<input type="text" placeholder="새 비밀번호 확인">
	</div>
	
	<div class="button">
		<input type="button" value="확인">
	</div>
	<footer><%@ include file="form/login_footer.jsp" %></footer>
</body>
</html>