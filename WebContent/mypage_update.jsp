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
</style>
</head>
<body>
<header><%@ include file="./form/header.jsp" %></header>	
<h2 align="center">마이 페이지</h2>
<div>
	<hr size="1" width="500%">
</div>
<div id="wrap">
	<form action="" method="post">
		<table>
		<col width="150px"><col width="300px">
			<tr id="username">
				<th>성 명</th>
				<td><input type="text" placeholder="이름을 입력하세요" readonly="readonly"></td>
			</tr>
			<tr id="userid">
				<th>아이디</th>
				<td><input type="text" placeholder=" ex) kh" readonly="readonly"></td>
			</tr>
			<tr id="userpwd">
				<th>비밀번호</th>
				<td><input type="password" placeholder="비밀번호를 입력하세요" autofocus></td>
			</tr>
			<tr id="phone">
				<th>전화번호</th>
				<td><input type="text" placeholder="휴대 전화번호를 입력하세요"></td>
			</tr>
			<tr id="email">
				<th>이메일</th>
				<td><input type="text" placeholder=" ex) kh@naver.com"></td>
			</tr>
			<tr id="addr">
				<th>주소</th>
				<td><input type="text" placeholder="주소를 입력하세요"></td>
			</tr>
		</table>
		<div align="center">
				<input type="submit" id="submit" value="수정 완료">
				<input type="button" id="reset" value="취 소" onclick="">
		</div>		
	</form>
</div>
	<footer><%@ include file = "form/footer.jsp" %></footer>
</body>
</html>