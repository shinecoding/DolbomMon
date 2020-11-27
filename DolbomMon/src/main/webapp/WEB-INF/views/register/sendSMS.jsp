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
      	var telReg = /^01(?:0)\d{8}$/;
       	if(!telReg.test(to)){
          	alert("010으로 시작하는 전화번호만 인증가능합니다.");
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
          		alert("인증이 완료되었습니다.");
          		opener.document.getElementById("tel1").value = $("#to").val();
          		window.close();
           	}
           	else {
           		alert("인증번호를 다시 확인해주세요");
           	}          
       	}
  	});
});
</script>
<style>
	#contents{width:100%;}
	#contents div{text-align:center; margin-top:20px;}
	#telNum{display:inline-block; width:100%; margin:1%; }
	#tel{display:inline-block; width:20%;}
	#telChk{diplay:inline-block; width:80%;}
	input[type=button]{width:18%; margin:0 1%;}
	input[type=text]{width:78; margin:0 1%;}
	
</style>
</head>
<body>
	<div id="contents"> 
		<form action="#" method="post">
			<div>
				<h3 style="margin:0 auto;">휴대폰 본인인증</h3>
			</div>
			<div>
		 		<span id="tel">전화번호</span><span id="telChk"></span><br/>
		 		<input type="text" id="to" name="to" placeholder="전화번호 입력"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
			    <input type="button" id="send" value="전송"/><br> <!-- 문자보내는 전송버튼 -->
			</div>
			<div>
				<span id="telNum">인증번호</span><br/>
				<input type="text" id="userNum" placeholder="인증번호 입력">   <!-- 인증번호 입력창 -->
			  	<input type="button" id="enterBtn" value="확인">   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
			</div>
		    <input type="hidden" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
		</form>  
	</div>
</body>
</html>
