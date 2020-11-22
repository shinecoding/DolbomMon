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
   <div>마이페이지</div>
   <ul class="list-group">
   		<li class="list-group-item list-group-item-action"><a href="teacherApplyHistory">내 구직현황</a></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherHeart">찜한 일자리</a></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherView">내 프로필 보기</a></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherEdit">내 프로필 수정</a></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherProof">인증 관리</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">활동내역</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">신고내역</a></li>
   </ul>
   <br/>
   <ul class="list-group" style="background-color: gray">
   		<li class="list-group-item list-group-item-action"><a href="#">결제내역</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">공지사항</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">계정관리</a></li>
   </ul>
</div>

</body>
</html>

