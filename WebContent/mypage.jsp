<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import ="com.user.dto.UserDto" %>
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
	border-spacing : 40px;
}
#list{
	vertical-align:top; 
}
.function{
	text-align:center;
	letter-spacing : 15px;
}
td input[type="text"], input[type="email"], input[type="tel"] {
	width: 450px; height: 30px;
    font-size: 0.8rem;
    border: 1px solid #d1d1d1;
}
</style>
</head>
<body>
<header><%@ include file="./form/header.jsp" %></header>
	<h2 class="information">마이 페이지</h2>
	<hr>
	<table class="mylist">
		<col width="150px"><col width="300px">
		<tr>
			<th>성명</th>
			<td><input type="text" value="<%=dto.getUsername() %>" readonly></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" value="<%=dto.getUserid() %>" readonly></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" value="<%=dto.getUserphone() %>" readonly></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" value="<%=dto.getUseremail() %>" readonly></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" value="<%=dto.getUseraddr() %>" readonly></td>
		</tr>
		<tr>
			<th id="list">내가 쓴 글 목록</th>
			<td><textarea rows="10" cols="60" style="resize:none;"></textarea></td>
		</tr>
		<tr>
			<th id="list">찜 목록</th>
			<td><textarea rows="10" cols="60" style="resize:none;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" class="function">
			<input type="button" value="수정" onclick="location.href='MainController?command=updatestart&userno=<%=dto.getUserno()%>'">
			<input type="button" value="탈퇴" onclick="location.href='MainController?command=delete&userno=<%=dto.getUserno()%>'">
			<input type="button" value="취소" onclick="location.href='main.jsp'">
			</td>
		</tr>
	</table>
<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>