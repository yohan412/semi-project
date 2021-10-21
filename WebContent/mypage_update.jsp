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
	td input[type="text"], input[type="password"],input[type="tel"],input[type="email"] {
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

	<h2 align="center">마이 페이지 수정</h2>
	<div>
		<hr size="1" width="500%">
	</div>
<div id="wrap">
	<form action ="" method="post">
	<table class="mylist">
		<col width="150px"><col width="300px">
		<tr>
			<th>성명</th>
			<td><input type="text" placeholder="이름을 작성해주세요." readonly="readonly"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" placeholder="ex) kh " readonly="readonly"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" placeholder="전화번호를 입력해주세요" size="60"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" placeholder="ex)kh@naver.com" size="60"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" placeholder="주소를 입력해주세요" size="60"></td>
		</tr>
	</table>
		<div align="center">
			<input type="submit" id="submit" value="수정 완료">
			<input type="button" id="reset" value="취 소" onclick="">
		</div>
	</form>	
</div>	
</body>
</html>