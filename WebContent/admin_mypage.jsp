<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저페이지(관리자)</title>
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
			<td><input type="text" value="${userDto.username}" readonly></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" value="${userDto.userid}" readonly></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" value="${userDto.userphone}" readonly></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" value="${userDto.useremail}" readonly></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" value="${userDto.useraddr}" readonly></td>
		</tr>
		<tr>
			<th id="list">내가 쓴 글 목록</th>
			<td>
				<table border="1" width="100%" height="100px">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${!empty usedlist }">
						<c:forEach items="${usedlist}" var = "used">
							<tr>
								<td>${used.usedno }</td>
								<td><a href="usedcontroller?command=useddetail&usedno=${used.usedno}">${used.usedtitle }</a></td>
								<td>${used.usedreg }</td>
							</tr>
						</c:forEach>
						</c:when>
						</c:choose>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="function">
			<input type="button" value="수정" onclick="location.href='MainController?command=updatestart&userno=${userDto.userno}'">
			<input type="button" value="탈퇴" onclick="location.href='MainController?command=deleteinfo&userno=${userDto.userno}'">
			<input type="button" value="목록" onclick="location.href='MainController?command=adminpage&act=user'">
			</td>
		</tr>
	</table>
<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>