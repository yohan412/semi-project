<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
<style type="text/css">
	body{
		margin : 0 auto;
		width : 100%;
	}
	header{
      position:absolute;
      left: 0;
      top:0;
      width: 8%;
   }
   footer{
      position:absolute;
      left: 0;
      bottom:0;
      width: 100%;
   }

	.button1{
		background-color : gray;
		color : white;
	}
	.button2{
		background-color : #00AAFF;
		color : white;
		width: 230px;
		
	}
	#wrapper{
		position: absolute;
		width: 100%;
		top: 20%;
		left:0;
		text-align: center;
	}
</style>

</head>
<body>
	<header><%@ include file = "form/login_header.jsp" %></header>
	<form action="password_find" action="" method="">
	<div id = "wrapper">
	
	
	<h5>가입시 입력하셨던 이메일 주소를 작성해주세요. <br>
	입력하신 이메일 주소로 인증번호를 발송해 드립니다.</h5>
			<br>
			
			<div class="USER_ID">ID</div><p>
			<input name ="username" type="text" placeholder="아이디를 입력하세요" style="width:225px">
			<br>
			<div class="USER_BIRTH DATE">생년월일</div><p>
			<select name="year" style="width:70px">
					<option value="00">년도</option>
					<option value="01">1990</option>
					<option value="02">1991</option>
					<option value="03">1992</option>
					<option value="04">1993</option>
					<option value="05">1994</option>
					<option value="06">1995</option>
					<option value="07">1996</option>
					<option value="08">1997</option>
					<option value="09">1998</option>
					<option value="10">1999</option>
					<option value="11">2000</option>
					<option value="12">2001</option>
					<option value="13">2002</option>
					<option value="14">2003</option>
					<option value="15">2004</option>
					<option value="16">2005</option>
					<option value="17">2006</option>
					<option value="18">2007</option>
					<option value="19">2008</option>
					<option value="20">2009</option>
					<option value="21">2010</option>
					<option value="22">2011</option>
					<option value="23">2012</option>
					<option value="24">2013</option>
					<option value="25">2014</option>
					<option value="26">2015</option>
					<option value="27">2016</option>
					<option value="28">2017</option>
					<option value="29">2018</option>
					<option value="30">2019</option>
					<option value="31">2020</option>
					<option value="32">2021</option>
			</select> 
			<select name="birthmm"style="width:70px">
					<option value="00">월</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			</select> 
			<select name="day"style="width:70px">
					<option value="00">일</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
			</select>
			<br><br>
			<div id="USER_PHONE">휴대전화번호</div>
			<br>
			<select name="contury" style="width:230px">
					<option value="00">대한민국 +82</option>
					<option value="01">미국 +1</option>
					<option value="02">독일 +49</option>
					<option value="03">호주 +61</option>
					<option value="04">영국 +44</option>
			</select> 
			<br>
			<input type="text" name="id" maxlength="50" placeholder="전화번호 입력" style="width:225px">
			<br>
			<input type="text" name="id" maxlength="50" placeholder="인증번호 6자리" style="width:120px">
		    <input type="button" value="인증번호 받기" class="button1">

			<br><br>
		   	<div id="USER_EMAIL">E-mail</div>
			<br>
			<input type="email" maxlength="30" placeholder="이메일 주소 입력" style="width:230px">
			<br><br>
			<input type="button" value="확인" class="button2">	
	
	
	<footer><%@ include file = "form/login_footer.jsp" %></footer>
	</form>
	</div>
</body>
</html>