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
	margin-top: 25px;
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


</style>
</head>
<body>

	<div class="wrap">
		<div class="review_detail">
			<div class="headline">
				<a>닉네임</a> &nbsp;
				<a>2020.02.02</a>
				<img src="./img/tmp_image.png" width="100px" height="25px">
			</div>
				
			<div class="content">
				<textarea rows="10" cols="70" readonly="readonly">후기후기후기</textarea>
			</div>
			
			<div class="recommend">
				<a>도움이 되었나요?</a>
				<img src="./img/tmp_image.png" width="30px" height="25px">
				<img src="./img/tmp_image.png" width="30px" height="25px">
			</div>
		</div>
	</div>

</body>
</html>