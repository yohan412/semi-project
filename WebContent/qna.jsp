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
		top:20%;
		width:99%;
		margin: 0 auto;
		
	}
	.faq{
		display: inline-block;
		width : 500px;
		height : 300px;
		margin: 10px;
		border : 1px solid black;
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
	.qna_list{
		width : 500px;
		height : 200px;
		display: inline-block;
		border : 1px solid black;
	}
	.qna_table{
		margin: 10px;
		width:480px;
	}
	.qna_button{
		display: in
	}
</style>
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
			<table class="faq_type">
				<tr>
					<th>유형</th>	
				</tr>
				<div style="overflow: auto;">
					<tr>
					
					</tr>
				</div>
			</table>
			<table class="faq_list">
				<tr>
					<th>자주하는 질문 리스트</th>
				</tr>
				<div style="overflow: auto;">
					<tr>
					
					</tr>			
				</div>	
			</table>
		</div>
		<br>
		<div class="qna_list">
			<table class="qna_table" border="1">
				<tr>
					<th style="width:50px;">NO.</th>
					<th>제목</th>
					<th style="width:50px;">답변상태</th>
				</tr>
<%
	for(int i = 0; i<list.size(); i++){
%>				
				<div style="overflow: auto;">
					<tr>
						<td><%=list.get(i).getQano() %></td>
						<td><a href="question_board_selectone.jsp?qano=<%=list.get(i).getQano()%>"><%=list.get(i).getQatitle() %></a></td>
						<td><%=list.get(i).getQacontent() %></td>
					</tr>
				</div>
<%
	}
%>				
			</table>
		</div>
		<br>
		<div style="text-align: right; width: 500px; display: inline-block; position:relative;">
			<input type="button" value="1대1 문의" class="qna_button" onclick="location.href='MainController?command=writeform'">
		</div>
	</div>
	<br><br>
	<footer><%@ include file="form/footer.jsp" %></footer>
</body>
</html>