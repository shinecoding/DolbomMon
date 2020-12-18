<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87&libraries=services"></script>
<script>
$(function(){
	
	//비밀번호 입력 확인
	$("#editFrm").submit(function(){
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력하세요.");
			$("#userpwd").focus();
			return false;	
		}
		if($("#userpwdChk").val()==""){
			alert("비밀번호 다시 한번 입력하세요.");
			$("#userpwdChk").focus();
			return false;
		}
		if($("#userpwd").val()!=$("#userpwdChk").val()){
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			$("#userpwd").focus();
			return false;	
		}
		return true;
	});
	
	$("#zipcodeBtn").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            $("#zipcode").val(data.zonecode);
	            $("#addr").val(data.address);
	           
	            var geocoder = new kakao.maps.services.Geocoder();
	            
	            geocoder.addressSearch(data.address, function(result, status) {
	                // 정상적으로 검색이 완료됐으면 
	                 if (status === kakao.maps.services.Status.OK) {
	                	$("#lng").val(result[0].x);
	                	$("#lat").val(result[0].y);
	                } 
	            });
	           	window.close();
	        },theme:{
	        	searchBgColor: "#ffc207", //검색창 배경색
	            queryTextColor: "#FFFFFF" //검색창 글자색
	        }
	    }).open();
	});
});

</script>
<style>
	.container{
		width: 800px;
		margin: 0 auto;
	}
	#top{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#tel1{
		position: relative;
	}
	#zipcodeDiv{
		width: 800px;
	}
	#zipcode{
		width: 70%;
	}
	#zipcodeBtn{
		position: absolute;
		top: 0px;
		width:27%;
		float: right;
		right: 15px;"	
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<div class="container">
	<div id="top">
		<b>회원정보 수정</b>
	</div>
	<form method="post" id="editFrm" action="identityEditOk">
		<c:forEach var="vo" items="${list}">
			<div class="form-group row">
				<label for="userid" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control" id="userid"  name="userid" value="${vo.userid}">
				</div>
			</div>
			<div class="form-group row">
				<label for="pwdText" class="col-sm-2 col-form-label">비밀번호 변경</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="userpwd" name="userpwd" maxlength="30">
			</div>
			</div>
			<div class="form-group row">
				<label for="pwdText" class="col-sm-2 col-form-label">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="userpwdChk" maxlength="30">
				</div>
			</div>
			<div class="form-group row">
				<label for="emailText" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control" id="email" name="email" value="${vo.email}" maxlength="50">
				</div>
			</div>
			<div class="form-group row">
				<label for="telText" class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="tel1" name="tel1" value="${vo.tel1}" maxlength="20">
				</div>
			</div>
			<div class="form-group row" id="zipcodeDiv">
				<label for="zipcode" class="col-sm-2 col-form-label">우편번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="zipcode" name="zipcode" value="${vo.zipcode}">
					<input type="button" class="form-control btn-warning" id="zipcodeBtn" name="zipcodeBtn" value="우편번호 검색">			
				</div>
				<br/>
			</div>
			<div class="form-group row">
				<label for="addrText" class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="addr" name="addr" value="${vo.addr}">
				</div>
			</div>
			<div class="form-group row">
				<label for="addrText" class="col-sm-2 col-form-label">상세주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="addrDetail" name="addrDetail" value="${vo.addrDetail}" maxlength="100">
				</div>
			</div>
			<div>
				<br/>
				<input type="submit" class="btn btn-warning btn-lg btn-block" value="회원정보 수정"/><br/>
			</div>
		</c:forEach>
	</form>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>