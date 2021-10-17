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
	.qna{
		text-align: center;
	}
	.faq{
		display: inline-block;
	}
	.faq_type{
		float: left;
	}
	.faq_list{
		float: right;
	}
	.qna_list{
		display: inline-block;
	}
</style>
</head>
<body>
	<header><%@ include file="form/header.jsp" %></header>
	<div class="qna">
		<div class="faq" >
			<table class="faq_type">
				<tr>
					<th>유형</th>	
				</tr>
				<tr>
				</tr>
			</table>
			<table class="faq_list">
				<tr>
					<th>자주하는 질문 리스트</th>
				</tr>
				<tr>
				</tr>			
			</table>
		</div>
		<br>
		<div class="qna_list">
			<table>
				<tr>
					<th>NO.</th>
					<th>제목</th>
					<th>답변상태</th>
				</tr>
			</table>
		</div>
	</div>
	<footer><%@ include file="form/footer.jsp" %></footer>
</body>
</html>