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
<script>
$('#sendUSER_PHONE').click(function(){    // 'sendUSER_PHONE'라는 id를 가진 버튼 클릭 시 실행.
    let phoneNumber = $('#inputUSER_PHONE').val();
    Swal.fire('인증번호 발송 완료!')
    
    $.ajax({
        type: "post",
        url: "/src/user.controller.java",
        data: {
            "USER_PHONE" : "USER_PHONE"
        },
        success: function(res){
            $('#checkBtn').click(function(){
                if($.trim(res)
                		==$('#inputCertifiedNumber').val()){
                    Swal.fire(
                        '인증성공!',
                        '휴대폰 인증이 정상적으로 완료되었습니다.',
                        'success'
                    )

                    $.ajax({
                        type: "GET", // HTTP method type(GET, POST) 형식이다.
                        url: "/update/phone", // 컨트롤러에서 대기중인 URL 주소이다. //여기에 뭘써야 하는데 모르겠음 ㅠㅠ
                        data: {	// Json 형식의 데이터이다.
                            "USER_PHONE" : $('#inputPhoneNumber').val()
                        }
                    })
                    document.location.href="/WebContetnt/login.jsp";
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: '인증오류',
                        text: '인증번호가 올바르지 않습니다!',
                        footer: '<a href="WebContent/login.jsp">다음에 인증하기</a>'
                    })
                }
            })


        }
    })
});
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
<script type="text/javascript" src="WebContent/js/findinfo.js">
</script>
</head>
<body>
	<header><%@ include file="form/login_header.jsp"%></header>
	<div id="wrapper">
		<h5>
			가입시 입력하셨던 핸드폰번호를 입력해주세요. <br>
		</h5>
	<form action="login_find_pw_tjdrhd.jsp" id="form_login"name="find_pw_email" onsubmit="CheckForm(); method="post">
		<div id="content">
			<h3 class="join_title">
					<label for="USER_EMAIL">E-Mail</label>
			</h3>
			<div class="in-line">
				<input type="text" id="email"class="int" maxlength="100" placeholder="이메일 주소 입력" required>
				<input type="button" id = "sendEmail" value="임시번호 발송">
			</div>
			<br><br><br>
			<div class="btn_area">
			  <input type ="submit" id="button1" value = "확인" onClick="checkForm();")> 
			</div>			
		</div>
	</form>				 						 	
	</div>		
		<footer><%@ include file = "form/footer.jsp" %></footer>
	
</body>
</html>