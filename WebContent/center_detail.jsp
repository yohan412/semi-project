<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.review_content{
	height:150px;
	border: 1px solid black;
	border-radius: 5px;
	min-width:600px;
	margin-top:10px;
}
.star-rating{
	width:128px;
	margin-left:20px;
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
</style>
</head>
<body>
<header><%@ include file = "./form/header.jsp" %></header>
<div id="main">
        <div class="wrap">
            <div class="main_title">
                <h2>${centerDto.centername}</h2>
            </div>
            <hr>
            <div class="top_cont">
                <div class="img_part">
                	<c:choose>
                		<c:when test="${empty centerDto.centerpic}">
                    		<img src="./img/center_default.png">
                    	</c:when>
                    	<c:otherwise>
                    		<img src="./img/"+"${ centerDto.centerpic}")>
                    	</c:otherwise>
                    </c:choose>
                </div>
                <div class="txt_part">
                    <p>${centerDto.centeraddr}</p>
                    <span>
                    <span class="star-rating">
                    	<span style="width:${centerDto.centergrade*20}%"></span>
                    </span> (${centerDto.centergrade})
                    </span>
                </div>
            </div>
            <hr>
            <div class="information">
                <a href="#a">센터소개</a>
                <a href="#b">이용정보</a>
                <a href="#c">운영시간</a>
                <a href="#d">프로그램</a>
                <a href="#e">사진</a>
                <a href="#f">이용후기</a>
            </div>
            <hr><br><br>
            <div class="text_cont">
                <div id="center_intro">
                    <div class="cont_head">
                        <h2 id="a">센터소개</h2>
                    </div>
                    <div class="cont_info">
                    </div>
                </div>
                <div id="center_info">
                	<div class="cont_head">
                		<h2 id="b">이용정보</h2>
                	</div>
                    <div class="cont_info">
                    </div>
                </div>
                <div id="center_time">
                	<div class="cont_head">
                		<h2 id="c">운영시간</h2>
                	</div>
                    <div class="cont_info">
                    </div>
                </div>
                <div id="center_program">
                	<div class="cont_head">
                		<h2 id="d">프로그램</h2>
                	</div>
                    <div class="cont_info">
                    </div>
                </div>
            </div>
            <div class="img_cont">
                <div>
                    <h2 id="f">사진</h2>
                </div>
                <div class="cont_images">
                    <img src="./img/tmp_image.png">
                    <img src="./img/tmp_image.png">
                    <img src="./img/tmp_image.png">
                    <img src="./img/tmp_image.png">
                </div>
            </div>
             <div class="review_cont">
                <div>
                    <h2 id="e">이용후기</h2>
                </div>
                <div id="review_list">
                	<table width="100%">
						<tbody>
						<tr>
						<div class="review_content"></div>
						</tr>
						<tr>
						<div class="review_content"></div>
						</tr>
					</tbody>
					</table>
 				</div>           
            </div>
        </div>
       </div>
<header><%@ include file = "./form/footer.jsp" %></header>
</body>
</html>