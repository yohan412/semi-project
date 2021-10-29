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
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: #f5f6f7;
}

h5 {
	text-align: center;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}
select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
	background-size: 20px 8px;
}
.found-login{
	
	}
</style>

<script>

</script>
</head>
<body>
     <header><%@ include file="form/login_header.jsp"%></header>

     <div id="wrapper">
	      <h3>회원님의 비밀번호는 임시비밀번호로 변경되었습니다.</h3>  	
		<form action="" method="post">
			<div id="content">
				<div class = "found-login">
 		   		 	<input type="button" id="btnLogin" value="비밀번호변경" onClick="location.href='login_find_pw_change.jsp'">
 		    		<input type="button" id="btnback" value="로그인" onClick="location.href='login.jsp'"/>
       			</div>
				<br>
				<br>
			</div>
		</form>
	</div> 
     				<footer><%@ include file="form/login_footer.jsp" %></footer>
     
     
	
</body>
</html>