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
	var gfv_count = 1;
	
	
	$(document).on("hover","#file",function(){
		
		$("#file").on("change", function(e){ //파일 추가 버튼 
			e.preventDefault(); 
			fn_addFile();
			
		}); 
		
		$("a[name='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault(); 
			fn_deleteFile($(this)); 
		});
	});
	
	

	function fn_addFile(){ 
		var str = "<p><input type='file' id='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>"; 
		$("#fileDiv").append(str); 
		$("a[name='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault(); 
		fn_deleteFile($(this)); 
		}); 
		} 
	
	function fn_deleteFile(obj){ obj.parent().remove(); }


		
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

.cont{
	display:flex;
	width:90%;
	margin-left:5%;
	justify-content:center;
	align-items: center;
}
.cont_head{
	min-width:200px;
	height:50px;
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

.txt_part{
	font-size:18px;
}
input[type=text]{
	width:100%;
	height:20px;
}
textarea{
	width:100%;
	resize:none;
}
</style>
</head>
<body>
<header><%@ include file = "./form/header.jsp" %></header>
	<div id="main">
		<h1 align="center">센터 등록</h1>
		<hr>
		<form action="CenterController?command=centerdetail_writer" method="post" enctype="multipart/form-data">      
	            <div class="text_cont">
	            	<div class="cont">
	                    <div class="cont_head">
	                        <h3 id="a">센터이름</h3>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="text" name="centernm">
	                    </div>
	                </div>
	                <div class="cont">
	                    <div class="cont_head">
	                        <h3 id="a">센터위치</h3>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="text" name="centeraddr">
	                    </div>
	                </div>
	                <div class="cont">
	                    <div class="cont_head">
	                        <h3 id="a">가격</h3>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="text" name="centerprice">
	                    </div>
	                </div>
	                <div class="cont">
	                    <div class="cont_head">
	                        <h3 id="a">센터종류</h3>
	                    </div>
	                    <div class="cont_info">
	                    	<input type="checkbox" name="health" value="health">헬스
							<input type="checkbox" name="pilates" value="pilates">필라테스
							<input type="checkbox" name="yoga" value="yoga">요가
							<input type="checkbox" name="etc" value="etc">기타
	                    </div>
	                </div>
	                <div class="cont">
	                    <div class="cont_head">
	                        <h3 id="a">센터소개</h3>
	                    </div>
	                    <div class="cont_info">
	                    	<textarea rows="10" name="centerintro"></textarea>
	                    </div>
	                </div>
	                <div class="cont">
	                	<div class="cont_head">
	                		<h3 id="b">이용정보</h3>
	                	</div>
	                    <div class="cont_info">
	                    	<textarea rows="10" name="centercontent"></textarea>
	                    </div>
	                </div>
	                <div class="cont">
	                	<div class="cont_head">
	                		<h3 id="c">운영시간</h3>
	                	</div>
	                    <div class="cont_info">
	                    	<textarea rows="10" name="centerophour"></textarea>
	                    </div>
	                </div>
	                <div class="cont">
	                	<div class="cont_head">
	                		<h3 id="d">프로그램</h3>
	                	</div>
	                    <div class="cont_info">
	                    	<textarea rows="10" name="centerpro"></textarea>
	                    </div>
	                </div>
	                <div class="cont">
	                <div class="cont_head">
	                    <h3 id="f">사진</h3>
	                </div>
	                <div class="cont_info">
	                	<div class="cont_images" id="fileDiv">
	                    <p> 
	                    	<input type="file" id="file" name="file_0" accept=".jpg,.jpeg,.png,.gif">
	                    	<a href="#this" class="btn" id="delete" name="delete">삭제</a> 
	                    </p>
	                	</div>
	                </div>
	            	</div>
	            </div>
	            <div class="submit_btn" align="right">
	            	<input type="submit" value="등록">	
					<input type="button" value="취소" onclick="location.href='CenterController?command=centerlist'">
	       		</div>
      	</form>
	</div>
<header><%@ include file = "./form/footer.jsp" %></header>
</body>
</html>