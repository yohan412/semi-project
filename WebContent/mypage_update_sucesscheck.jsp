<%@ page import="com.user.dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	dto.setId(id);
	
	UserDao dao = UserDao.getInstance();
	int ri = dao.updateMember(dto);
	
	if(ri == 1) {
%>    
	<script language="javascript">
		alert("회원정보가 수정되었습니다.");
		document.location.href="mypage.jsp";
	</script>
<%
	} else {
%>	
	<script language="javascript">
		alert("회원정보 수정에 실패했습니다.");
		history.go(-1);
	</script>
<%
	}
%>	   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>