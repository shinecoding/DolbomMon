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
	.container{width:700px; text-align:center;}
	
	h4{margin:100px 0 30px 0;}
	h4>span{color:lightblue; font-size:18px; line-height:28px;}
	
	textarea{
		display:inline-block; 
		width:90%; 
		overflow:hidden; 
		height:200px; 
		font-size:15px;
		resize:none; 
		background-color:#EFEFEF; 
		border:1px solid gray; 
		border-radius:5px;
		padding:5px 10px;
	}
	#warningDiv{width:100%; overflow:hidden; height:auto;}
	#warningDiv img{width:17px; height:17px;}
	#warningDiv p{display:inline-block; width:auto; font-size:13px; color:gray; margin:0;}
	
	input[type=submit]{width:90%; height:40px; margin:30px 0; background-color:orange; border:1px solid gray; color:#EFEFEF; border-radius:10px;}
</style>
<script>
	
</script>
</head>
<body>
	<div class="container">
		<form method="post" action="<%=request.getContextPath()%>/regForm">
		
			<h4>간단 자기소개<span>(선택사항)</span></h4>
			<textarea name="intro" placeholder="간단한 자기소개 작성 시 부모님에게 2배 더 많은 신청을 받게 됩니다."></textarea>
			<div id="warningDiv"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/s-membership-09-nono-icon.svg"/><p>자기소개 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</p></div>
			<input type="submit" class="btn" value="다음"/>
		</form>
	</div>
</body>
</html>