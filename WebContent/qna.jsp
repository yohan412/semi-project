<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.qna.dao.QnaDao" %>
<%@ page import="com.qna.dto.QnaDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<%
	int pageSize = 5; // 한 페이지에 출력할 레코드 수

	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	int count = 0;
	QnaDao manager = QnaDao.getInstance();
	count = manager.getCount(); // 데이터베이스에 저장된 총 갯수

	List<QnaDto> pglist = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		pglist = manager.getList(startRow, endRow);
	}
%>
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
			<tr>
				<td colspan="6" align="center">
					<%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<!-- <a href="list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	 -->
								<a href="qna.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<!--  <a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a> -->
									<a href="qna.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="qna.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
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