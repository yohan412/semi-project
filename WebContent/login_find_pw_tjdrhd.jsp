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
	{
		left: 0;
		top: 30%;
		width:100%;
		text-align: center;
		margin-top: 70px;
		margin-bottom: 50px;
	}
	.text{
		left: 0;
		top: 50%;
		width:100%;
		text-align: center;
	}
	.button{
		left: 0;
		top: 70%;
		width:100%;
		text-align: center;
		margin-bottom: 70px;
	}
	.text input{
		width:200px;
		height:40px;
	}
	.button input{
		width: 170px;
		height: 40px;
		font-size: 20px;
	}
	input{
		margin: 5px;
	}
</style>

<script>

</script>
</head>
<
<body>
      <div class = "container">

      <%
       if (pwd != null) {
      %>
      
      	<div class = "found-success"> 
	      <h4>회원님의 비밀번호는 </h4>  
	      <div class ="found-id"> <%=pwd%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="비밀번호변경" onClick="location.href='login_find_pw_change.jsp'">
       	</div>
       </div>
      <%
  		} else {
 		%>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="비밀번호 다시 찾기" onClick="location.href='login_find_pw_input.jsp'"/>
 		    <input type="button" id="btnjoin" value="" onClick="location.href='login_find_pw_change.jsp'"/>
       	</div>
 
     
		<footer><%@ include file="form/login_footer.jsp" %></footer>
	      </div>
	
</body>
</html>