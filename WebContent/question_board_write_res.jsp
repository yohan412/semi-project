<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ page import="com.qna.dao.QnaDao" %>
<%@ page import="com.qna.dto.QnaDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int qano = Integer.parseInt(request.getParameter("qano"));
	String qatitle = request.getParameter("qatitle");
	String qacontent = request.getParameter("qacontent");
	
	QnaDto dto = new QnaDto();
	dto.setQano(qano);
	dto.setQatitle(qatitle);
	dto.setQacontent(qacontent);
	
	QnaDao dao = new QnaDao();
	int res = dao.insert(dto);
	
	if(res>0){
%>
	<script type="text/javascript">
		alert("글 등록 성공");
		location.href="qna.jsp";
	</script>
<%		
	}else{
%>
	<script type="text/javascript">
		alert("글 등록 실패");
		location.href="question_board_write.jsp";
	</script>
<%
	}
%>
</body>
</html>