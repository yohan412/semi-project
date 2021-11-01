<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 게시글 작성</title>
<style type="text/css">
h1{text-align:center;}
#wrap{
	width:80%;
	margin: 0 auto;
	text-align:center;
}
#wrap textarea{
	width:100%;
	height:60%;
	resize:none;
}
#wrap th{
	font-size:16px;
	height:50px;
}
#wrap td{
	text-align:left;
}
#wrap td input[type="text"]{
	width:100%;
	font-size:16px;
}
select {
	font-size:20px;
	width: 100px;
	height: 25px;
}
input[type=button], input[type=submit]{
	cursor:pointer;
	width:100px;
	height:30px;
	font-size:16px;
	font-weight:bold;
}
</style>
</head>
<body>
	<header><%@ include file="./form/header.jsp" %></header>
	<h1>중고거래 게시글 작성</h1>
	<div id="wrap">
	<form action="usedcontroller?command=usedwrite" method="post">
		<input type="hidden" name="logonid" value="${loginUser.userid}">
		<input type="hidden" name="logonno" value="${loginUser.userno}">
		<table width="100%">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" placeholder="제목을 입력해주세요" required></td>
			</tr>
			<tr>
				<th>판매 가격</th>
				<td><input type="text" name="price" placeholder="희망 판매가격을 입력해주세요" required></td>
			</tr>
			<tr>
				<th>글 머리</th>
				<td>
					<select name="category">
						<option value="헬스장">헬스장</option>
						<option value="요가">요가</option>
						<option value="필라테스">필라테스</option>
						<option value="크로스핏">크로스핏</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>센터 주소</th>
				<td><input type="text" name="addr" placeholder="주소를 입력해주세요" required></td>
			</tr>
			<tr>
				<th>센터명</th>
				<td><input type="text" name="centernm" placeholder="센터명을 입력해주세요" required></td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td><textarea name="content" rows="15" required></textarea></td>
			</tr>
			<tr>
				<th>사진첨부</th>
				<td>
					<input type="file" name="images" accept="image/png,image/jpeg">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;"><br><br>
					<input type="submit" value="등록">
					<input type="button" value="취소" onclick="location.href='usedcontroller?command=usedlist'">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>