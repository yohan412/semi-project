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

a{
	text-decoration: none;
	color: black;
	font-weight: bold;
}

.wrap{
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.login{
	width: 400px;
	height: 530px;
	display: flex;
	position: absolute;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	border: 1px solid grey;
	border-radius: 30px;
	text-align: center;
	margin-bottom: 20px;

}

.logo{
	align-items: center;
}

.login_id{
	margin-top: 30px;
	align-items: center;

}

.login_id input{
	width: 300px;
	height: 35px;
	padding: 0px 15px;
	border-radius: 5px;
	border: 1px solid lightgrey;
}

.login_pw{
	margin-top: 20px;
	align-items: center;
}

.login_pw input{
	width: 300px;
	height: 35px;
	padding: 0px 15px;
	border-radius: 5px;
	border: 1px solid lightgrey;
}

.register{
	margin-top: 15px;
	align-items: center;
	font-size: 0.8em;
}

.submit{
	margin-top: 20px;
}

.submit input{
	width: 300px;
	height: 40px;
	border: 0;
	background: grey;
	color: white;
	border-radius: 7px;
}

.sns_login{
	margin-top: 20px;	
	text-align : center;

}

.sns_login img{ 
	margin-top: 10px;
}
footer{
		position:absolute;
		left: 0;
		bottom:0;
		width: 100%;
}

</style>
</head>
<body>

	<header></header>
	
	<form action="usercontroller?command=login" method="post">
	<div class="wrap">
		<div class="login">
		
			<div class="logo">
				<img src="./img/tmp_image.png" width="300" height="60">
			</div>
			<div class="login_id">
				<input type="text" name="user_id" placeholder="아이디">
				
			</div>
			<div class="login_pw">
				<input type="password" name="user_pw" placeholder="비밀번호">
			</div>
			
			<div class="register">
				<a href="">회원가입</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="">아이디·비밀번호 찾기</a>
			</div>
			
			<div class="submit">
			<input type="submit" value="로그인">
			</div>
			
			<div class="sns_login">
				<a href=""><img src="./img/login_kakao.png" width="250" height="40px"></a>
				<a href=""><img src="./img/login_naver.png" width="250" height="40px"></a>
			</div>
		</div>
		
		<div class="push">
		
		</div>
	</div>
	</div>
	</form>
	
	<footer><%@ include file="form\login_footer.jsp" %></footer>	
	
</body>
</html>