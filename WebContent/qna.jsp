<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.qna.dao.QnaDao" %>
<%@ page import="com.qna.dto.QnaDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	.qna{
		text-align: center;
		position: relative;
		width:100%;
	}
	.faq{
		display: inline-block;
		width : 500px;
		height : 300px;
		margin: 10px;
	}
	.faq_type{
		display: inline-block;
		width : 100px;
		margin: 5px;
		text-align: center;
		float: left;
	}
	.faq_type tbody{
		display: inline-block;
	}
	.faq_list{
		display: inline-block;
		width : 300px;
		margin: 5px;
	}
	.faq_list tbody{
		display: inline-block;
	}
	.faq_table{
		margin: 10px 10px 0px;
		width:480px;
	}
	.qna_list{
		width : 500px;
		height : 200px;
		display: inline-block;
		margin :100px 10px 0px;
	}
	.qna_table{
		margin: 20px 10px 0px;
		width:480px;
	}
	.qna_button{
		display: in
	}
</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<% 
	QnaDao dao = new QnaDao(); 
	List<QnaDto> list = dao.selectAll();
%>
<body>
	<header><%@ include file="form/header.jsp" %></header>
	<br>
	<div class="qna">
		<div class="faq">
		<h3 align="center">F A Q</h3>
			<table class="faq_table" border="1">
				<tr>
					<th style="width:80px;">유형</th>	
					<th style="width:400px;">자주하는 질문 리스트</th>
				</tr>			
<%
	for(int i = 0; i<list.size(); i++){
%>				

				<tr>
					<td><%=list.get(i).getQatype() %></td>
					<td><a href="question_board_selectone.jsp?qano=<%=list.get(i).getQano()%>"><%=list.get(i).getQatitle() %></a></td>
				</tr>

<%
	}
%>
			</table>
		</div>
		
		<br><br><br><br>
		
		<div class="qna_list">
		<h3 align="center">Q & A</h3>
			<table class="qna_table" border="1">
				<tr>
					<th style="width:50px;">NO.</th>
					<th>제목</th>
					<th style="width:80px;">답변상태</th>
				</tr>
<%
	for(int i = 0; i<list.size(); i++){
%>				

				<tr>
					<td><%=list.get(i).getQano() %></td>
					<td><a href="question_board_selectone.jsp?qano=<%=list.get(i).getQano()%>"><%=list.get(i).getQatitle() %></a></td>
					<td><%=list.get(i).getQastatus() %></td>
				</tr>

<%
	}
%>				
			</table>
			<div style="text-align: right; width: 500px; display: inline-block;">
				<input type="button" value="1 : 1 문의" class="qna_button" onclick="location.href='MainController?command=writeform'">
			</div>
			<br>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer><%@ include file="form/footer.jsp" %></footer>
</body>
</html>