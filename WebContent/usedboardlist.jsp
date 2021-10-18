<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양도 게시판</title>
<style type="text/css">
h1{
	text-align:center;
}
#wrap{
	width:80%;
	margin: 0 auto;
}
#search {
	display: flex;
	align-items: center;
	font-size: 15px;
	font-weight: bold;
}
#search select {
	width: 100px;
	height: 20px;
}
#usedboard_list img{
	border-radius: 30%;
	width:200px;
	height:200px;
}
.used_brief{
	width:100%;
	height:200px;
	min-width:600px;
	border:1px solid black;
	border-radius: 25px;
}
/*찜 버튼 구현 시작*/
.checkbox-wrap{
	cursor:pointer;
	position: relative;
	left: 95%;
	top:10px;
}
.checkbox-wrap .check-icon  { 
	display: inline-block; 
	width: 30px; height: 30px; 
	background: url('img/emt_heart.png') left center no-repeat; 
	vertical-align: middle; 
	transition-duration: .3s; }	
.checkbox-wrap input[type=checkbox]{display:none;}
.checkbox-wrap input[type=checkbox]:disalbed + .check-icon{
	background-image:url('img/emt_heart.png');
}
input[type=checkbox]:checked + .check-icon{
	background-image:url('img/heart.png');
}
/*찜 버튼 구현 끝*/

input[type=button]{
	width:150px;
	height:40px;
	font-size:20px;
	font-weight:bold;
}
</style>
</head>
<body>
	<header><%@ include file="./form/header.jsp" %></header>
	<h1>양도 게시판</h1>
	<hr>
	<br><br>
	<div id="wrap">
		<div id="search">
            &nbsp;&nbsp;&nbsp;<img src="img/tmp.png" width ="40px" height="40px"><input type="text" placeholder="ex)서울시 성북구" style="width:50%;height:40px;font-size:12px;">
        	
        	&nbsp;센터종류&nbsp; <select name="center_category">
				<option value="gym">헬스장</option>
				<option value="yoga">요가</option>
				<option value="pilates">필라테스</option>
				<option value="crossfit">크로스핏</option>
				<option value="etc">기타</option>
			</select> &nbsp;&nbsp;
			
			가격&nbsp; <select name="price">
				<option value="desc_price">가격 높은 순</option>
				<option value="asc_price">가격 낮은 순</option>
			</select> &nbsp;&nbsp;
			
			평점&nbsp; <select name="rate">
				<option value="desc_rate">평점 높은 순</option>
				<option value="asc_rate">평점 낮은 순</option>
			</select>
        </div>
        <br><br><br><br>
        <div id="usedboard_list">
			<table width="100%">
				<col width="200px">
				<tr>
					<td><a href="#"><img src="img/tmp.png"></a></td>
					<td><a href="#"><div class="used_brief">
						<label class="checkbox-wrap"><input type="checkbox" name="wish_list" id="used_no1"><i class="check-icon"></i></label>
					</div></a></td>
				</tr>
				<tr>
					<td><a href="#"><img src="img/tmp.png"></a></td>
					<td><a href="#"><div class="used_brief">
						<label class="checkbox-wrap"><input type="checkbox" name="wish_list" id="used_no1"><i class="check-icon"></i></label>
					</div></a></td>
				</tr>
				<tr>
					<td><a href="#"><img src="img/tmp.png"></a></td>
					<td><a href="#"><div class="used_brief">
						<label class="checkbox-wrap"><input type="checkbox" name="wish_list" id="used_no1"><i class="check-icon"></i></label>
					</div></a></td>
				</tr>
				<tr height="150px">
					<td colspan="2" align="center">
						<input type="button" onclick="location.href='#'" value="글쓰기">	
					</td>
				</tr>
			</table>
		</div>
	</div>
	<footer><%@ include file="./form/footer.jsp" %></footer>
</body>
</html>