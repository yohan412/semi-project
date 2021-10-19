<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style type="text/css">
	#search{
		display:flex;
		align-items:center;
		justify-content:center;
	}
	#body{
		background-image:url('img/tmpbackground.png');
		background-size:cover;
		width:100%;
		height:100%;
	}
	#icon_nav{
		display:flex;
		height:160px;
		justify-content:center;
		flex-direction: row;
		text-align:center;
	}
	.icon_subnav{
		margin-left:10px;
		margin-right:10px;
		width:150px;
		background-color:white;
		border-radius: 50px;
	}
	.icon_subnav img{
		border-radius: 30%;
		width:130px; height:130px;
	}
	.icon_subnav a{
		text-decoration: none;
		font-weight:bold;
		color:black;
	}
</style>
</head>
<body>
	<header>
		<%@ include file="./form/header.jsp" %>
	</header>
	<br><br><br><br>
	<div id="body">
		<br><br>
        <div id="search">
            <img src="img/tmp.png" width ="60px" height="60px"><input type="text" placeholder="ex)서울시 성북구" style="width:500px;height:60px;font-size:15px;">
        </div>
        <br><br>
        <div id="icon_nav">
        	<div class="icon_subnav">
            	<a href=""><img src="img/tmp.png" ><br>스포츠 센터 목록</p></a>
            </div>
            <div class="icon_subnav">
            	<a href=""><img src="img/tmp.png"><br>사업자 등록</a>
            </div>
            <div class="icon_subnav">
            	<a href=""><img src="img/tmp.png"><br>중고거래</a>
            </div>
            <div class="icon_subnav">
            	<a href=""><img src="img/tmp.png"><br>Q&A</a>
            </div>
        </div>
        <br><br><br>
    </div>
    </div>
    <footer>
		<%@ include file="./form/footer.jsp" %>
	</footer>
</body>
</html>