<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${centerDto.centername} 상세페이지</title>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		var reviewlist = new Array();
		// center 객체
		var reviewObj = function(writer,grade,content,reg) {
			this.writer = writer;
			this.grade = grade;
			this.content= content;
			this.reg=reg;
		}
		<c:choose>
		<c:when test="${!empty reviewList}">
		//CenterController 에서 보내준 reviewlist의 값을 넣어줌
			<c:forEach items="${reviewList}" var="review">
			var tempReview = 
				new reviewObj("${review.reviewwriter}","${review.reviewgrade}"
					,"${review.reviewcontent}","${review.reviewreg}");
			reviewlist.push(tempReview);
			</c:forEach>
			makeBoardList(reviewlist);
		</c:when>
		</c:choose>
		
		var piclist = new Array();
		
		var picObj = function(centerno,name,path){
			this.centerno = centerno;
			this.name = name;
			this.path = path;
		}
		
		<c:choose>
		<c:when test="${!empty piclist}">
		//CenterController 에서 보내준 piclist의 값을 넣어줌
			<c:forEach items="${piclist}" var="pic">
			var tempPic = 
				new picObj("${pic.boardno}","${pic.picname}","${pic.picpath}");
			piclist.push(tempPic);
			</c:forEach>
			makeimgGallery(piclist);
			$(".img_part").empty();
			$(".img_part").append("<img src='/download/"+piclist[0].path+"'alt='"+piclist[0].name+"'>");
		</c:when>
		</c:choose>
		
		
	});
	function makeBoardList(list){
		//tbody의 자식 요소 초기화
		$("tbody").empty();
		
		//list에 들어있는 center 정보 추가
		for(var i = 0 ; i < list.length ; i++){
			
			$("tbody").append(
				"<tr><td>"
				+"<div class='review_content'>"
				+"<span class='review_writer'>&nbsp;&nbsp; 작성자 : "+list[i].writer+"</span></a>"+"<br><hr>"
				+"<span class='review_grade'>&nbsp;&nbsp; " 
				+"평점 : <span class='star-rating'><span style='width:"+(list[i].grade*20)+"%'></span>"
                +"</span> ("+list[i].grade+")</span>"+"<br>"
				+"<span class='review_contents'>&nbsp;&nbsp; 내용 : "+list[i].content+"</span>"+"<br>"
				+"<span class='review_reg'>&nbsp;&nbsp; 등록일 : "+list[i].reg+"</span>"+"<br>"
				+"</div></td>"
				+"</tr>"		
			);
		}
	}
	function makeimgGallery(list){
		
		$(".cont_images").empty();
		
		for(var i = 0 ; i < list.length; i++){
			$(".cont_images").append(
				"<img src='/download/"+list[i].path+"' alt = '"+list[i].name+"'>"
			);
		}
	}
	function review_login_chk(){
		if(${loginUser==null }){
			if(confirm("로그인이 필요한 작업입니다.\n 로그인 하시겠습니까?")){
				location.href="login.jsp"
			}else{
				
			}
		} else{
			//로그인 상태라면 컨르롤러에 작업 요청
			location.href='CenterController?command=review_write_form&centerno=${centerDto.centerno}'
		}
	}
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
        <div class="wrap">
            <div class="main_title">
                <h2>${centerDto.centername}</h2>
            </div>
            <hr>
            <div class="top_cont">
                <div class="img_part">                	
                    <img src="./img/center_default.png">            
                </div>
                <div class="txt_part">
                    <p>${centerDto.centeraddr}</p>
                    평점 : <span>
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
                    	${centerDto.centerintro}
                    </div>
                </div>
                <div id="center_info">
                	<div class="cont_head">
                		<h2 id="b">이용정보</h2>
                	</div>
                    <div class="cont_info">
                    	${centerDto.centercontent}
                    </div>
                </div>
                <div id="center_time">
                	<div class="cont_head">
                		<h2 id="c">운영시간</h2>
                	</div>
                    <div class="cont_info">
                    	${centerDto.centerophour }
                    </div>
                </div>
                <div id="center_program">
                	<div class="cont_head">
                		<h2 id="d">프로그램</h2>
                	</div>
                    <div class="cont_info">
                     	${centerDto.centerpro}
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
                <div id="review_header">
                    <h2 id="e">이용후기</h2>
                    <div id="review_button">
                    	<button type="button" onclick="review_login_chk()">리뷰작성</button>
                    </div>
                </div>
          
                <div id="review_list">
                	<table width="100%">
					<tbody>
					<tr><td>
					<div class="empty_review">
						<p>아직 등록된 리뷰가 없습니다.</p>
					</div>
					</td></tr>
					</tbody>
					</table>
 				</div>           
            </div>
        </div>
       </div>
<header><%@ include file = "./form/footer.jsp" %></header>
</body>
</html>