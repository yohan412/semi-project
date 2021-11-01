<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import = "com.qna.dao.QnaDao" %>
<%@ page import = "com.qna.dto.QnaDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	int qano = Integer.parseInt(request.getParameter("qano") );
	QnaDao dao = new QnaDao();
	QnaDto dto = dao.selectOne(qano);
%>

<table border="1">
	<tr>
		<th>NO.</th>
		<td><%=dto.getQano() %></td>
	</tr>
	<tr>
		<th>제 목</th>
		<td><%=dto.getQatitle() %></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getQacontent() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="location.href='question_board_update.jsp?qano=<%=dto.getQano()%>'">수정</button>&nbsp;&nbsp;
			<button onclick="location.href='question_board_delete.jsp?qano=<%=dto.getQano()%>'">삭제</button>&nbsp;&nbsp;
			<button onclick="location.href='qna.jsp'">목록</button>&nbsp;
		</td>
	</tr>
</table>
</body>
</html>