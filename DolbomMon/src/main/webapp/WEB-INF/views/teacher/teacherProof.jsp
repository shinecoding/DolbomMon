<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
	#title{
		margin:20px 5px;
		display:block;
	width:100%;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	
	.container{width:800px;}
	h4{text-align:center; line-height:40px;}
	.leftPanel{
	float:none
	}
	h9{text-align:center;}
	.row{margin:0 auto;}
</style>
</head>
<body>
<div class="container">
	<div id="title">
   		<div id="titlefont">내 인증 관리</div>
 	</div>
	<ul class="list-group-horizontal">
		
		<li class="list-group-item">
			<div class="row">
				<div class="col-2">
					<div class="row">
						<span class="fa-stack fa-2x">
							<i class="fas fa-circle fa-stack-2x"></i>
							<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
						</span>
					</div>
					<div class="row">
					<h9>등초본뱃지</h9>	
					</div>
				</div>
				<div class="col-7">
				
					<div class="row">
						<h7><b>등초본인증</b></h7>
					</div>
					<div class="row">
						주민등록등/초본으로 내 상태를 인증받으세요.
					- 발급일 6개월 이내만 유효
					</div>
				</div>
				<div class="col-3">
					<button class="btn btn-warning float-right">인증받기</button>
				</div>
				
			</div>
			
		</li>
	</ul>
	
	<ul class="list-group-horizontal">
		
		<li class="list-group-item">
			<div class="row">
				<div class="col-2">
					<div class="row">
						<span class="fa-stack fa-2x">
							<i class="fas fa-circle fa-stack-2x"></i>
							<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
						</span>
					</div>
					<div class="row">
					<h9>학교뱃지</h9>	
					</div>
				</div>
				<div class="col-7">
				
					<div class="row">
						<h7><b>학교 인증</b></h7>
					</div>
					<div class="row">
						재학/휴학/재적/졸업/수료 증명서
					- 발급일 1년 이내만 유효
					(졸업증명서 경우, 발급일 상관없음)
					</div>
				</div>
				<div class="col-3">
					<button class="btn btn-warning float-right">인증받기</button>
				</div>
				
			</div>
			
		</li>
	</ul>
	</div>
</body>
</html>