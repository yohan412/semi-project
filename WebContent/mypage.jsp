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
.information{
	text-align:center;
}
.mylist{
	margin-left : auto;
	margin-right : auto;
	line-height : 40px;
}
#list{
	vertical-align:top; 
}
.function{
	text-align:center;
	letter-spacing : 15px;
}
</style>
</head>
<body>
<header><%@ include file="./form/header.jsp" %></header>
	<h2 class="information">마이 페이지</h2>
	<hr>
	<form action ="" method="post">
	<table class="mylist">
		<col width="150px"><col width="300px">
		<tr>
			<th>성명</th>
			<td><input type="text" placeholder="이름을 작성해주세요." id="name" size="60"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" placeholder="ex)kh" id="id" size="60"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" placeholder="전화번호를 입력해주세요" id="tel" size="60"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" placeholder="ex)kh@naver.com" id="email" size="60"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" placeholder="주소를 입력해주세요" id="addr" size="60"></td>
		</tr>
		<tr>
			<th id="list">내가 쓴 글 목록</th>
			<td><textarea rows="10" cols="60" id="list" style="resize:none;"></textarea></td>
		</tr>
		<tr>
			<th id="list">찜 목록</th>
			<td><textarea rows="10" cols="60" id="wish" style="resize:none;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" class="function">
			<input type="submit" value="수정">
			<input type="button" value="탈퇴" onclick="">
			<input type="button" value="취소" onclick="">
			</td>
		</tr>
	</table>
	</form>		
<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>