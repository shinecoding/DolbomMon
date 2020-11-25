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
 	input[type=submit]{margin:20px 0; background-color:#ff5400; color:#EFEFEF}
</style>
<script>
	$(function(){
		
	});
	
	function nextTime(){
		location.href="<%=request.getContextPath()%>/dbm/introduce";
	}

</script>

</head>
<body>
	<form action="<%=request.getContextPath()%>/dbm/introduce">
	<div class="container">
		<h3>내 프로필 사진<span>(선택사항)</span></h3>
		<div id="imgDiv">
			<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/join/sitter-join-student.svg" />
			<img id="plusBtn"src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/profile/profile-add-bt.svg" />
		</div>
		<p>내 사진을 올리면 부모회원의 선택을 <span>5배 더 많이</span> 받을 수 있습니다.</p>		
		<input type="submit" value="지금 올리기" />
		<input type="button" value="나중에 하기" onclick="nextTime();"/>
	</div>
	</form>
</body>
</html>