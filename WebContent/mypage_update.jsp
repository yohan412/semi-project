<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.user.dto.UserDto" %>
<%@page import="com.user.dao.UserDao" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		text-align: center;
		border-collapse: separate;
  		border-spacing: 0 15px;
	}
	td input[type="text"], input[type="password"] {
    	width: 350px; height: 30px;
    	font-size: 0.8rem;
    	border: 1px solid #d1d1d1;
	}
	th {
    	margin: 10px 0 8px;
   		font-size: 1.0rem;
   		font-weight: 400;
    	text-align: left;
	}
	#wrap{
		display: flex;
  		justify-content: center;
	}
	#submit, #reset{
		cursor:pointer;
	}
	#submit{
		width : 80px;
	 	height : 30px;
		background-color:rgb(75, 161, 231);
		border: 1px solid gray;
		border-radius: 5px;
	}
	#reset{
		width : 80px;
	 	height : 30px;
		background-color:#d1d1d1;
		border: 1px solid gray;
		border-radius: 5px;
	}
	function move(){
	location.href= "/WebContent/mypage.jsp";
}
	function move2(){
	location.href= "/WebContent/mypage.jsp";
	
}
</style>
<style language="JavaScript" src=".js">
	//자바스크립트 파일 넣기!!
	
</style>
</head>
<body>
<header><%@ include file="./form/header.jsp" %></header>	
<h2 align="center">마이 페이지</h2>
<div>
	<hr size="1" width="500%">
</div>
<div id="wrap">
	<form action="mypage_update_sucesscheck.jsp" method="post">
		<table>
		<col width="150px"><col width="300px">
			<tr id="user_name">
				<th>성 명</th>
				<td><input type="name" placeholder="이름을 입력하세요" value=${user.user_name} readonly></td>
			</tr>
			<tr id="user_id">
				<th>아이디</th>
				<td><input type="id" placeholder="아이디를 입력하세요" value=${user.user_id} readonly></td>
			</tr>
			<tr id="user_password">
				<th>비밀번호</th>
				<td><input type="password" placeholder="비밀번호를 입력하세요" value=${user.user_password} ></td>
			</tr>
			<tr id="user_phone">
				<th>전화번호</th>
				<td><input type="text" placeholder="휴대 전화번호를 입력하세요"  value=${user.user_phone}></td>
			</tr>
			<tr id="user_email">
				<th>이메일</th>
				<td><input type="text" placeholder=" ex) kh@naver.com" value=${user.user_email}></td>
			</tr>
			<tr id="user_addr">
				<th>주소</th>
				<td><input type="text" placeholder="주소를 입력하세요" value=${user.user_addr}></td>
			</tr>
		</table>
		<div align="center">
				<input type="submit" id="submit" value="수정 완료" onclick="location.href='mypage_update_sucesscheck.jsp'"">
				<input type="button" id="reset" value="취 소" onclick="javascript:window.location='mypage.jsp'">
		</div>		
	</form>
</div>
	<footer><%@ include file = "form/footer.jsp" %></footer>
</body>
</html>