<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 정보</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 800px;
	}	
	#top{
		margin: 15px;
		margin-top: 40px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	
</style>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
<div id="top">
<b>계정 정보</b>
</div>
<div>
	입력한 정보로 가입한 계정 정보입니다. 임시 비밀번호 발급이 필요한 경우, '임시 비밀번호 받기' 버튼을 클릭해주세요.
	임시 비밀번호를 가입하신 이메일로 전송해드립니다.<br/>
	<b>(비밀번호 변경은 로그인후 [마이페이지 -> 비밀번호변경] 에서 가능합니다.</b><br/>
</div>
	<br/><label>아이디: <b>${logVO.userid}</b></label><br/>
	<form method="post" action="temporaryPwd">
		<input type="hidden" name="userid" id="userid" value="${logVO.userid}">
		<input type="hidden" name="username" id="username" value="${logVO.username}">
		<input type="hidden" name="birth" id="birth" value="${logVO.birth}">
		<input type="hidden" name="tel1" id="tel1" value="${logVO.tel1}">
		<input type="hidden" name="email" id="email" value="${logVO.email}">
		<br/><input type="submit" class="btn btn-warning btn-lg btn-block" value="임시 비밀번호 발급"/>
		<br/><a class="btn btn-outline-warning btn-lg btn-block" href="/dbmon" role="button">돌아가기</a>	
	</form>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>