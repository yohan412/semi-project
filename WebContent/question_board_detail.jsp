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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	table{
		text-align: center;
		border-collapse: separate;
  		border-spacing: 0 15px;
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
	#wrap{
		display: flex;
  		justify-content: center;
	}
	#submit, #reset{
		cursor:pointer;
	}
	#reset{
		width : 80px;
	 	height : 30px;
		background-color:#d1d1d1;
		border: 1px solid gray;
		border-radius: 5px;
	}
</style>
</head>
<body>
<%	
	int qano = Integer.parseInt(request.getParameter("qano") );
	QnaDao dao = new QnaDao();
	QnaDto dto = dao.selectOne(qano);
%>
<h2 align="center">1 : 1 문의</h2>
<div id="wrap">
	<form action="MainController" method="post">
		<input type="hidden" name="qano" value="<%=dto.getQano() %>">
		<input type="hidden" name="qatitle" value="<%=dto.getQatitle() %>">
		<input type="hidden" name="qacontent" value="<%=dto.getQacontent() %>">
		<table>
			<tr id="title">
				<th>제 목</th>	
					<td><%=dto.getQatitle() %><td>
			</tr>
			<tr id="content">
				<th>내 용</th>
				<td><textarea rows="15" cols="50" readonly="readonly" resize="none"><%=dto.getQacontent() %></textarea></td>
			</tr>
			<tr>
		<td colspan="2">
			<button onclick="location.href='question_board_update.jsp?qano=<%=dto.getQano()%>'">수정</button>&nbsp;&nbsp;
			<button onclick="location.href='question_board_delete.jsp?qano=<%=dto.getQano()%>'">삭제</button>&nbsp;&nbsp;
			<button onclick="location.href='qna.jsp'">목록</button>&nbsp;
		</td>
	</tr>
</table>	
</form>
</div>
<footer><%@ include file = "form/footer.jsp" %></footer>
</body>
</html>