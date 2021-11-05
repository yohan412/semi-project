<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 등록 요청</title>
<style type="text/css">
#body{
	display:flex;
}
#wrap{
	width:80%;
	text-align:center;
	align-items: center;
    justify-content: center;
}
.empty_space{
	width:10%;
}
.biz_info{
	display:flex;
}
.cont_head{
	display: flex;
    align-items: center;
    justify-content: center;
	width:150px;
	height:150px;
}
.cont_info{
	width:100%;
}

.ip_button{
	margin-top:10px;
	margin-left:10px;
	background: rgb(00,68,137);
	font-weight:bold;
	color : white;
	width:80px;
	height:30px;
	border-radius: 5px;
	cursor:pointer;
	outline:none;
	box-shadow:none;
	border:none;
}
</style>
</head>
<body>
	<header><%@ include file="./form/header.jsp"%></header>
	<div id="body">
	<div class="empty_space"></div>
	<div id="wrap">
		<div id="title">
			<h1>사업장 등록 요청</h1>
		</div><hr>
		<div id="contents">
			<div class="biz_info">
                <div class="cont_head">
                    <h3>사업자 이름</h3>
                </div>
                <div class="cont_info">
            	</div>
        	</div>
        	<div class="biz_info">
                <div class="cont_head">
                    <h3>사업장 이름</h3>
                </div>
                <div class="cont_info">
            	</div>
        	</div>
        	<div class="biz_info">
                <div class="cont_head">
                    <h3>사업장 종류</h3>
                </div>
                <div class="cont_info">
            	</div>
        	</div>
        	<div class="biz_info">
                <div class="cont_head">
                    <h3>사업장 주소</h3>
                </div>
                <div class="cont_info">
            	</div>
        	</div>
        	<div class="biz_info">
                <div class="cont_head">
                    <h3>기타</h3>
                </div>
                <div class="cont_info">
            	</div>
        	</div>
        	<div class="biz_info">
                <div class="cont_head">
                    <h3>사업자 등록증 사진</h3>
                </div>
                <div class="cont_info">
            	</div>
        	</div>
        	<div class="">
        		<input class="ip_button" type="button" value="승 인" onclick="#">
        		<input class="ip_button" type="button" value="거 절" onclick="#">
        	</div>
		</div>
	</div>
	<div class="empty_space"></div>
	</div>
	<footer><%@ include file="./form/footer.jsp"%></footer>
</body>
</html>