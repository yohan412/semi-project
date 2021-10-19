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
	th, td{
		display: block;
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
	
	#zipcode,#id,#username{
		width : 260px;
	}
	#id_chk,#zip_chk,#join{
	 	width : 80px;
	 	height : 30px;
		background-color:rgb(75, 161, 231);
		border: 1px solid gray;
		border-radius: 5px;
		cursor:pointer;
	}
	#reset{
		cursor:pointer;
	}
	#birth{
		size : 180px;
	}
	
	input[type=checkbox]{
		margin-left: 10px;
	}

	input[type="checkbox"] {
	  	width: 18px; 
  		height: 18px; 
	}
	
</style>

</head>
<body>
	<img>
	<br><br><br><br><br>
	<hr>
	<div id="wrap" align="center">
		<form action="" method="post">
			<table align="center" method="post" cellpadding="3">
				<tr>
					<th>I D</th>
					<td width="100%">
						<input type="text" id="id" placeholder="아이디를 입력하세요" required="required" autofocus>&nbsp;&nbsp;
						<input type="button" id="id_chk" value="중복 확인" onclick="">
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<input type="password" id="pw" size="20" placeholder="비밀번호를 입력하세요" required><br><br>
						<input type="password" id="pw" size="20" placeholder="비밀번호 재확인" required>
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<input type="text" id="username" size="20" placeholder="이름을 입력하세요" required>&nbsp;&nbsp;
						<select id="gender" style="width:80px;height:30px;">
							<option value="men">남자</option>
							<option value="women">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><input type="text" id="nickname" size="10" placeholder="닉네임을 입력하세요(선택)"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" id="email" size="30" placeholder="이메일을 입력하세요" required></td>
				</tr>
				<tr>
				
				<div id="birth">
					<th>Year / Month / Day</th>
					<td>
						<input type="text" id="birth_yy" placeholder="년(4자)" maxlength="4" style="width:80px;height:30px;">
						
						&nbsp;&nbsp;&nbsp;
						<select id="birth_mm" style="width:80px;height:30px;">
                            <option value="0" selected> 월 </option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
						&nbsp;&nbsp;&nbsp;
						<select id="birth_dd" style="width:80px;height:30px;">
							<option value="0" selected> 일 </option>
							<option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                            <option value="13" >13</option>
                            <option value="14" >14</option>
                            <option value="15" >15</option>
                            <option value="16" >16</option>
                            <option value="17" >17</option>
                            <option value="18" >18</option>
                            <option value="19" >19</option>
                            <option value="20" >20</option>
                            <option value="21" >21</option>
                            <option value="22" >22</option>
                            <option value="23" >23</option>
                            <option value="24" >24</option>
                            <option value="25" >25</option>
                            <option value="26" >26</option>
                            <option value="27" >27</option>
                            <option value="28" >28</option>
                            <option value="29" >29</option>
                            <option value="30" >30</option>
                            <option value="31" >31</option>
						</select>
					</td>
				</tr>
				</div>
				<tr>
					<th>Address</th>
					<td>
						<input type="text" id="zipcode" size="7" placeholder="우편번호" readonly>&nbsp;&nbsp;
						<input type="button" id="zip_chk" value="주소 검색" onclick="">
					</td>
					<td>
						<input type="text" id="address1" placeholder="주소를 입력하세요" readonly><br><br>
						<input type="text" id="address2" size="45" placeholder="상세 주소를 입력하세요">
					</td>
				</tr>
				<tr class="phone">
					<th>Phone</th>
					<td><select id="selectbox" style="width:350px;height:30px;"><option>대한민국+82</option></select></td> <br>
					<td><input type="text" placeholder="전화번호를 입력하세요" size="15" required></td>
					<td></td><td></td>
				</tr>
				<tr>
					<td style="font-size:15px;">
						<input type="checkbox" id="chkbox" required><span><a href="">서비스 이용약관 및 운영원칙</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="">개인정보 수집 이용</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox"><span><a href="">위치정보 이용약관</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox"><span><a href="">프로모션 정보 수신</a>에 동의합니다.</span>
					</td>
					<td></td><td></td>
					<br><br><br><br>
				</tr>
				
				<div>
				<tr>
					<td colspan="10">
						<input type="submit" id="join" value="가 입 하 기"  style="width:300px;height:40px;"><br><br>
						<input type="button" id="reset" value="취 소" onclick="" style="width:300px;height:40px;">
					</td>
				</tr>
				</div>
			</table>
		</form>
	</div>
</body>
</html>