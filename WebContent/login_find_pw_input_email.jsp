
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

import com.user.controller.*;

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
<script type="text/javascript">

</script>   
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
.in-line{
      width:100%;
      height:40px;
      display: table;
    }
    input{
      margin:0;
    }
    input[type="text"]{
      width:70%;
      height:100%;
      border:black;
      font-size:1em;
      padding-left: 5px;
      font-style: oblique;
      display:inline;
      outline-clolor : black;
      box-sizing: border-box;
      font-size:1.2em;
      

    }
    input[type=button]{
      width: 30%;
      height:100%;
      background-color: lightgray;
      border:black;
      background-color: white;
      font-size:1em;
      outline-clolor : blue;
      display:inline;
      margin-left: -10px;
      box-sizing: border-box;
      font-size:1em;
      
    }
    input[type=button]:hover{
      background-color: lightgray;
    }
	input[type='button']:hover{
	background-color:lightgray;
}
.btn_area {
	margin: 30px 0 91px;
}
.button1 {
	background-color: gray;
	color: white;
	border: 3px solid white;
	padding: 18px 0 15px;
	
	font-size:13px;
	width: 100%;	
}
.button2 {
	background-color: gray;
	color: white;
	border: 3px solid white;
	padding: 18px 0 15px;
	
	font-size:13px;
	width: 100%;	
}
#button1 {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: white;
	background-color: #00AAFF;
	font-size: 20px;
	font-weight: 200;
}
</style>

</head>
<body>
	<header><%@ include file="form/login_header.jsp"%></header>
	<div id="wrapper">
		<h5>
			Step3. 가입시 입력하셨던 이메일을 입력해주세요. <br>
		</h5>
    
	<form method="post" action="/mailSending.do">
		<div id="content">
			<h3 class="join_title">
					<label for="USER_EMAIL">E-Mail</label>
			</h3>
			<div class="mail_check_wrap"> 
			<div class="in-line" id="mail_check_input_box_false">
				<input type="text" id="user_email"class="user_email" maxlength="100" placeholder="이메일 주소 입력" required>
				<input type="submit" value = "임시번호 보내기" ">
			</div>
			</div>
			<br><br><br>
			<div class="btn_area">
			  <input type ="button" name ="" id="email_send" value = "확인"> 
			</div>			
		</div>
	</form>				 						 	
	</div>		
		<footer><%@ include file = "form/footer.jsp" %></footer>
	
</body>
</html>