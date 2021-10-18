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
	.used_ask{
		text-align: center;
	}
	.text_area{
		display:inline-block;
		width: 400px;
		margin: 10px;
	}
	.text_area input{
		position: relative;
	}
	.text_area a{
		position: relative;
	}
	.button{
		width: 60px;
		height: 30px;
	}
</style>
</head>
<body>
	<div class="used_ask">
		<div class="text_area">
			<div style="text-align: left; margin-left: 15px;">
				<a>구매문의</a>
			</div>
			<br>
			<textarea rows="15" cols="50" placeholder="문의 내용을 입력해주세요"></textarea>
			<br>
			<div style="text-align: right; margin-right: 15px;">
				<input type="button" value="입력">
			</div>
		</div>
		<br><br>
		<div>
			<input type="button" value="목록" class="button">
		</div>
	</div>
</body>
</html>