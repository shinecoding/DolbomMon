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
		width: 900px;	
	}
	#top{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#userBox{
		margin: 0px auto;
		width: 500px;
	}
	#typeBox, #idBox, #telBox{
		margin: 0px auto;
		float: left;
		width: 500px;
		
		padding: 10px;
	}
	.positionDiv{
		
		width: 300px;
		padding: 5px;
	}
	.positionBox{
		posotion: relative;
		width: 300px;
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
		 		<div class="positionBox"><b>회원 유형</b></div>
		 		<c:if test="${vo.who=='T'}">
		 			<div class="positionDiv">선생님 맘시터</div>
		 		</c:if>
		 		<c:if test="${vo.who!='T'}">
		 			<div class="positionDiv">부모님 회원</div>
		 		</c:if>
		 	</div>
			<div id="idBox">
		 		<div class="positionBox"><b>사용중인 아이디</b></div>
		 		<div class="positionDiv">${vo.userid}</div>
		 	</div>	
			<div id="telBox">
		 		<div class="positionBox"><b>가입한 휴대폰 번호</b></div>
		 		<div class="positionDiv">${vo.tel1}</div>
		 	</div>	
		
		</c:forEach>
	</div>
</div>
</body>
</html>