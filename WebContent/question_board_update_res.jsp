<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>    
<%response.setContentType("text/html; charset=UTF-8"); %>

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
	int res = dao.update(dto);
	
	if(res>0){
%>
	<h2>글 수정 성공</h2>
	<button onclick="location.href='question_board_selectone.jsp?qano=<%=dto.getQano() %>'">확인</button>
<%		
	}else{
%>		
	<h2>글 수정 실패</h2>
	<button onclick="location.href='question_board_update.jsp?qano=<%=dto.getQano() %>'">확인</button>
<% 	
	}
%> 



</body>
</html>