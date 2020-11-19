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
	/* ======================== 초기화 ===========================*/
	*{margin:0;padding:0;text-decoration:none;list-style:none;}
	.container{width:600px; padding:0;}
	/* ======================== 초기화 ===========================*/
	
	/* ======================== ㅎㄷ ===========================*/
	#headerDiv{width:100%; overflow:hidden; height:auto; margin: 30px 0; text-align:center;}
	span{display:inline-block; width:100%}
	#headerDiv span:nth-of-type(1){font-size:12px; color:gray;}
	#headerDiv span:nth-of-type(2){font-size:20px;}
	/* ======================== ㅎㄷ ===========================*/
	
	/* ======================== 시간 선택 ===========================*/
	#selectTimeDiv{width:100%; overflow:hidden; height:auto;}
	#selectTimeDiv div:nth-of-type(1){width:200px; overflow:hidden; height:auto; float:left;}
	#selectTimeDiv div:nth-of-type(2){width:200px; overflow:hidden; height:auto; margin:0;}
	#selectTimeDiv li{width:50%; hieght:24px; line-height:24px; text-align:center;float:left;}
	#selectTimeDiv li:nth-child(n+3){
		width:60px;
		height:60px; 
		line-height:60px;
		border:1px solid black; 
		border-radius:50%;
		margin:10px 20px;
		
	}
	img{height:240px; margin-top:24px; float:right;}
	/* ======================== 시간 선택 ===========================*/
	
	#selectTimeDiv div:nth-of-type(3){text-align:center; margin-top:30px}
	input[type=button]{display:inline-block; width:300px;}
</style>
<script>
	
	
	
	
	function nextPage(){
		location.href="<%=request.getContextPath()%>/parent/description";
	}
</script>
</head>

<body>
	<div class="container">
		<div id="headerDiv">
			<span>아직 정확한 시간 계획이 없더라도,</span>
			<span>만나보고 싶은 시간을 선택하면<br/>
			돌봄몬에게 지원을 받을 수 있습니다.</span>
		</div>
		<div id="selectTimeDiv">
			<div>
				<img src="https://momsitter-service.s3.ap-northeast-2.amazonaws.com/momsitter-app/static/public/form/p-signup-4-time-image@3x.png" />
			</div>
			<div>
				<ul>
					<li>평일</li>
					<li>주말</li>
					<li><label>낮</label></li>
					<li><label>낮</label></li>
					<li><label>저녁</label></li>
					<li><label>저녁</label></li>
					<li><label>밤</label></li>
					<li><label>밤</label></li>
				</ul>
			</div>
			<div>
			<input type="button" onclick="nextPage()" value="다음"/>
			</div>
		</div>
		<div></div>
	</div>
	
</body>
</html>