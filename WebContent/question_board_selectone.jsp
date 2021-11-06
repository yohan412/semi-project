<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import = "com.qna.dao.QnaDao" %>
<%@ page import = "com.qna.dto.QnaDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	
	int qano = Integer.parseInt(request.getParameter("qano"));
	String qatitle = request.getParameter("qatitle");
	String qacontent = request.getParameter("qacontent");
	
	
	QnaDao dao = new QnaDao();
	QnaDto dto = dao.selectOne(qano);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#content{
		resize:none;
	}
	#submit, #reset,#reply{
		cursor:pointer;
	}
	#submit,#reply{
		width : 80px;
	 	height : 30px;
		background-color:rgb(75, 161, 231);
		border: 1px solid gray;
		border-radius: 5px;
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
<header><%@ include file="form/header.jsp" %></header>
<body>

<h2 align="center">1 : 1 문의</h2>

<div id="wrap">
	<form action="MainController" method="post">
		<input type="hidden" name="command" value="boardupdate">
		<input type="hidden" name="qano" value="<%=dto.getQano() %>"> 
		<input type="hidden" id="qa_type" value="<%=dto.getQatype() %>"> 
		<input type="hidden" id="userid" value="<%=dto.getUserid() %>">
		<input type="hidden" id="userno" value="<%=dto.getUserno() %>">
		<input type="hidden" id="session_id" value="<%=loginUser.getUserid()%>">
		
		<table>
			<tr id="title">
				<th>제 목</th>
				<td>					
					<input type="text" name="qatitle" maxlength="30" value="<%=dto.getQatitle()%>" readonly="readonly">
				</td>
			</tr>
			<tr id="content">
				<th>내 용</th>
				<td><textarea rows="10" cols="60" name="qacontent" readonly="readonly"><%=dto.getQacontent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" id="submit" onclick="location.href='question_board_update.jsp?qano=<%=dto.getQano()%>'">수정</button>&nbsp;&nbsp;
					<button type="button" id="reset"  onclick="del_btn('<%=dto.getQano()%>');">삭제</button>&nbsp;&nbsp;
					<button id="reset"  onclick="location.href='qna.jsp'">목록</button>&nbsp;&nbsp;
					<button type="button" id="reply" onclick="location.href='question_board_answerwrite.jsp?qano=<%=dto.getQano()%>'">답글</button>
				</td>
			</tr>
		</table>	
	</form>
</div>
<div>
		<footer><%@ include file = "form/footer.jsp" %></footer>
</div>		
</body>
<script>
	
	$(function(){
		var userno = $('#userid').val();
		console.log(userno);
	)}
	function del_btn(qano){
		if (confirm("삭제하시겠습니까?") == true){    //확인
			location.href="question_board_delete.jsp?qano="+qano;
		}else{   //취소
		    return;
		}
	}
	
	
</script>
</html>