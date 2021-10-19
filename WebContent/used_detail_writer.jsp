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
	height: 1100px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 0 100px 0;
}

.used_detail{
	display: flex;
	position: absolute;
	justify-content: center;
	flex-direction: column;
	background: rgb(234, 234, 234);
}

.headline{
	margin: 15px;
}

.title a{
	font-weight: bold;
	font-size: 20px;
}

.write_info a{
	font-size: 12px;
}

.modify{
	text-align: right;
	margin-bottom: 10px;
}

.modify input{
	width: 50px;
	height: 25px;
	background: lightgrey;
	border: none;
	border-radius: 5px;

}

.content{
	width: 600px;
	height: 750px;
	background: white;
	margin: 20px;
	text-align: center;
}

.map{
	margin-top: 40px;
}

.pic{
	margin-top: 40px;
}

.content_info{
	margin-top: 40px;
}

.status{
	text-align: center;
	margin-top: 25px; 
	margin-bottom: 10px; 
}

.status input{
	width: 85px;
	height: 35px;
	border-radius: 5px;
	border: none;
	font-weight: bold;
	background: rgb(75, 161, 231);
	color: white;
}

.back{
	margin-top: 1100px;
}

.back input{
	width: 85px;
	height: 35px;
	border-radius: 5px;
	border: none;
	font-weight: bold;
	background: grey;
	color: white;
}



</style>
</head>
<body>

	<header><%@ include file="form\header.jsp" %></header>
	
	<div class="wrap">
		<div class="used_detail">
			<div class="headline">
				<div class="title">
					<a>[헬 스]</a>
					<a>ㅇㅇ동 3개월 양도합니다</a>
				</div>
				
				<div class="write_info">
					<a>작성자</a>
					<a>2020.02.02</a>
				</div>
				
				<div class="modify">
					<input type="button" value="수정" onclick="">
					<input type="button" value="삭제" onclick="">
				</div>
				<hr>
			</div>
			
			<div class="content">
				<div class="map">
					<img src="img\img1.png" width="500px" height="260px">
				</div>
				
				<div class="pic">
					<img src="img\img1.png" width="230px" height="230px">
				</div>
				
				<div class="content_info">
					<p>가격:</p>
					<p>사업장명:</p>
					<p>주소:</p>
					<p>기간별 가격:</p>
					<p>관련 정보:</p>
				</div>
			</div>
			
			<div class="status">
				<input type="button" value="거래중" onclick="">&nbsp;&nbsp;
				<input type="button" value="거래완료" onclick="">
			</div>		
			
		</div>
		
			<div class="back">
				<input type="button" value="목  록" onclick="">
			</div>
	</div>
	
	<footer><%@ include file="form\footer.jsp" %></footer>	
</body>
</html>