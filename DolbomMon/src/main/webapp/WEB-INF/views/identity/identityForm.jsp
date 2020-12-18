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
		width: 800px;
		margin: 0 auto;	
	}
	#topidenty123{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#userBox{
		margin: 0 auto;
		width: 800px;
		float: left;
	}
	#typeBox{
		float: left;
		margin-left: 140px;
		width: 230px;
		padding: 5px;
	}
	#catego{
		float: right;
		margin-right: 100px;
		width: 230px;
		padding: 5px;
	}
	.categoDiv{
		width: 300px;
		padding: 5px;
	}
	.typeDiv{
		position: relative;
		width: 300px;
		padding: 5px;
		color: gray;
	}
	#space{
		margin: 0 auto;	
		width: 800px;
		height: 15px;
		background-color: gold;
		position: absolute;
		top: 480px;
	}
	.list-group1234{
		position: absolute;
		top: 494px;
		width: 800px;
	}
	#logoLink{
		padding: 30px;
		width: 50%;
		display: block;
		margin: 0 auto;
	}
	.ml-1, .mx-1 {
		  margin-left: 10px!important;
		  font-weight:bold;
		  font-size:11px;
		  margin-top:0px!important;
	}

</style>
</head>
<body>
<div id="top">
	<%@include file="/WEB-INF/views/top.jsp"%>
</div>
<div class="container">
	
	<div id="topidenty123">
		<b>계정관리</b>
	</div>
	<c:forEach var="vo" items="${list}">
		<div id="userBox"  style="border:3px solid gold; border-radius:18px;">		
		 	<div id="typeBox">
		 		<div class="typeDiv">회원 유형</div>
		 		<div class="typeDiv">사용중인 아이디</div>
		 		<div class="typeDiv">가입한 휴대폰 번호</div>
		 	</div>	
		 	<div id="catego">
			 	<c:if test="${vo.who=='T'}">
			 		<div class="categoDiv">선생님 맘시터</div>
			 	</c:if>
		 		<c:if test="${vo.who!='T'}">
		 			<div class="categoDiv">부모님 회원</div>
		 		</c:if>
		 		<div class="categoDiv">${vo.userid}</div>
		 		<div class="categoDiv">${vo.tel1}</div>
		 	</div>	
		</div>
	</c:forEach>
	<div id="space"></div>
	<div class="list-group1234">
		<a href="identityEdit" class="list-group-item list-group-item-action"><b>회원정보 수정</b></a>
		<a href="withdrawForm" class="list-group-item list-group-item-action"><b>회원 탈퇴 신청</b></a>
		<a href="#" class="list-group-item list-group-item-action"><b>돌봄몬 서비스 이용동의</b></a>
	</div>
</div>
<div id="footer123123">

</div>
</body>
</html>

