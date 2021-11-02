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
	<form action="MainController" method="post">
		<input type="hidden" name="command" value="boardwrite">
		<input type="hidden" name="qa_gpno" value="1"> <!-- 1:1 문의 작성시 필요한 그룹번호, 그룹번호내 번호는 현재 받아올수 있는 값이 없어 임의에 값으로 설정 -->
		<input type="hidden" name="qa_gpsq" value="1"> 
		<input type="hidden" name="user_id" value="TEST"> <!-- 사용자 아이디와 번호는 로그인 기능 완료 후 세션값 적용 -->
		<input type="hidden" name="user_no" value="1">
		<input type="hidden" name="qa_faq" value="N"> <!-- 관리자가 설정하는 영역이므로 사용자가 등록 시 'N' 고정값 -->
		<input type="hidden" name="qa_status" value="N"> <!-- 관리자가 설정하는 영역이므로 사용자가 등록 시 'N' 고정값 -->
		<table>
			<tr id="title">
				<th>제 목</th>
				<td>
					<select id="qna_category" name="qa_type" style="width:50px;height:30px;">
							<option value="price">가격</option>
							<option value="deal">거래</option>
							<option value="center">시설</option>
							<option value="etc">기타</option>
					</select>
					<input type="text" placeholder="제목을 입력하세요" name="title" maxlength="30" value="${dto.qatitle }">
				</td>
			</tr>
			<tr id="content">
				<th>내 용</th>
				<td><textarea rows="15" cols="50" name="content" placeholder="문의내용을 입력해주세요" resize="none">${dto.qacontent }</textarea></td>
			</tr>
			<tr id="photo">
				<th>사진 첨부</th>
				<td align="left"><input type="file" value="파일 선택" accept=".jpg,.jpeg,.png,.gif" multiple="multiple"></td>
			</tr>
		</table>
		<br>
		<div align="center">
				<input type="submit" id="submit" value="완 료">
				<input type="button" id="reset" value="취 소" onclick="location.href='MainController?command=qna'">
		</div>		
	</form>
</div>
		<footer><%@ include file = "form/footer.jsp" %></footer>
</body>
</html>