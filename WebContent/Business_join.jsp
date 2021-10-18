<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<html>
<head>
    <title>회원가입 화면</title>
    
    <style>
    	div{
    		text-align:center;
    	}
        #wrap{
            width:80%;
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
</head>
<body>
	<header><%@ include file = "form/header.jsp" %></header>
    <div id="wrap">
        <h2>사업장 등록</h2>
        <hr>
         <form>
            <table>
                <tr>
                    <td id="USER_NAME">아이디</td>
                    <td>
						<input type="text" name="USER_NAME" id="USER_NAME" placeholder="사업자명을 작성해주세요">
                </tr>
                <tr>
                    <td id="BIZ_NAME">사업장명</td>
                    <td>
					<input type="text" name="BIZ_NAME" placeholder="사업장명을 작성해주세요">
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_ADDRESS">주소</td>
                    <td>
						<input type="text" name="BIZ_ADDRESS" placeholder="사업장 주소를 작성해주세요">
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_CATEGORY">사업장 종류</td>
                    <td>
						<input type="checkbox" name="health" value="health">헬스
						<input type="checkbox" name="pilates" value="pilates">필라테스
						<input type="checkbox" name="yoga" value="yoga">요가
						<input type="checkbox" name="health" value="health">기타      
		             </td>
                </tr>
                <tr>
                    <td>회원권 기간별 가격등록</td>
                    <td>
						<input type="text" placeholder="기간별 가격을 등록해주세요.">
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_CONTENT">기타</td>
                    <td>
						<input type="text" name="BIZ_CONTENT" placeholder="기타사항을 압력해주세요">
                    </td>
                </tr>
                <tr>
                    <td id="BIZ_PIC">사진첨부</td>
                    <td>
                        <input type="file" name="BIZ_PIC">
                    </td>
                </tr>
             </table>
         
        
        	<div class = "button">
					<input type="button" value="사업자 등록" class="button1">	
					<p>
					<input type="button" value="취소" class="button2">
			</div>
		</form>
        
    </div>
                	<footer><%@ include file = "form/footer.jsp" %></footer>
    
</body>
</html>
