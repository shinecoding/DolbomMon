<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script>
	$(function(){
		
		$(document).ready(function(){
			$("#userid").val(opener.document.getElementById('userid').value);	
			
		});
		
		$("#userid").keyup(function(){
			var userid = $(this).val();
			var useridReg = /^[A-Za-z]{1}\w{7,11}$/;
			$("#idStatus").val("N");
			$("#idUseBtn").css("display", "none");
			$("#idStatus").val("N");
			if(!useridReg.test(userid)){
				$("#useridRegChk").html("시작문자는 영문자, 아이디는 8~14글자의 영문,숫자,_만 입력가능").css("color", "#ff0000");
			}else{
				$("#useridRegChk").html("사용가능한 아이디 입니다.").css("color", "green");
			}
		});
		
		$("#idChkBtn").click(function(){
	        //userid 를 param.
	        var userid = $("#userid").val();
	        console.log("userid => " + userid);
	        $.ajax({
                url:"idCheckAjax",
                type:"post",
                data:{userid: $("#userid").val()
                     },
              success:function(result){
            	  if(result==1){
            		  alert("이미 사용중인 아이디입니다.");
            	  }else if(result==0){
            		  alert("사용가능한 아이디입니다.");
            		  $("#idUseBtn").css("display", "block");
            	  }
                }, error:function(){
                   
                }
             });
	    });
		
		$("#idUseBtn").click(function(){
			$("#idStatus", opener.document).val("Y");
			self.close();
		});
		
	});
</script>
<style>
	#mainDiv{text-align:center; margin-top:30px;}
	#mainDiv>div{display:inline-block; width:60%; margin-top:20px;}
	#mainDiv>div>span{float:left;}
	#mainDiv>div input[type=text]{width:100%;}
	#mainDiv>div input[type=button]{width:100%; margin-top:20px;}
</style>
</head>
<body>
	<div id="mainDiv">
		<h3>아이디 중복검사</h3>
		<div>
			<span>사용할 아이디</span><span style="font-size:13px;" id="useridRegChk"></span><br/>
				<input type="text" name="userid" id="userid" value="" />
				<input type="button" id="idChkBtn" value="아이디 중복검사" />
				<input type="button" id="idUseBtn" value="사용하기" style="display:none;"/>
				<input type="hidden" id="idStatus" value="N" />
		</div>
	</div>
</body>
</html>