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
	
	h2{
		text-align : center;
	}
	#div_rating{
		vertical-align:right;
	}
	
	textarea{
		width : 200px;
	}
	
	#div_warning_msg{
		text-align : left;
	}
	.star-ratings {
		text-align : center;
  		color: #aaa9a9; 
  		position: right;
  		unicode-bidi: bidi-override;
  		width: max-content;
  		-webkit-text-fill-color: transparent;
  		-webkit-text-stroke-width: 1.3px;
 		 -webkit-text-stroke-color: #2b2a29;
	}
 
	.star-ratings-fill {
		color: #fff58c;
 		padding: 0;
  		position: right;
 		 z-index: 1;
  		display: flex;
  		top: 0;
  		left: 1000;
  		overflow: hidden;
  		-webkit-text-fill-color: gold;
	}
 
	.star-ratings-base {
 		 z-index: 0;
 		 postion : right;
  		padding: 0;
	}
	.feeling_div {
  		display: flex;
  		justify-content: right;
  		align-items: right;
	} 
	.button-container {
  		margin-left: 0px;
	}
	.feeling_a {
  		background-color: #fff;
  		border: 2px solid #2199e8;
  		padding: 10px 20px;
  		border-radius: 2px;
  		color: #2199e8;
	}     
	#wrap{
		width:900px;
		margin: 0 auto;
	}
</style>
	<%@ include file = "form/header.jsp" %>

<body>
    <h2>Review</h2>
    <hr>
    <div id="wrap">
    <form name="reviewform" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/> 
        <div class="review_rating">
            <div class="warning_msg"><h5>이용자 A</h5></div>
            <div class="star-ratings">별점
				<div class="star-ratings-fill space-x-2 text-lg": 
					style="{ width: ratingToPercent + '%' }">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
			</div>
        </div>
        <br>
        <div class="USER_REVIEW">
        	<div class="USER_REVIEW"> 
        		<span class="input-group-text"><h5>리뷰내용</h5></span>
        	 </div>
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
			    	</a>
			    </button>
			  	</div>
			  	<div class="button-container dislike-container">
			    	<button class="feeling_a">
			     	<i class="fa fa-heart"> Dislike</i>
			    	</a>
			    	</button>
				</div>
			</div>	
		</div>
        
        <br>
        <br>
        <div class="cmd">
            <input type="button" name="close" id="close" value="수정">
            <input type="button" name="save" id="save" value="삭제">
            <input type="button" name="save" id="save" value="닫기">    
        </div>
    </form>
    </div>
	
	<%@ include file = "form/footer.jsp" %>
</body>
</html>