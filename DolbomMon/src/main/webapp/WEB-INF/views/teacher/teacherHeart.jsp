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
	img{ height:90px; width:90px;}
	.container{background-color: yellow;}
	.card-header{background-color:white;}
	h1{text-align:center;}
</style>
</head>
<body>
	<div class="container">
	
	<div class="card">
	<div class="card-header">
	<h4 class="card-title">찜한 일자리 <span>1명</span></h4>
	</div>
	<div class="card-body">
	<div class="mb-3"><i class="fas fa-circle"></i>전체 <i class="fas fa-circle"></i>구인중 일자리만
	<span class="float-right">찜한 순<i class="fas fa-angle-down"></i></span>
		<ul class="list-group"></div>
			<li class="list-group-item">
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item border-0 col-2">
						<img src="img/profilepic.jpeg" class="rounded-circle"/><br/>
						<span class="badge badge-warning badge-pill" ><span>0</span>명 지원</span>
					</li>
					<li class="list-group-item border-0 col-10">
						<h6><b>신생아 1명, 유아 1명</b> | 3분전</h6>
						<h6><b>아이가 좋아하는 놀이를 같이해줄 돌봄몬 찾습니다.</b></h6>
						<h7>경북 구미시 | 홍O동 | 11/18 시작</h7>
						<h6><i class="fas fa-coins"></i>희망 시급 10,000원 <b>협의가능</b></h6>
					</li>
				</ul>
			<hr/>
			
			<div class="float-left">
				단기 - 12 동안
		</div>
		<c:forEach var="day" items="월, 화, 수, 목, 금, 토, 일">
			<div class="badge badge-warning badge-round">${day}</div>
		</c:forEach>
		<div class="float-right"><i class="far fa-trash-alt"></i></div>
	</ul>
	<br/>
	</div>
	</div>
	</div>
</body>
</html>