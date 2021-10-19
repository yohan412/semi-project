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
*{
	margin: 0px;
	padding: 0px;
}
	
.wrap{
	width: 100%;
	height: 650px;
	display: flex;
	align-items: center;
	justify-content: center;
}



.review_title h1{
	text-align: center;
	width: 750px;
}	

.review{

	display: flex;
	position: absolute;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.grade{
	margin: 25px 340px 0px 0px;
	
}

.grade a{
	font-size: 14px;
	font-weight: bold;
	padding: 0px 10px 0px 0px;
}

.content{
	margin-top: 5px;
}

.content textarea{
	padding: 10px 10px;
}

.regist{
	margin-top: 10px;
}

.regist input{
	width: 75px;
	height: 35px;
	border-radius: 5px;
	border: none;
	font-weight: bold;

}

#submit{
	background: rgb(75, 161, 231);
	color: white;

}

#close{
	background: grey;
	color: white;
}
</style>
</head>
<body>

	<header><%@ include file="form\header.jsp" %></header>
	
	<form action="" method="post">
	<div class="wrap">
	<div class="review">
	<div class="review_title">
		<h1>Review 작성</h1>
		<br>
		<hr>
	</div>
	
	<div class="grade">
		<a>별점:</a>
		<img src="img\img1.png" width="100px" height="25px">
	</div>
	
	<div class="content">
		<textarea rows="17" cols="70" placeholder="후기를 작성해주세요."></textarea>
	</div>
	
	<div class="regist">
		<input type="submit" value="등 록" id="submit">&nbsp;&nbsp;
		<input type="button" value="닫 기" id="close" onclick="">
	</div>
	</div>
	</div>
	</form>
	
	<footer><%@ include file="form\footer.jsp" %></footer>	
</body>
</html>