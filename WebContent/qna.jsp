<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.qna.dao.QnaDao" %>
<%@ page import="com.qna.dto.QnaDto" %>
<%@ page import="java.util.List" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	.tabs{
		list-style-type:none;
		height : 30px;
		padding : 0;
		margin :0;
	}
	.tabs li{
		float : left;
		position: relative;
		padding : 0;
		line-height:30px;
	}
	.tabs li a {
		font-weight : bold;
		padding: 5px 25px;
	}
	ul{ list-style : none;}
	.category>ul>li>a{
		display : block;
		width : 100%;
		height : 100%;
		font-size : 13px;
		text-align : center;
	}
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
	td, a, a:hover{
		color:#000000;
		text-decoration:none;
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
function login_chk(){
	if(${loginUser==null}){
		if(confirm("로그인이 필요한 작업입니다.\n 로그인 하시겠습니까?")){
			location.href="login.jsp"
		}else{
				
		}
	} else{
		location.href="MainController?command=writeform";
	}
}
</script>
</head>
<% 
	String qatype = request.getParameter("qatype");
	QnaDao dao = new QnaDao(); 
	List<QnaDto> list = dao.selectAll();
	//List<QnaDto> typelist = dao.selectType(qatype);
	List<QnaDto> faqlist = dao.selectFaq();
	
	String seid = request.getParameter("seid");

	System.out.println(seid);
%>
<body>

	<header><%@ include file="form/header.jsp" %></header>
	<br>
	<div class="qna">
		<div class="faq">
		<h3 align="center">F A Q</h3>

			<div name="qna_category" id="tab_container" style="width:97%; padding:10px 10px 10px 10px;">
				<ul class="tabs" onchange="sort_by_category()">
				<!-- 탭 메뉴 영역 -->
					<li><a href="MainController?command=qna">전체</a></li>
					<li><a href="MainController?command=getlist&qatype=1">가격</a></li>
					<li><a href="MainController?command=getlist&qatype=2">거래</a></li>
					<li><a href="MainController?command=getlist&qatype=3">시설</a></li>
					<li><a href="MainController?command=getlist&qatype=4">기타</a></li>
				</ul>	
				
				<!-- 탭 콘텐츠 영역 -->
					<div class="tab_container">
						<div id="price" class="tab_container""></div>	
					</div>	
					<div class="tab_container">
						<div id="deal" class="tab_container"></div>	
					</div>
					<div class="tab_container">
						<div id="center" class="tab_container"></div>	
					</div>
					<div class="tab_container">
						<div id="etc" class="tab_container"></div>	
					</div>
			</div>

			<table class="faq_table" border="1">
				<tr>
					<th style="width:80px;">유형</th>	
					<th style="width:400px;">자주하는 질문</th>
				</tr>	
				<tr>
				<%
					for(int i = 0; i<faqlist.size(); i++){
				%>				

				<tr>
					<c:if test="${userid eq QnaDto.userid }">
						<td><%=faqlist.get(i).getQatype()%></td>
						<td><a href="question_board_selectone.jsp?qano=<%=faqlist.get(i).getQano()%>"><%=faqlist.get(i).getQatitle() %></a></td>
					</c:if>
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
					<th style="width:70px;">답변여부</th>
				</tr>
<%
	for(int i = 0; i<list.size(); i++){
%>				

				<tr>
					<td><%=list.get(i).getQano() %></td>
					<td><a href="question_board_selectone.jsp?qano=<%=list.get(i).getQano()%>&userid=<%=list.get(i).getUserid() %>&seid=<%=seid%>"><%=list.get(i).getQatitle() %></a></td>
					<td><%=list.get(i).getQastatus() %></td>
				</tr>

<%
	}
%>			
			</table>
			<div style="text-align: right; width: 500px; display: inline-block;">
				<input type="button" value="1 : 1 문의" class="qna_button" onclick="login_chk();">
			</div>
			<br>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer><%@ include file="form/footer.jsp" %></footer>
</body>
</html>