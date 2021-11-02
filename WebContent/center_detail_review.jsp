<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}
	
.wrap{
	width: 100%;
	height: 650px;
	display: flex;
	align-items: center;
	justify-content: center;

}

.review_detail{
	border: 2px solid rgb(93, 93, 93);
	padding: 20px;
	border-radius: 10px;
}


.headline a{
	align-items: left;
	font-weight: bold;
	color: rgb(93, 93, 93);
}

.headline img{
	margin-left:  235px;
}

.grade {
	text-align: right;
	}

.content{
	margin-top: 15px;
	}

.recommend{
	text-align: right;
	align-items: right;
	}

.recommend a{
	color: grey;
	font-size: 12px;
	font-weight: bold;
	}	
.starRating{
	display: block;
	width: 5px;
	margin:0 auto;
	}
.starR1{
	background:url('http://miuu227.godohosting.com/image/icon/ico_review.png') no-repeat right 0;
	background-size : auto 100%;
 	width: 5px;
  	height: 30px;
	float : left;
  	cursor: pointer;
	}
.starR2{
	background:url('http://miuu227.godohosting.com/image/icon/ico_review.png') no-repeat right 0;
	background-size : auto 100%;
  	width: 15px;
  	height: 30px;
  	display: inline-block;
  	float: left;
  	cursor: pointer;
	}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}



</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff9e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"> </script>
<script type="text/javascript">
$(document).ready(function(){
	//좋아요 버튼 처리
	$('.like-content').one('click','.like-review',function(e){
		$(this).html('<img src="img/heart.png"> You liked this');
		$(this).children('.fa-heart').addClass('animate-like');
	});
	$('.REVIEW_GRADE').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		var starValue='별점 : '+ $(this).attr("value");
		$('.starRating p').html(starValue);
		return false;
		});
	});
</script>
</head>
<body>
<div id="fb-root"></div>
	<div class="wrap">
		<div class="review_detail">
			<div class="headline">
				<a>닉네임</a> &nbsp;
				<a>2020.02.02</a>
				<br>
				<div class="REVIEW_GRADE">
					<span class="starR1 on" value="0.5"></span>
					<span class="starR2" value="1"></span>
					<span class="starR1" value="1.5"></span>
					<span class="starR2" value="2"></span>
					<span class="starR1" value="2.5"></span>
					<span class="starR2" value="3"></span>
					<span class="starR1" value="3.5"></span>
					<span class="starR2" value="4"></span>
					<span class="starR1" value="4.5"></span>
					<span class="starR2" value="5"></span>
					<p>별점 주기 클릭</p>
				</div>
			</div>
				
			<div class="REVIEW_CONTENT">
				<textarea rows="10" cols="70" readonly="readonly">후기후기후기</textarea>
			</div>
			
			<div class="recommend">
				<a>도움이 되었나요?</a>
			<div class="like-content">
				<button class="btn-secondary like-review">
				<img class="pic" src="img/emt_heart.png">Like
				</button>
			</div>
			
	</div>

</body>
</html>