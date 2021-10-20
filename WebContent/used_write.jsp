<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양도 게시글 작성</title>
<style type="text/css">
h1{text-align:center;}
#wrap{
	width:80%;
	margin: 0 auto;
	text-align:center;
}
#wrap textarea{
	width:95%;
	height:60%;
	resize:none;
	margin-left:5%;
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

input[type=button], input[type=submit]{
	width:100px;
	height:30px;
	font-size:16px;
	font-weight:bold;
}
</style>
</head>
<body>
	<header><%@ include file="./form/header.jsp" %></header>
	<h1>양도 게시글 작성</h1>
	<div id="wrap">
	<form action="" method="post">
		<table width="100%">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" placeholder="내용을 입력해주세요" required></td>
			</tr>
			<tr>
				<th>판매 가격</th>
				<td><input type="text" name="price" placeholder="희망 판매가격을 입력해주세요" required></td>
			</tr>
			<tr>
				<th>글 머리</th>
				<td>
					<label><input type="checkbox" name="gym" value="gym" checked>헬스</label>
					<label><input type="checkbox" name="pilates" value="pilates">필라테스</label>
					<label><input type="checkbox" name="yoga" value="yoga">요가</label>
					<label><input type="checkbox" name="etc" value="etc">기타</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="20">&#10;&#10; 사업자명:&#10;&#10; 주소:&#10;&#10; 회원권 기간별 가격등록:&#10;&#10; 나머지 관련정보:</textarea>
				</td>
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
					<input type="button" value="취소">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>