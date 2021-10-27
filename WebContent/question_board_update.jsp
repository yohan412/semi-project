<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function uploadFileAdded(){
		
}

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
	#content{
		resize:none;
	}
	#submit, #reset{
		cursor:pointer;
	}
	#submit{
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
<body>
<h2 align="center">1 : 1 문의</h2>
<div id="wrap">
	<form action="update.do" method="post">
		<input type="hidden" name="command" value="boardupdate">
		<input type="hidden" name="askno" value="${dto.uskno }" >
		<table>
			<tr id="title">
				<th>제 목</th>
				<td>
					<select id="category" style="width:50px;height:30px;">
							<option value="cost">가격</option>
							<option value="deal">거래</option>
							<option value="center">시설</option>
							<option value="etc">기타</option>
					</select>
					<input type="text" placeholder="제목을 입력하세요" maxlength="30" value="${dto.usktitle }">
				</td>
			</tr>
			<tr id="content">
				<th>내 용</th>
				<td><textarea rows="15" cols="50" placeholder="문의내용을 입력해주세요" >${dto.uskcontent }</textarea></td>
			</tr>
			<tr id="photo">
				<th>사진 첨부</th>
				<td align="left"><input type="file" value="파일 선택" multiple/></td>
			</tr>
		</table>
		<br>
		<div align="center">
				<input type="submit" id="submit" value="수정 완료">
				<input type="button" id="reset" value="취 소" onclick="location.href='qna.jsp'">
		</div>		
	</form>
</div>
		<footer><%@ include file = "form/footer.jsp" %></footer>
</body>
</html>