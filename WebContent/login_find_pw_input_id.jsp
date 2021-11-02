<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
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
#button {
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
<script type="text/javascript">

	</script>
</head>
<body>
	<header><%@ include file="form/login_header.jsp"%></header>
	
	<div id="wrapper">
		<h5>
			Step1. ID와 생년월일을 입력해주세요. <br>
		</h5>
	<form name="find_pw_id" action="login_find_pw_input_phone.jsp" id="form_login" method="post" onsubmit="CheckForm();">
		<div id="content">
		
			<div>
				<h3 class="join_title">
					<label for="USER_ID">ID</label>
				</h3>
				<div>
					<input type="text" id="findId" name="USER_ID" maxlength="20" required> 
					<div class="check_font" id="id_check"></div>
				</div>
			</div>			
			<br>
			<br>
			<div>
				<h3 class="join_title">
					<label for="USER_BIRTH DATE">생년월일</label>
				</h3>

				<div id="USER_BIRTH DATE_wrap">
					<div id="bir_yy">
						<span class="box"> 
						<select id="yy" class="sel">
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
						</span>
					</div>

					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel">
								<option>월</option>
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
						</span>
					</div>
					<div id="bir_dd">
						<span class="box"> <select id="dd" class="sel">
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
						</span>
					</div>

			</form>
				</div>
			</div>
			<br>
			<br>
			<div class="btn_area">
				 <input type ="submit" id="NEXT_button" value = "확인" 
				onClick="checkForm();")> 
						 <!-- 임시암호 보여지는 화면 -->
			</div>
		</div>

	</div>
	
		<footer><%@ include file = "form/footer.jsp" %></footer>
	
</body>
</html>