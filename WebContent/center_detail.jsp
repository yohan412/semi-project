<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type ="text/css">
header, section, article, aside, main, nav, footer{
    display: block;
}
h1, p{
    margin: 0;
}
a{
    text-decoration: none;
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
    word-spacing : 70px;
}
#main .information a{
    margin: 0 15px;
}
#main .cont_part .title_txt{
    width: 100%;
    height: 100%;
}
#main .cont_part .title_txt .cont_txt{
    height: 200px;
} 
#main .cont_part .title_txt .cont_txt h2{
    display: inline-block;
} 
#main .cont_part .title_txt .cont_txt p{
    display: inline-block;
    margin-left: 150px;
} 
#main .postscript textarea{
    margin-left: 150px;
    width: 70%;
    border: 1px solid black;
    line-height: 10px;
    font-size: 16px;
    border-radius: 4px;
    resize: none;
}
#main .img_cont{
    margin-bottom: 50px;
}
#main .img_cont .img_line{
    margin-left: 200px;
}
#main .img_cont .img_line img{
    width: 200px;
    height: 200px;
    background-position: 50% 50%;
    background-size: cover;
}
.text{
	display:inline-block;
}
.title{
	display :inline-block;
	vertical-align:top; 
}
.img_line{
	display : inline-block;
}
.postscript{
	margin-bottom : 80px;
}
</style>
</head>
<body>
<header><%@ include file = "./form/header.jsp" %></header>
<div id="main">
        <div class="wrap">
            <div class="main_title">
                <h2>${centerDto.centername }</h2>
            </div>
            <hr>
            <div class="top_cont">
                <div class="img_part">
                    <img src="./img/tmp_image.png">
                </div>
                <div class="txt_part">
                    <p>서대문 헬스장 a</p>
                    <p>서울시 --구 --동 --로 16</p>
                </div>
            </div>
            <hr>
            <div class="information">
                <a href="#a">센터소개</a>
                <a href="#b">이용정보</a>
                <a href="#c">운영시간</a>
                <a href="#d">프로그램</a>
                <a href="#e">이용후기</a>
                <a href="#f">사진</a>
            </div>
            <hr>
            <div class="cont_part">
                <div class="title_txt">
                    <div class="cont_txt">
                        <h2 id="a">센터소개</h2>
                        <p>센터가 ~~~~~</p>
                    </div>
                    <div class="cont_txt">
                        <h2 id="b">이용정보</h2>
                        <p>3개월 가격은 000,000원 이며</p>
                    </div>
                    <div class="cont_txt">
                        <h2 id="c">운영시간</h2>
                        <p>09:00 ~ 22:00까지 운영하며 점심시간은 12:00~ 13:00</p>
                    </div>
                    <div class="cont_txt">
                        <h2 id="d">프로그램</h2>
                        <p>필라테스 교육~~~~~~~</p>
                    </div>
                </div>
            </div>
            <div class="postscript">
                <div class="title">
                    <h2 id="e">이용후기</h2>
                </div>
                <div class="text">
                <textarea name="text" id="text" placeholder="적어주세요" cols="50" rows="10"></textarea>
                <textarea name="text" id="text" placeholder="적어주세요" cols="50" rows="10"></textarea>
 				</div>           
            </div>
            <div class="img_cont">
                <div class="title">
                    <h2 id="f">사진</h2>
                </div>
                <div class="img_line">
                    <img src="./img/tmp_image.png">
                    <img src="./img/tmp_image.png">
                    <br>
                    <img src="./img/tmp_image.png">
                    <img src="./img/tmp_image.png">
                </div>
            </div>
        </div>
       </div>
<header><%@ include file = "./form/footer.jsp" %></header>
</body>
</html>