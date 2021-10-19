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
<h2 align="center">1 : 1 문의</h2>
<div id="wrap">
	<form action="" method="post">
		<table>
			<tr id="title">
				<th>제 목</th>
				<td>
					<select id="category" style="width:80px;height:30px;">
							<option value="cost">가격</option>
							<option value="deal">거래</option>
							<option value="center">시설</option>
							<option value="etc">기타</option>
					</select>
					<input type="text" placeholder="제목을 입력하세요" maxlength="30">
				</td>
			</tr>
			<tr id="content">
				<th>내 용</th>
				<td><textarea rows="10" cols="60" placeholder="내용을 입력하세요"></textarea></td>
			</tr>
			<tr id="photo">
				<th>사진 첨부</th>
				<td align="left"><input type="button" value="파일 선택" onclick=""></td>
			</tr>
		</table>
		<br>
		<div align="center">
				<input type="submit" id="submit" value="수정 완료">
				<input type="button" id="reset" value="취 소" onclick="">
		</div>		
	</form>
</div>
</body>
</html>