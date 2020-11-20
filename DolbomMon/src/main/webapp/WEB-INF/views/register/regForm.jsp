
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{width:700px;}
	.container div{width:100%; overflow:hidden; height:auto; margin-top:15px;}
	
	#headerDiv{text-align:center; }
	#headerDiv>img{width:400px; height:200px;} 	
	#headerDiv>h4{width:70%; margin:0 auto;}
	
	.container>div>label{display:inline-block; width:30%;float:left; margin:0;}
	.container>div>span{width:auto;height:20px;float:left;}
	.container>div>input{width:80%; height:50px; padding:5px 10px; float:left;}
	#emailDiv input:nth-of-type(1){width:25%;}
	#emailDiv input:nth-of-type(2){width:30%;}
	#emailDiv select{width:20%; height:50px; padding:5px 10px; margin-left:5px;}
	#emailDiv span{width:auto; height:20px; font-size:20px; line-height:50px; float:left; margin:0 5px;} 
	
	
	input[type=submit]{width:100%; height:40px; margin:30px 0;}
	
</style>
<script>
	$(function(){
		
		
		
		// 포커스 제거
		$(":focus").blur();
	});
	
	function formCheck(){
		
		// 아이디 정규식 첫번째글자 무조건 영문자 영어대소문자, 숫자, _, 8~14자리
		reg = /^[A-Za-z]{1}\w{7,13}$/;
		if(!reg.test(document.getElementById("userid").value())){
			alert("아이디가 적합하지 않습니다.");
			return false;
		}
		
		reg = /^[가-힣]{2,7}$/;
		if(!reg.test(document.getElementById("username").value())){
			alert("이름은 한글 2~7글자까지만 허용됩니다.")
			return false;
		}
		
		reg = /^\w{8,20}[@][a-zA-Z]{4,20}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		var email1 = document.getElementById("email1").value();
		var email2 = document.getElementById("email2").value();
		if(!reg.test(email1+email2)){
			alert("이메일 형식이 잘못 되었습니다.");
			return false;
		}
		
		reg = /^(010|02|031|032|041)[-][0-9]{3,4}[-][0-9]{4}$/;
		var tel1 = document.getElementById("tel1_1").value()+"-"+document.getElementById("tel1_2").value()+"-"+document.getElementById("tel1_3").value();
		if(!regtest(tel1)){
			alert("연락처 형식이 잘못 되었습니다.");
			return false;
		}
		
		return false;
	}
</script>
</head>
<body>
	<div class="container">
		<div id="headerDiv">
			<img src="<%=request.getContextPath()%>/img/DOL02.PNG" />
			<h5>돌봄몬을 찾기 위한 내용 작성이 끝났습니다. 이제, 사용하실 아이디와 비밀번호를 입력해주세요</h5>
		</div>
		<div id="useridDiv">
			<label for="userid">아이디</label><span></span><br/>
			<input type="text" id="userid" name="userid" placeholder="아이디 입력"/>
		</div>
		<div id="userpwdDiv">
			<label for="userpwd">비밀번호</label><span></span><br/>
			<input type="password" id="userpwd" name="userpwd" placeholder="비밀번호 입력"/>
		</div>
		<div id="userpwdChkDiv">
			<label for="userpwdChk">비밀번호 확인</label><span></span><br/>
			<input type="password" id="userpwdChk" />
		</div>
		<div id="emailDiv">
			<label for="email1">이메일</label><span></span><br/>
			<input type="text" id="email1" name="email1" placeholder="이메일 입력" /><span>@</span><input type="text" id="email2" name="email2" placeholder="직접 입력"/>
			<select>
				<option selected="selected">직접입력</option>
				<option>gmail.com</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>daum.net</option>
			</select>
		</div>
		<input type="submit" value="다음" />
	</div>
</body>
</html>