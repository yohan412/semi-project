<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$("REVIEW_GRADE a").click(function() {
    	$(this).parent().children("a").removeClass("on");
    	$(this).addClass("on").prevAll("a").addClass("on");
   		return false;
	});

</script>

</head>
<style type="text/css">
	#wrap{
		position: absolute;
		width: 80%;
		top: 20%;
		margin: 0 auto;
		text-align : center;
}
	body{
		width : 80%;
		text-align : center;		
	}
	h2{
		text-align : center;
	
	}
	.USER_CONTENT{
		float: center;
		margin : 1%
		
	}
	textarea{
		width : 50%;
		float : center;
	}
	.REVIEW_WRITER{
		text-align : left;
		margin : 5%;
	}
	.REVIEW_GRADE {
		dispaly: inline-block;
		float: center;
		postion : static;
		font-size:0;
		letter-spacing:5%;

	}
	.REVIEW_GRADE a {
    	font-size:22px;
    	letter-spacing:0;
   		display:inline-block;
    	margin-left:1%;
    	color:#ccc;
    	text-decoration:none;
	}
	.REVIEW_GRADE a:first-child {margin-left:0;}
	.REVIEW_GRADE a.on {color:#777;}

	.feeling_div {
  		display: flex;
  		justify-content: right;
  		align-items: right;
	} 
	.button-container{
		margin-left:20px;
		}
	.feeling_a {
  		background-color: #fff;
  		border: 2px solid #2199e8;
  		padding: 5% 5%;
  		border-radius: 2%;
  		color: #2199e8;
  		display: inline-block;
	}     
	.cmd{
		display: inline-block;
	}
	
</style>


<body>
	<header><%@ include file = "form/header.jsp" %></header>
	<div id="wrap">
    <h2>Review</h2>
    <hr>
    <br>
    <br>
    <form name="reviewcheck" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/> 
        <div>
        	<span class="REVIEW_WRITER">이용자A</span>
       		<span class="REVIEW_GRADE">별점: 
       			<a href="#" class="on">★</a>
    			<a href="#" class="on">★</a>
   	 			<a href="#" class="on">★</a>
    			<a href="#">★</a>
    			<a href="#">★</a>
			</span>
        </div>
		<p>
        <div class="USER_CONTENT">
        	<span class="USER_CONTENT"></span>
        	 <textarea class="form-control" id="bookReview" 
        	 			cols="30" rows="5" placeholder="160자까지 입력할 수 있습니다.">
        	 </textarea> 
         </div>
         <br>
         
			<div class="feeling_div">
				<span class="review_help">리뷰가 도움이 되었나요?</span>
				<div class="button-container like-container">
			  	  <button class="feeling_a">
			     	 <i class="fa fa-heart-o"> Like</i>    
			    </button>
			  	</div>
			  	<div class="button-container dislike-container">
			    	<button class="feeling_a">
			     		<i class="fa fa-heart"> Dislike</i>
			    	</button>
				</div>
			</div>	
        
        <br>
        <div class="cmd">
            <input type="button" name="close" id="close" value="수정">
            <input type="button" name="save" id="save" value="삭제">
            <input type="button" name="save" id="save" value="닫기">    
        </div>
        	<footer><%@ include file = "form/footer.jsp" %></footer>
        
    </form>
	</div>
	
</body>
</html>