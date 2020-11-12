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
</head>
<body>

<div class="container" style="background-color:lightblue;">
   <img src="img/profilepic.jpeg"/>
   <ul class="list-group">
   		<li class="list-group-item list-group-item-action">홍O동 일반맘시터</li>
   		<li class="list-group-item list-group-item-action">☆☆☆☆☆ 27세 no.798521</li>
   </ul>
   <br/>
   <ul class="list-group list-group-horizontal-sm">
   		<li class="list-group-item list-group-item-action">조회수<br/><div>129</div></li>
   		<li class="list-group-item list-group-item-action">프로필 작성<br/>3일 전</li>
   		<li class="list-group-item list-group-item-action">CCTV<br/>동의함</li>
   </ul>
   <ul class="list-group">
   	<li class="list-group-item">
   		본인 인증 완료
   		돌봄몬 고객안전관리팀에서 실명 / 생년월일 /  연락처를 확인하였습니다.
   	</li>
   	<h5>핵심인증</h5>
   	<li class="list-group-item">등초본 인증</li>
   	<li class="list-group-item">등초본 인증</li>
   	<h5>간단 자기소개</h5>
   	<li class="list-group-item">아직 작성하지 않았습니다.</li>
   	<h5>선호하는 돌봄유형</h5>
   	<li class="list-group-item">"저는 <span>놀이/학습</span>돌봄을 가장 선호해요"</li>
   	<h5>활동 가능 시간</h5>
   	<li class="list-group-item">스케쥴차트</li>
   	<h5>돌봄 가능 연령</h5>
   	<li class="list-group-item">
	   	<ul class="list-group list-group-horizontal-sm" >
		   	<li class="list-group-item">신생아</li>
		   	<li class="list-group-item">영아</li>
		   	<li class="list-group-item">유아</li>
		   	<li class="list-group-item">초등학생</li>
	   </ul>
   </li>
   <li class="list-group-item">
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item">실내놀이</li>
   			<li class="list-group-item">등하원돕기</li>
   			<li class="list-group-item">책읽기</li>
   			<li class="list-group-item">야외활동</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item">한글놀이</li>
   			<li class="list-group-item">영어놀이</li>
   			<li class="list-group-item">학습지도</li>
   			<li class="list-group-item">체육놀이</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item">간단 청소</li>
   			<li class="list-group-item">밥 챙겨주기</li>
   			<li class="list-group-item">간단 설거지</li>
   		
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item">장기입주</li>
   			<li class="list-group-item">단기입주</li>

   		</ul>
		<h5>활동 가능 지역</h5>
		<li class="list-group-item">1순위 서울특별시 마포구 마포동</li>
		
   		
   </li> 
   
</div>

</body>
</html>

