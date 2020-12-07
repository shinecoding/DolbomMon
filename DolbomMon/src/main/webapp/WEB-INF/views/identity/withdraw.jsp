<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 신청</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 800px;
		margin: 0 auto;	
	}
	#top{
		margin: 0px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#logoLink{
		padding: 30px;
		width: 50%;
		display: block;
		margin: 0 auto;
	}
	#infoBox{
		margin: 0 auto;
		border: gray solid 1px;
		width: 550px;
		line-height: 28px;
		height: 200px;
		font-size: 0.8em;
		color: gray;
	}
</style>
</head>
<body>
<div class="container">
	<div>
		<a href="/dbmon"><img src="<%=request.getContextPath()%>/img/newLogo.png" id="logoLink" align="middle"/></a>	
	</div>
	<div id="top">
		<h5><b>회원탈퇴 전 꼭 확인해주세요!</b></h5>
		<h6 style="color: gray";><br/><b>아래의 사유로 탈퇴를 원하시는 경우<br/>‘문의하기’버튼을 통해 먼저 연락주시기 바랍니다.</b></h6>
	</div>
	<div id="infoBox">
		<b>기존 계정을 버리고 새로운 계정으로 재가입 하려는 경우<br/>
		부모 또는 시터회원으로 회원 유형을 변경하고 싶은 경우.<br/>
		맘시터 유형을 잘못 선택한 경우. (대학생, 엄마, 선생님, 일반)<br/>
		아이디 수정 및 변경이 필요한 경우.<br/>
		패스워드 수정 및 변경이 필요한 경우.<br/>
		당분간 구직/ 구인 활동 계획이 없을 경우.<br/>
		문자 및 카톡이 너무 많이 와서 조치가 필요한 경우.<br/></b>
	</div>
	
	
	
	
	
	
</div>


</body>
</html>