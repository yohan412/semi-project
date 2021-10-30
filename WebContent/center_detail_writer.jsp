<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>센터 등록</title>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>

<style type ="text/css">
header, section, article, aside, main, nav, footer{
    display: block;
}
h1, p{
    margin: 0;
}
.information a{
    text-decoration: none;
    color:black;
    font-weight:bold;
}
#main{
    width: 80%;
    height: auto;
    margin: 0 auto;
}
.main_title{
	text-align : center;
}
#main .wrap .top_cont{
    font-size: 0;
}
#main .wrap .top_cont .img_part{
    display: inline-block;
    vertical-align: middle;
}
#main .wrap .top_cont .img_part img{
    margin: 10px;
    width: 200px;
    height: 200px;
}
#main .wrap .top_cont .txt_part{
    display: inline-block;
    vertical-align: middle;
    padding-left: 50px;
}
#main .wrap .top_cont .txt_part p{
    display: block;
    font-size: 20px;
    padding-bottom: 20px;
}
.information{
	text-align : center;
    word-spacing : 60px;
}
#main .information a{
    margin: 0 15px;
}

#center_intro,#center_info,#center_time,#center_program{
	display:flex;
	width:90%;
	margin-left:5%;
}
.cont_head{
	min-width:200px;
	height:200px;
	width:20%;
}
.cont_info{
	width:80%;
	padding:8px;
}
.img_cont, .review_cont{
	width:90%;
	margin-left:5%;
	height: auto;
}
.cont_images img{
	width:300px;
	height:200px;
}
.review_content,.empty_review{
	height:150px;
	border: 1px solid black;
	border-radius: 5px;
	min-width:600px;
	margin-top:10px;
}
.empty_review{
	line-height:150px;
	text-align:center;
}
/*별점 구현*/
.star-rating{
	width:128px;
	margin-left:5px;
}
.star-rating,.star-rating span{
	display:inline-block;
	height:24px;
	overflow:hidden;
	background:url("img/stars_empty.png") no-repeat;
}
.star-rating span{
	background:url("img/stars_filled.png") no-repeat;
	background-position:left bottom;
	line-height:0;
	vertical-align:top;
}
.txt_part{
	font-size:18px;
}
#review_header{
	display:flex;
	justify-content:space-between;
}
#review_header button{
	height:30px;
}
#review_button{
	align-self:flex-end;
}
</style>
</head>
<body>
<header><%@ include file = "./form/header.jsp" %></header>
	<div id="main">
		<form action="CenterController?command=centerdetail_writer" method="post" enctype="multipart/form-data">      
	            <div class="text_cont">
	            	<div id="center_name">
	                    <div class="cont_head">
	                        <h2 id="a">센터이름</h2>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="text" name="centernm">
	                    </div>
	                </div>
	                <div id="center_name">
	                    <div class="cont_head">
	                        <h2 id="a">센터위치</h2>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="text" name="centeraddr">
	                    </div>
	                </div>
	                <div id="center_name">
	                    <div class="cont_head">
	                        <h2 id="a">가격</h2>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="text" name="centerprice">
	                    </div>
	                </div>
	                <div id="center_name">
	                    <div class="cont_head">
	                        <h2 id="a">센터종류</h2>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="checkbox" name="health" value="health">헬스
							<input type="checkbox" name="pilates" value="pilates">필라테스
							<input type="checkbox" name="yoga" value="yoga">요가
							<input type="checkbox" name="etc" value="etc">기타
	                    </div>
	                </div>
	                <div id="center_intro">
	                    <div class="cont_head">
	                        <h2 id="a">센터소개</h2>
	                    </div>
	                    <div class="cont_info">
	                    	<textarea rows="20" cols="80" name="centerintro"></textarea>
	                    </div>
	                </div>
	                <div id="center_info">
	                	<div class="cont_head">
	                		<h2 id="b">이용정보</h2>
	                	</div>
	                    <div class="cont_info">
	                    	<textarea rows="20" cols="80" name="centercontent"></textarea>
	                    </div>
	                </div>
	                <div id="center_time">
	                	<div class="cont_head">
	                		<h2 id="c">운영시간</h2>
	                	</div>
	                    <div class="cont_info">
	                    	<textarea rows="20" cols="80" name="centerophour"></textarea>
	                    </div>
	                </div>
	                <div id="center_program">
	                	<div class="cont_head">
	                		<h2 id="d">프로그램</h2>
	                	</div>
	                    <div class="cont_info">
	                    	<textarea rows="20" cols="80" name="centerpro"></textarea>
	                    </div>
	                </div>
	            </div>
	            <div class="img_cont">
	                <div>
	                    <h2 id="f">사진</h2>
	                </div>
	                <div class="cont_images">
	                    <input type="file" name="imgfile" accept=".jpg,.jpeg,.png,.gif" multiple="multiple">
	                </div>
	            </div>
	            <div class="submit_btn">
	            	<input type="submit" value="등록">	
					<input type="button" value="취소" onclide="location.href=''">
	       		</div>
      	</form>
	</div>
<header><%@ include file = "./form/footer.jsp" %></header>
</body>
</html>