<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정관리</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 700px;	
	}
	#top{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#userBox{
		margin: 0 auto;
		width: 500px;
	}
	#typeBox, #idBox, #telBox{
		margin: 0 auto;
		float: left;
		width: 500px;
		
		padding: 5px;
	}
	.positionDiv{
		width: 300px;
		padding: 5px;
	}
	.positionBox{
		position: relative;
		width: 300px;
		padding: 5px;
		color: gray;
	}
	#space{
		margin: 0 auto;	
		width: 700px;
		height: 15px;
		background-color: lightgray;
		position: absolute;
		top: 350px;
	}
	.list-group1{
		position: absolute;
		top: 363px;
		width: 700px;
	}
</style>
</head>
<body>
<div class="container">
	<div id="top">
	<b>계정관리</b>
	</div>
	<div id="userBox">
		<c:forEach var="vo" items="${list}">
		 	<div id="typeBox">
		 		<div class="positionBox">회원 유형</div>
		 		<c:if test="${vo.who=='T'}">
		 			<div class="positionDiv">선생님 맘시터</div>
		 		</c:if>
		 		<c:if test="${vo.who!='T'}">
		 			<div class="positionDiv">부모님 회원</div>
		 		</c:if>
		 	</div>
			<div id="idBox">
		 		<div class="positionBox">사용중인 아이디</div>
		 		<div class="positionDiv">${vo.userid}</div>
		 	</div>	
			<div id="telBox">
		 		<div class="positionBox">가입한 휴대폰 번호</div>
		 		<div class="positionDiv">${vo.tel1}</div>
		 	</div>	
		
		</c:forEach>
		
	</div>
	<div id="space"></div>
	<div class="list-group1">
		<a href="#" class="list-group-item list-group-item-action"><b>회원정보 수정</b></a>
		<a href="#" class="list-group-item list-group-item-action"><b>회원 탈퇴 신청</b></a>
		<a href="#" class="list-group-item list-group-item-action"><b>돌봄몬 서비스 이용동의</b></a>
	</div>

	
</div>
</body>
</html>