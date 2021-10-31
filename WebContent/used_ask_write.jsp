<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 구매문의 작성하기</title>
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
			<form action="usedcontroller?command=askwrite" method="post">
			<input type="hidden" name="writer" value="${writer}">
			<input type="hidden" name="usedno" value="${usedno}">
			<table width="100%">
				<col width="80px">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>질문유형</th>
					<td align="left"><select name="usk_type">
						<option value="priceask">가격문의</option>
						<option value="centerask">센터문의</option>
						<option value="mthodask">거래방법문의</option>
						<option value="serviceask">서비스문의</option>
					</select></td>
				</tr>
				<tr>
					<td> </td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="15" cols="53" placeholder="문의 내용을 입력해주세요" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록" class="button">&nbsp;&nbsp;<input type="button" value="취소" onclick="reload()" class="button">
					</td>
				</tr>
			</table>			
			</form>			
		</div>
	</div>
</body>
</html>