<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장</title>
<script>
function sendSMS(pageName){

   console.log("문자를 전송합니다.");
   $("#smsForm").attr("action", pageName + ".do");
   $("#smsForm").submit();
}

</script>
<style type="text/css">
html {
   height: 100%;
}

body {
   margin: 0;
   height: 100%;
   background: #f5f6f7;
}

h5 {
   text-align: center;
}

#wrapper {
   position: relative;
   height: 100%;
}

#content {
   position: absolute;
   left: 50%;
   transform: translate(-50%);
   width: 460px;
}

h3 {
   margin: 19px 0 8px;
   font-size: 14px;
   font-weight: 700;
}

.box {
   display: block;
   width: 100%;
   height: 51px;
   border: solid 1px #dadada;
   padding: 10px 14px 10px 14px;
   box-sizing: border-box;
   background: #fff;
   position: relative;
}

.int {
   display: block;
   position: relative;
   width: 100%;
   height: 29px;
   border: none;
   background: #fff;
   font-size: 15px;
}


#phone_wrap {
   display: table;
   width: 100%;
}

#phone_certification {
   display: table-cell;
   width: 70%;
}

.in-line{
      width:100%;
      height:40px;
      display: table;
    }
    input{
      margin:0;
    }
    input[type="text"]{
      width:70%;
      height:100%;
      border:black;
      font-size:1em;
      padding-left: 5px;
      font-style: oblique;
      display:inline;
      outline-clolor : black;
      box-sizing: border-box;
      font-size:1.2em;
      

    }
    input[type=button]{
      width: 30%;
      height:100%;
      background-color: lightgray;
      border:black;
      background-color: white;
      font-size:1em;
      outline-clolor : black;
      display:inline;
      margin-left: -10px;
      box-sizing: border-box;
      font-size:1em;
      
    }
    input[type=button]:hover{
      background-color: lightgray;
    }

.btn_area {
   margin: 30px 0 91px;
}
.button1 {
   background-color: gray;
   color: white;
   border: 3px solid white;
   padding: 18px 0 15px;
   
   font-size:13px;
   width: 100%;   
}

#button2 {
   width: 100%;
   padding: 21px 0 17px;
   border: 0;
   cursor: pointer;
   color: white;
   background-color: #00AAFF;
   font-size: 20px;
   font-weight: 200;
}
</style>

</head>
<body>
   <header><%@ include file="form/login_header.jsp"%></header>
   
   <div id="wrapper">
      <h5>
         Step2. 가입시 입력하셨던 핸드폰번호를 입력해주세요. <br>
      </h5>
      
      <div id="content">
         <div>
            <h3 class="USER_PHONE">
               <label for="USER_PHONE">휴대전화번호</label>
            </h3>
               <span class="box"> 
                  <select id="phone_contury"   class="sel">
                     <option value="00">대한민국 +82</option>
                     <option value="01">미국 +1</option>
                     <option value="02">독일 +49</option>
                     <option value="03">호주 +61</option>
                     <option value="04">영국 +44</option>
                  </select>
               </span>
            <br>
         </div>
         <form method ="post" id="smsForm">
            <input type="text" id="pnNum" name="from" placeholder="전화번호 입력" required>
            <!-- <input type ="button"  onClick="sendSMS('sendSms')" value="전송하기" ></li> -->
            <input type ="button" id="send-sms-btn" value="전송하기jm" ></li>            
         </form>
            <br>
         <div id="phone_wrap">
            <div id="phone_certification">
               <br>
               <input type="text" id="AuthNum" id="AuthNum" name="AuthNum" placeholder="인증번호 6자리 입력" required>         
                                            
            </div>
         </div>
         <br>
         <br>
         <div class="btn_area">
             <!-- <input type ="button" id="button2" value = "확인" onClick="login_find_pw_input_email.jsp"> -->
              <input type ="button" id="check-sms-num-btn" value = "확인jm">
         </div>
      </div>
         
      </div>
      <footer><%@ include file = "form/footer.jsp" %></footer>
      
      <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
      crossorigin="anonymous"></script>
      
      <script>
         var checkingSMSNumber=0;
         $(document).ready(function(){
            $('#send-sms-btn').on('click',function(){
               $.ajax({
                  url:'./checkSMSNum',
                  data:{
                     tel:''
                  },
                  type:'get',
                  success:function(result){
                     
                  },
                  error:function(err){
                     
                  }
               })
            });
            
            
            $('#send-sms-btn1').on('click',function(){
               var tel = $('#pnNum').val();
               //ajax 요청
               $.ajax({
                  url:'./checkSMSNum',
                  data:{
                     tel:tel
                  },
                  type:'get',
                  success:function(result){
                     if(result != 'fail'){
                        //정상적인 번호 
                        checkingSMSNumber = result;
                     }else{
                        //실패함 벡엔드 실패
                        checkingSMSNumber=0;
                        alert('인증번호를 다시 보내주세요');
                     }
                  },
                  error:function(err){
                     
                  }
               })
            });
            
            
            $('#check-sms-num-btn').on('click',function(){
               var authNum = $('#AuthNum').val();
               if(checkingSMSNumber==authNum){
                  //인증번호일치 -> 페이지 이동
                  location.href='./login_find_pw_input_email.jsp';
               }else{
                  //인증번호 일치 실패 
                  alert('인증번호가 일치하지 않습니다.');
               }
            });
         });
      </script>
      
      
</body>
</html>