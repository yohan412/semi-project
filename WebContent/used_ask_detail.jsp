<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 구매문의</title>
<style type="text/css">
	.used_ask{
		text-align: center;
	}
	.text_area,#replyboard,#replywrite,#answerwrite{
		display:inline-block;
		width: 400px;
	}
	.text_area input{
		position: relative;
	}
	.text_area a{
		position: relative;
	}
	.button{
		width: 60px;
		height: 30px;
		margin-top:10px;
		font-weight:bold;
	}
	input[name=title]{
		width:98%;
	}
	th{
		font-size:13px;
	}
	.answer_form{
		width:100%;
		border:1px solid black;
	}
	#answerboard{
		margin-top:10px;
		width:100%;
		border:1px solid black;
		text-align:left;
	}
	.answerdiv{
		width:90%;
		margin-left:10px;
		margin-bottom:10px;
	}
	.answercont{
		margin-top:10px;
		border:1px solid black;
	}
	.answer_form h3{
		margin-left:10px;
	}
	.answer_form input[type=submit]{
		margin-left:300px;	
	}
</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		<c:choose>
		<c:when test="${!empty anslist}">
		<c:forEach items="${anslist}" var="ans">
			$("#answerboard").append(
					"<div class='answerdiv'>"
					+"<span>${ans.userid}<span>"
					+"<div class='answercont'>${ans.uskcontent}</div>"
					+"</div>"
			
			);			
		</c:forEach>
		</c:when>
		</c:choose>
	});
	
	function reload(){
		window.opener.location.reload();
		window.close();
	}
	
	function answer_write(){
		
		//form 태그를 추가한다
		$("#answerwrite").append(
				"<div class='answer_form'>"
				+"<h3 align='left'>답변하기</h3>"
				+"<form action='usedcontroller?command=askanswer' method='post'>"
				+"<input type='hidden' name='writer' value='${writer}'>"
				+"<input type='hidden' name='uskno' value='${uskdto.uskno}'>"
				+"<input type='hidden' name='title' value='[RE:]${uskdto.usktitle}'>"
				+"<textarea name='content' rows='5' cols='50' placeholder='내용을 입력해주세요' style='resize:none;' autofocus='autofocus'></textarea>"
				+"<input type='submit' value='등록' class='button'><br><br>"
				+"</form>"
				+"</div>"
		);
		$(".answer_form textarea").focus();
	}
</script>

</head>
<body>
	<div class="used_ask">
		<div class="text_area">
			<div style="text-align: left; margin-left: 15px;">
				<h2>1:1 구매문의</h2>
			</div>
			
			<table width="100%">
				<col width="80px">
				<tr>
					<th>제목</th>
					<td align="left">${uskdto.usktitle}"</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td align="left">${uskdto.userid}</td>
				</tr>
				<tr>
					<th>질문유형</th>
					<td align="left">[
					<c:choose>
						<c:when test="${uskdto.usktype eq 'priceask'}">가격문의</c:when>
						<c:when test="${uskdto.usktype eq 'centerask'}">센터문의</c:when>
						<c:when test="${uskdto.usktype eq 'mthodask'}">거래방법문의</c:when>
						<c:when test="${uskdto.usktype eq 'serviceask'}">서비스문의</c:when>
					</c:choose>
					]</td>
				</tr>
				<tr>
					<td> </td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="15" cols="53" placeholder="문의 내용을 입력해주세요" style="resize:none;" readonly>${uskdto.uskcontent}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="answerboard">
							<h3>&nbsp;&nbsp;답변내용</h3>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="답변" onclick="answer_write()" class="button">&nbsp;&nbsp;<input type="button" value="닫기" onclick="reload()" class="button">
					</td>
				</tr>
			</table>
		</div>
		
		<div id="answerwrite">
		</div>
	</div>
</body>
</html>