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
	/* ============= 초기화 ==============  */
	*{margin:0; padding:0; list-style:none; text-decoration:none;}
	.container{width:600px;}
	/* ============= 초기화 ==============  */
	/* ============= 헤더 =============== */
	#header{width:100%; height:100px;}
	#header img{height:100%; text-align:center;}
	#header span{text-align:center; font-size:3em; }
	/* ============= 헤더 =============== */
	/* ============= 돌봄 유형 목록 ============== */
	/* .list-group>li{width:20%; height:50px; margin:5px;} */
	/* ============= 돌봄 유형 목록 ============== */
</style>
</head>
<body>
	<div class="container">
		<div id="header">
			<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/logo.png"/></a>
			<span>어떤 돌봄을 원하세요?</span>
		</div>
		<ul class="list-group">
			<li class="list-group-items">실내놀이</li>		
			<li class="list-group-items">등하원 돕기</li>		
			<li class="list-group-items">영어놀이</li>		
			<li class="list-group-items">한글놀이</li>		
			<li class="list-group-items">학습지도</li>		
			<li class="list-group-items">야외활동</li>		
			<li class="list-group-items">밥 챙겨주기</li>		
			<li class="list-group-items">책읽기</li>		
		</ul>
		<!-- <div id="activityDiv">
			<input type="radio" name="" id="1" value="실내놀이"/>
			<input type="radio" name="" id="2" value="등하원 돕기"/>
			<input type="radio" name="" id="3" value="영어놀이"/>
			<input type="radio" name="" id="4" value="한글놀이"/>
			<input type="radio" name="" id="5" value="학습지도"/>
			<input type="radio" name="" id="6" value="야외활동"/>
			<input type="radio" name="" id="7" value="밥 챙겨주기"/>
			<input type="radio" name="" id="8" value="책읽기"/>
			<label for="1" >실내 놀이</label>
			<label for="2" >등하원 돕기</label>
			<label for="3" >영어놀이</label>
			<label for="4" >한글놀이</label>
			<label for="5" >학습지도</label>
			<label for="6" >야외활동</label>
			<label for="7" >밥 챙겨주기</label>
			<label for="8" >책읽기</label>
		</div> -->
	</div>
</body>
</html>