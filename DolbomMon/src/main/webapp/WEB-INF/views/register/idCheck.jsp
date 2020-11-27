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
			$("#getUserid").val(opener.document.getElementById('userid').value);	
			
		});
		
		$("#idChkBtn").click(function(){
	        //userid 를 param.
	        var userid = $("#getUserid").val();
	        $.ajax({
	            url : "idChk",
	            type : 'post',
	            data : userid,
	            success : function(result) {
	               console.log("result =>" + result);
	            },
	            error : function(error) {
	                alert("error : " + error);
	            }
	        });
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
			<form method="post" action="<%=request.getContextPath()%>/idChk">
				<input type="text" name="getUserid" id="getUserid" value="" />
				<input type="button" id="idChkBtn" value="아이디 중복검사" />
				<input type="button" id="idUseBtn" value="사용하기"/>
			</form>
		</div>
	</div>
</body>
</html>