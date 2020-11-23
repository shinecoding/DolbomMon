
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.container{width:600px;}
	.container div{width:100%; overflow:hidden; height:auto; margin-top:15px;}
	
	#headerDiv{text-align:center; }
	#headerDiv>img{width:60%; height:200px;} 	
	#headerDiv>h4{width:70%; margin:0 auto;}
	
	.container>div>label{display:inline-block; width:30%;float:left; margin:0;}
	.container>div>span{width:auto;height:20px;float:left;}
	.container>div>input{width:80%; height:50px; padding:5px 10px; float:left;}
	#emailDiv span{width:auto; height:20px; font-size:20px; line-height:50px; float:left; margin:0 5px;} 
	
	#genderDiv label{width:19%; height:50px; line-height:50px; text-align:center; border:1px solid gray; background-color:#EFEFEF; cursor:pointer;}
	#genderDiv input[type=radio]{display:none;}
	input[type=submit]{width:100%; height:40px; margin:30px 0;}
	
</style>
<script>
	$(function(){
		
		// 휴대폰 본인인증 
		$("#smsIdentity").click(function(){
			window.open("<%=request.getContextPath()%>/smsIdentity", "sms", 'top=300, left=1000, width=150, height:200');
		});
		
		// 우편번호 검색창
		$("#zonecodeBtn").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#zonecode").val(data.zonecode);
		            $("#address").val(data.address);
		           	window.close();
		        },theme:{
		        	searchBgColor: "#ff5400", //검색창 배경색
		            queryTextColor: "#FFFFFF" //검색창 글자색
		        }
		    }).open();
		});
		
		// 성별 라디오 버튼 
		$("#genderDiv input[type=radio]").change(function(){
			var selectedDate = $(this).attr("id");
			for(var i=1;i<=2;i++){
				if($("input[id="+i+"]").is(":checked")) {
					$("label[for="+i+"]").css("background-color", "#ff5400").css("color", "white");
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF").css("color", "black");
				}
			}
		});
		
		
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
		/*
		휴대폰 본인인증 api로
		reg = /^(010|02|031|032|041)[-][0-9]{3,4}[-][0-9]{4}$/;
		var tel1 = document.getElementById("tel1_1").value()+"-"+document.getElementById("tel1_2").value()+"-"+document.getElementById("tel1_3").value();
		if(!regtest(tel1)){
			alert("연락처 형식이 잘못 되었습니다.");
			return false;
		}
		*/
		return false;
	}
</script>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/regOk" >
	<div class="container">
	
		<input type="text" name="dbm_type" value="${dbm_type }" />
		<input type="text" name="child_age" value="${child_age }" />
		<input type="text" name="care_type" value="${care_type }" />
		<input type="text" name="start_time" value="${start_time }" />
		<input type="text" name="end_time" value="${end_time }" />
		<input type="text" name="start_date" value="${start_date }" />
		<input type="text" name="end_date" value="${end_date }" />
		<input type="text" name="desired_wage" value="${desired_wage }" />
		<input type="text" name="cctv" value="${cctv }" />
		<input type="text" name="pic" value="${pic }" />
		<input type="text" name="intro" value="${intro }" />
	
		<div id="headerDiv">
			<img src="<%=request.getContextPath()%>/img/DOL02.PNG" />
			<h5>돌봄몬을 찾기 위한 내용 작성이 끝났습니다. 이제, 사용하실 아이디와 비밀번호를 입력해주세요</h5>
		</div>
		<div id="useridDiv">
			<label for="userid">아이디</label><span></span><br/>
			<input type="text" id="userid" name="userid" placeholder="아이디 입력" style="width:50%;"/><input type="button" id="useridChk" value="아이디 중복검사" style="width:27%; margin-left:3%;"/> 
		</div>
		<div id="userpwdDiv">
			<label for="userpwd">비밀번호</label><span></span><br/>
			<input type="password" id="userpwd" name="userpwd" placeholder="비밀번호 입력"/>
		</div>
		<div id="userpwdChkDiv">
			<label for="userpwdChk">비밀번호 확인</label><span></span><br/>
			<input type="password" id="userpwdChk" />
		</div>
		<div id="usernameDiv">
			<label>이름</label><br/>
			<input type="text" id="username" name="username" placeholder="이름 입력" style="width:80%;"/> 
		</div>
		<div id="genderDiv"> 
			<label for="1"  ><input type="radio" name="gender" id="1" value="M" />남자</label>
			<label for="2" style="margin-left:2%;"><input type="radio" name="gender" id="2" value="F" />여자</label>
		</div>
		<div id="emailDiv">
			<label for="email1">이메일</label><span></span><br/>
			<input type="text" id="email1" name="email1" placeholder="이메일 입력" style="width:24%;" /><span style="wdith:2%; text-aling:center; margin:0 1%;">@</span><input type="text" id="email2" name="email2" placeholder="직접 입력" style="width:24%;"/>
			<select style="width:24%; margin-left:3%; height:50px;" >
				<option selected="selected" >직접입력</option>
				<option>gmail.com</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>daum.net</option>
			</select>
		</div>
		<div id="smsDiv">
			<input type="button" id="smsIdentity" value="휴대폰 본인인증하기"/>
			<label for="tel1" style="clear:both; margin-top:10px;">연락처</label><br/>
			<input type="text" id="tel1" name="tel1" value="" style="width:80%;" readonly="readonly" />
		</div>
		<div id="zonecodeDiv">
			<label>우편번호</label><br/>
			<input type="text" id="zonecode" name="zonecode" placeholder="우편번호 입력" style="width:28%;"/>
			<input type="button" value="우편번호 선택" id="zonecodeBtn" style="width:28%; margin-left:4%;"/> 
			<label for="tel1" style="clear:both; margin-top:10px;">도로명 주소</label><br/>
			<input type="text" id="address" name="address" placeholder="도로명 주소 입력" style="width:80%;"/>
			<label for="tel1" style="clear:both; margin-top:10px;">상세 주소</label><br/>
			<input type="text" id="addrdetail" name="addrdetail" placeholder="상세주소 입력" style="width:80%;"/>
		</div>
		<input type="submit" value="다음" />
	</div>
	</form>
</body>
</html>