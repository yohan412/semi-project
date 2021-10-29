<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">

    <title>사업자 등록</title>
    
    <style>
    	div{
    		text-align:center;
    	}
        #wrap{
            width:100%;
            margin:auto;
            margin-left:auto; 
            margin-right:auto;
            text-align : center;
            
        }
        form{
        	display:inline-block;
        }
        h2{
        	text-align:center;
        }
        table{
            border:1px solid white;
        }
        
        td{
            border:1px solid white;
        }
        
        #title{
            background-color:white;
        }
         .button1{
			background-color : #00AAFF;
			color : white;
			float : right;
			border:3px solid white;
			
	}
		.button2{
			background-color : #00AAFF;
			color : white;
			float: right;
			border:3px solid white
			
		}
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    	
    </script>
</head>
<body>
	<header><%@ include file = "form/header.jsp" %></header>
    <div id="wrap">
        <h2>사업장 등록</h2>
        <hr>
        <br>
        <br>
        
         <form action="CenterController?command=join_biz&userno=${dto.userno }" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td id="USER_NAME">사업자명</td>
                    <td>
						<input type="text" name="usernm" id="USER_NAME" value="${ dto.username }">
					</td>
                </tr>
                <tr>
                    <td id="BIZ_NAME">사업장명</td>
                    <td>
					<input type="text" name="biznm" placeholder="사업장명을 작성해주세요">
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_ADDRESS">주소</td>
                    <td>
						<input type="text" name="bizaddr" placeholder="사업장 주소를 작성해주세요">
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_CATEGORY">사업장 종류</td>
                    <td>
						<input type="checkbox" name="health" value="health">헬스
						<input type="checkbox" name="pilates" value="pilates">필라테스
						<input type="checkbox" name="yoga" value="yoga">요가
						<input type="checkbox" name="etc" value="etc">기타      
		             </td>
                </tr>
                <tr>
                    <td id="BIZ_CONTENT">기타</td>
                    <td>
						<textarea name="bizcontent" placegolder="기타내용을 입력해주세요"></textarea>
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_PIC">사업자 등록증 첨부</td>
                    <td>
                        <input type="file" name="imgfile" accept=".jpg,.jpeg,.png,.gif">
                    </td>
                </tr>
             </table>
         
        
        	<div class = "button">
					<input type="submit" value="사업자 등록" class="button1">	
					<p>
					<input type="button" value="취소" class="button2">
			</div>
		</form>
        
    </div>
    
    <footer><%@ include file = "form/footer.jsp" %></footer>
    
</body>
</html>
