<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script>
$(document).ready(function() {

    $("#send").click(function() {
       
       	var number = Math.floor(Math.random() * 100000) + 100000;
      	if(number>100000){
        	number = number - 10000;
        }

        $("#text").val(number); 
       
      	var to = $("#to").val();
       
       	if(to == "" || to == null){
          	alert("-를 제외하고 입력해주세요");
       	} else {
			var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");
          
       		if(con_test == true){
               $.ajax({
                   url:"sendSms",
                   type:"post",
                   data:{to: $("#to").val(),
                        text: $("#text").val()
                        },
                 success:function(){
                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
                   }, error:function(){
                      
                   }
                });
          	}else{
        	  
          	}
      	}   
    });
    
	$("#enterBtn").click(function() {  
		var userNum = $("#userNum").val();
       
       	var sysNum = $("#text").val();         
       
       	if(userNum == null || userNum == ""){
          	alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       	}     
       	else{     
          	if(userNum.trim() == sysNum.trim()){
          		
           	}
           	else {
           		alert("인증번호를 다시 확인해주세요");
           	}          
       	}
  	});
});
</script>
<style>

</style>
</head>
<body>

<div id="contents"> 
<form action="#" method="post">
      받는사람 : <input type="text" id="to" name="to"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
    <input type="button" id="send" value="전송"/><br> <!-- 문자보내는 전송버튼 -->
     인증번호 :    <input type="text" id="userNum">   <!-- 인증번호 입력창 -->
  <input type="button" id="enterBtn" value="확인">   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
  
  
  <input type="hidden" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
 
</form>  
</div>

</body>
</html>
