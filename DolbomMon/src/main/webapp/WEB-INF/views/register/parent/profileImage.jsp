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
<style>
	.container{width:600px; text-align:center; padding:0;}
	h3{display:inline-block; margin-top:50px;}
	h3>span{color:lightblue; font-size:17px; line-height:33px;}
 	#imgDiv{margin:20px 0;text-align:center;padding-left:40px;}
 	#plusBtn{position:relative; right:45px; top:40px; width:40px;height:40px;}
 	p{display:inline-block; width:40%; overflow:hidden; height:auto; font-size:15px;}
 	.container>input{width:70%; height:40px; border:1px solid #CCC; border-radius:10px;}
 	input[type=submit]:nth-of-type(1){margin:20px 0; background-color:#ff5400; color:#EFEFEF}
 	input[type=file]{display:none;}
</style>
<script>
	$(function(){
		$("#plusBtn").click(function(e){
			$("#pic").click();
		});
		
		
		$("#uploadFrm").submit(function(){
			var pic = $("#pic").val();
			if(pic==null || pic==""){
				alert("이미지를 설정해주세요");
				return false;
			}
			return false;
		});
	});
	
	function laterUpload(){
		location.href="<%=request.getContextPath()%>/";
	}

</script>

</head>
<body>
	<form id="uploadFrm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/dbm/profileImageOk">
			<input id="userid" type="hidden" name="userid" value="${userid }" />
			<input id="pic" type="file" name="pic" />
	<div class="container">
		<h3>내 프로필 사진<span>(선택사항)</span></h3>
		<div id="imgDiv">
			<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/join/sitter-join-student.svg" />
			<img id="plusBtn" style="cursor:pointer;" src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/profile/profile-add-bt.svg" />
		</div>
		<p>회원가입 완료하였습니다. 프로필 사진을 등록해주세요</p>		
		<input id="uploadSubmit" type="submit" value="지금 올리기" onclick="imgUpload();" />
		<input id="later" type="button" value="나중에 하기" onclick="laterUpload();"/>
	</div>
	</form>
</body>
</html>