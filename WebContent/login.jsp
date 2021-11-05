<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="./js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function(res) {
        alert('success: ' + JSON.stringify(res))
      },
      fail: function(err) {
        alert('fail: ' + JSON.stringify(err))
      },
    })
  }
</script>
<script type="text/javascript">
Kakao.init('1b471de92ae8dad2d4bedd8c3a06ea59');
console.log(Kakao.isInitialized());
 
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(result) {
          $('#result').append(result);
          id = result.id
          connected_at = result.connected_at
          kakao_account = result.kakao_account
          $('#result').append(kakao_account);
          resultdiv="<h2>로그인 성공 !!"
          resultdiv += '<h4>id: '+id+'<h4>'
          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
          email ="";
          gender = "";
          if(typeof kakao_account != 'undefined'){
        	  email = kakao_account.email;
        	  gender = kakao_account.gender;
          }
          resultdiv += '<h4>email: '+email+'<h4>'
          resultdiv += '<h4>gender: '+gender+'<h4>'
          $('#result').append(resultdiv);
          
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
</head>
<body>

	<header></header>
	
	<form action="usercontroller?command=login" method="post">
	<div class="wrap">
		<div class="login">
		
			<div class="logo">
				<a href="main.jsp"><img src="./img/logo.png" width="239" height="114"></a>
			</div>
			<div class="login_id">
				<input type="text" name="user_id" placeholder="아이디">
				
			</div>
			<div class="login_pw">
				<input type="password" name="user_pw" placeholder="비밀번호">
			</div>
			
			<div class="register">
				<a href="usercontroller?command=registform">회원가입</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="usercontroller?command=findidform">아이디 찾기</a>
				&nbsp;&nbsp;
				<a href="usercontroller?command=findpwform">비밀번호 찾기</a>
			</div>
			
			<div class="submit">
			<input type="submit" value="로그인">
			</div>
			
			<div class="sns_login">
				<a id="kakao-login-btn" href="javascript:kakaoLogin();"><img src="./img/login_kakao.png" width="250" height="40px"></a>
				<%
				    String clientId = "R52cjVAcV9TOlMU10ITC";//애플리케이션 클라이언트 아이디값";
				    String redirectURI = URLEncoder.encode("http://localhost:8787/Semiproject/callback.jsp", "UTF-8");
				    SecureRandom random = new SecureRandom();
				    String state = new BigInteger(130, random).toString();
				    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				    apiURL += "&client_id=" + clientId;
				    apiURL += "&redirect_uri=" + redirectURI;
				    apiURL += "&state=" + state;
				    session.setAttribute("state", state);
				 %>
				<a href="<%=apiURL%>"><img src="./img/login_naver.png" width="250" height="40px"></a>

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