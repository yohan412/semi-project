<%@page import="com.wish.dto.WishDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import ="com.user.dto.UserDto" %>
<%@page import="com.used.dto.UsedDto"%>
<%@page import="java.util.List"%>
<%@page import="com.wish.dto.WishDto" %>
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
<% List<UsedDto> mypagelist = (List<UsedDto>)request.getAttribute("mypagelist"); %>
<% List<WishDto> mywish = (List<WishDto>)request.getAttribute("mywish"); %>
<h2 class="information">마이 페이지</h2>
	<hr>
	<table class="mylist">
		<col width="150px"><col width="300px">
		<tr>
			<th>성명</th>
			<td><input type="text" value="<%=loginUser.getUsername() %>" readonly></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" value="<%=loginUser.getUserid() %>" readonly></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" value="<%=loginUser.getUserphone() %>" readonly></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" value="<%=loginUser.getUseremail() %>" readonly></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" value="<%=loginUser.getUseraddr() %>" readonly></td>
		</tr>
		<tr>
			<th id="list">내가 쓴 글 목록</th>
			<td>
				<table border="1" width="100%" height="100px">
					<thead>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mypagelist}" var = "writer">
						<c:if test="${writer.userno eq loginUser.userno }">
							<tr>
								<td>${writer.usedno }</td>
								<td>${writer.userid }</td>
								<td><a href="used_list.jsp">${writer.usedtitle }</a></td>
								<td>${writer.usedcontent }</td> 
								<td>${writer.usedreg }</td>
							</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
			</td>
		</tr>
		 <tr>
			<th id="list">찜 목록</th>
			<td>
				<table border="1" width="100%" height="100px">
				<thead>
					<tr>
						<th>로그인ID</th>
						<th>회원권 제목</th>
						<th>회원권 작성자</th>
						<th>회원권 센터이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mywish }" var="wish">
					<tr>
						<td>${wish.loginid }</td>
						<td><a href="usedcontroller?command=useddetail&usedno=${wish.usedno}">${wish.usedtitle }</a></td>
						<td>${wish.userid }</td>
						<td>${wish.usercenternm }</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
			</td>
		</tr> 
		<tr>
			<td colspan="2" class="function">
			<input type="button" value="수정" onclick="location.href='MainController?command=updatestart&userno=<%=loginUser.getUserno()%>'">
			<input type="button" value="탈퇴" onclick="location.href='MainController?command=deleteinfo&userno=<%=loginUser.getUserno()%>'">
			<input type="button" value="취소" onclick="location.href='main.jsp'">
			</td>
		</tr>
	</table>
<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>