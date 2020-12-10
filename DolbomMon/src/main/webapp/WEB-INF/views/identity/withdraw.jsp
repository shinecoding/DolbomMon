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
<script>
	$(function(){
		//데이터 입력유무 확인
		$("#withdrawForm").submit(function(){
			if($("#withdrawBox").val()==""){
				alert("탈퇴 사유를 작성해주세요.");
				$("#withdrawBox").focus();
				return false;	
			}
		});	
	});
</script>
<style>
	.container{
		width: 800px;
		margin: 0 auto;	
	}
	#top{
		margin: 0px;
		padding: 30px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#infoBox{
		padding: 15px;
		margin: 0 auto;
		border: lightgray solid 1px;
		width: 530px;
		line-height: 28px;
		height: 230px;
		font-size: 0.8em;
		color: gray;
	}
	#askBtn{
		margin: 0 auto;
		width: 92px;
	}
	#infoTime{
		font-size: 0.7em;
		color: gray;
		text-align: center;
	}
	#checkDiv{
		text-align: center;
	}
	.checkList{
		width: 530px;
		font-size: 0.8em;
		color: gray;
		margin: 0 auto;
	}
	.form-group{
		margin: 0 auto;
		width: 760px;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<div class="container">
	<hr/>
	<div id="top">
		<h5><b>회원탈퇴 전 꼭 확인해주세요!</b></h5>
		<h6 style="color: gray";><br/><b>아래의 사유로 탈퇴를 원하시는 경우<br/>‘문의하기’버튼을 통해 먼저 연락주시기 바랍니다.</b></h6>
	</div>
	<div id="infoBox">
		<b>✔ 기존 계정을 버리고 새로운 계정으로 재가입 하려는 경우<br/>
		✔ 부모 또는 시터회원으로 회원 유형을 변경하고 싶은 경우.<br/>
		✔ 돌봄몬 유형을 잘못 선택한 경우. (대학생, 엄마, 선생님, 일반)<br/>
		✔ 아이디 수정 및 변경이 필요한 경우.<br/>
		✔ 패스워드 수정 및 변경이 필요한 경우.<br/>
		✔ 당분간 구직/ 구인 활동 계획이 없을 경우.<br/>
		✔ 문자 및 카톡이 너무 많이 와서 조치가 필요한 경우.<br/></b>
	</div>
	<div id="askBtn">
		<br/>
		<button class="btn btn-outline-secondary">문의하기</button>	
	</div>
	<div id="infoTime">
	<br/>
		운영시간 평일 10:00 ~ 18:00<br/>
		(점심시간 12:00 ~ 13:00 제외 | 주말, 공휴일 제외)
	</div>
	<div id="checkDiv">
	<hr/>
		<h6 style="color: gray;"><br/><b>위 내용을 잘 확인하셨나요?</b></h6>
		<h5><b>돌봄몬 탈퇴신청을 하시겠습니까?</b></h5>
	</div>
	<br/>
	<div class="checkList">
		‣ 회원 탈퇴 요청 시 고객관리팀이 지난 활동 내용을 검토 후, 탈퇴처리가 진행됩니다.<br/>
		‣ 회원 탈퇴 처리가 완료되면, 약관에 따라 데이터가 삭제되며 복구되지 않습니다.
	</div>
	<br/>
	<form id="withdrawForm" method="post" action="withdraw">
		<div class="form-group">
		    <label for="reasontoleave"><b>탈퇴 사유</b></label>
		    <input type="text" class="form-control" id="reasontoleave" name="reasontoleave" aria-describedby="emailHelp" placeholder="탈퇴 사유를 적어주세요.">
	 	</div>
	 	<div class="checkList">
		 	<br/>
		 	알려주신 소중한 내용으로 더 좋은 돌봄몬 서비스를 만들 수 있도록 노력하겠습니다.
		 	<br/>
	 	</div>
	 	<br/>
	 	<input type="submit" class="btn btn-warning btn-block" value="탈퇴 신청"/><br/>
	</form>
</div>
</body>
</html>