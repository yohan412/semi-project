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
	.text_area{
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
		font-weight:bold;
	}
	input[name=title]{
		width:98%;
	}
	th{
		font-size:13px;
	}
</style>

<script type="text/javascript">
	function reload(){
		window.opener.location.reload();
		window.close();
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
					<td colspan="2" align="center">
						<input type="submit" value="등록" class="button">&nbsp;&nbsp;<input type="button" value="취소" onclick="reload()" class="button">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>