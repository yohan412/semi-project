<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	Member m = (Member)session.getAttribute("loginUser");
	
	String USER_NAME = m.getUser_NAME();	
	String USER_ID = m.getUser_ID();
	String USER_PHONE = m.getUSER_PHONE() !=null ? m.getUSER_PHONE() : "";
	String USER_EMAIL = m.getUSER_EMAIL() !=null ? m.getUSER_EMAIL() : "";
	String USER_ADDR = m.getUSER_ADDR();
%>    
ddd-->
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
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
	<form action ="" method="post">
	<table class="mylist">
		<col width="150px"><col width="300px">
		<tr>
			<th>성명</th>
			<td><input type="text" id="USER_NAME" readonly></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="USER_ID" readonly></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="tel" placeholder="전화번호를 입력해주세요" 
				id="USER_PHONE" value="<%= USER_PHONE %>">
					
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" placeholder="ex)kh@naver.com" id="USER_EMAIL"
				value="<%= USER_EMAIL %>">
				
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" placeholder="주소를 입력해주세요" id="USER_ADDR"
				value="<%= USER_ADDR %>"
				>
				
				</td>
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
			<input type="submit" value="수정" onclick="location.href='<%=request.getContextPath() %>/myPage.me'">
			<input type="button" value="탈퇴" onclick="">
			<input type="button" value="취소" onclick="">
			</td>
		</tr>
	</table>
	</form>		
<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>