<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
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
		text-align : left;
		margin : 3%;
	}
	textarea{
		width : 50%;
	}
	.REVIEW_WRITER{
		text-align : left;
		margin : 5%;
	}
	.REVIEW_GRADE {
		dispaly: inline-block;
		float: right;
		postion : static;
	}
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
    <form name="reviewcheck" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/> 
        <div class="review_rating">
            <span class="warning_msg">이용자 A</span>
        </div>
        <div>
            <span class="REVIEW_GRADE">별점</span>
        </div>
        <div class="USER_CONTENT">
        	<span class="USER_CONTENT"> 
        		<span class="USER_CONTENT">리뷰내용</span>
        		<p>
        	 <textarea class="form-control" id="bookReview" 
        	 			cols="30" rows="5" placeholder="160자까지 입력할 수 있습니다.">
        	 </textarea> 
        	 </span>
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