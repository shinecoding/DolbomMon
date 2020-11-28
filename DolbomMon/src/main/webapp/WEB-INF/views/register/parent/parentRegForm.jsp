
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학부모 회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>

<style>
	.container{width:600px;}
	.container div{width:100%; overflow:hidden; height:auto; margin-top:15px;}
	
	#headerDiv{text-align:center; }
	#headerDiv>img{width:60%; height:200px;} 	
	#headerDiv>h4{width:70%; margin:0 auto;}
	
	sapn{display:inline-block; margin-left:5px; font-size:14px;}	
	.container>div>label{display:inline-block; width:auto;float:left; margin:0;}
	.container>div>span{width:auto;height:20px;float:left;}
	.container>div>input{width:80%; height:50px; padding:5px 10px; float:left;}
	
	#genderDiv label{width:19%; height:50px; line-height:50px; text-align:center; border:1px solid gray; background-color:#EFEFEF; cursor:pointer;}
	#genderDiv input[type=radio]{display:none;}
	input[type=submit]{width:100%; height:40px; margin:30px 0;}
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87&libraries=services"></script>
<script>
	$(function(){
		// 생년월일 옵션
		var option = {
			showAnim : "show",
			changeMonth : true,
			changeYear : true,
			minDate : '-100y',
			dateFormat : "yy-mm-dd"
		}
		$("#birthBtn").datepicker({
			showAnim : "show",
			changeMonth : true,
			changeYear : true,
			yearRange : 'c-100:c',
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				$("#birth").val(dateText);
				$("#birthBtn").val("생년월일");
			},
			altFormat:"yyyy-mm-dd"
		});
		
		// 휴대폰 본인인증 
		$("#smsIdentity").click(function(){
			window.open("<%=request.getContextPath()%>/smsIdentity", "sms", "left=400, top=150, width=500, height=300");
		});
		
		// 아이디 중복검사
		$("#useridChkBtn").on('click', function(){
			window.open("<%=request.getContextPath()%>/idCheckForm", "idChk", "left=400, top=150, width=500, height=300");
		});
		
		// 우편번호 검색창
		$("#zipcodeBtn").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#zipcode").val(data.zonecode);
		            $("#addr").val(data.address);
		            
		            var geocoder = new kakao.maps.services.Geocoder();
		            
		            geocoder.addressSearch(data.address, function(result, status) {

		                // 정상적으로 검색이 완료됐으면 
		                 if (status === kakao.maps.services.Status.OK) {
							
							console.log("경도=> " + result[0].x);
							console.log("위도=> " + result[0].y);
		                	$("#lng").val(result[0].x);
		                	$("#lat").val(result[0].y);
		                } 
		            });
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
		
		$("#userid").keyup(function(){
			var userid = $(this).val();
			var useridReg = /^[A-Za-z]{1}\w{7,11}$/;
			$("#idStatus").val("N");
			if(!useridReg.test(userid)){
				$("#useridRegChk").html("시작문자는 영문자, 아이디는 8~14글자의 영문,숫자,_만 입력가능").css("color", "#ff0000");
				$("#useridChkBtn").attr("disabled", true);
			}else{
				$("#useridRegChk").html("사용가능한 아이디 입니다.").css("color", "green");
				$("#useridChkBtn").attr("disabled", false);
			}
		});
		
		$("#userpwd").keyup(function(){
			var userpwd = $(this).val();
			var userpwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			$("#userpwdChk").val("");
			if(!userpwdReg.test(userpwd)){
				$("#userpwdRegChk").html("최소 하나의 문자, 숫자, 특수문자를 포함,8자 이상 입력").css("color", "#ff0000");
			}else{
				$("#userpwdRegChk").html("사용가능한 비밀번호입니다.").css("color", "green");
			}
		});
		
		$("#userpwdChk").keyup(function(){
			var userpwd = $("#userpwd").val();
			var userpwdChk = $(this).val();
			if(!(userpwd==userpwdChk)){
				$("#userpwdChkChk").html("비밀번호가 일치하지 않습니다.").css("color", "#ff0000");
 			}else{
 				$("#userpwdChkChk").html("").css("color", "green");
 			}
		});
		
		$("#username").keyup(function(){
			var username = $(this).val();
			console.log("username => " + username);
			var usernameReg = /^[가-힣]{2,7}$/;
			if(!usernameReg.test(username)){
				$("#usernameChk").html("한글 2~7글자만 가능합니다").css("color", "#ff0000");
			}else{
				$("#usernameChk").html("").css("color", "green");
			}
		});
		
		$("#email1").keyup(function(){
			var email1 = $(this).val();
			var email1Reg = /^[A-Za-z]{1}\w{7,11}$/;
			if(!email1Reg.test(email1)){
				$("#emailChk").html("첫 번째 글자는 영문자만 가능, 8~12자의 영문, 숫자, _ 만 가능 ").css("color", "#ff0000");
			}else{
				$("#emailChk").html("").css("color", "green");
			}
			
			var email2 = $("#email2").val();
			var email2Reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(!email2Reg.test(email2)) {
				$("#email2").val("").css("color", "green");
			}
		})
		
		$("#email2").keyup(function(){
			var email2 = $(this).val();
			var email2Reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(!email2Reg.test(email2)) {
				$("#emailChk").html("올바른 이메일 도메인 형식이 아닙니다.").css("color", "red");
			}else{
				$("#emailChk").html("").css("color", "green");
			}
			
			var email1 = $("#email1").val();
			var email1Reg = /^[A-Za-z]{1}\w{7,11}$/;
			if(!email1Reg.test(email1)){
				$("#email1").val("").css("color", "green");
			}
		});
		
		/////////////////////////////////////////////////////////////////////////
		$("#regFrm").submit(function(){
			
			var userid = $("#userid").val();
			if(userid == null || userid == ""){
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			var userpwd = $("#userpwd").val();
			if(userpwd == null || userpwd == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			var userpwdChk = $("#userpwdChk").val();
			if(userpwdChk == "" || userpwdChk == null){
				alert("비밀번호 확인을 입력해주세요.");
				return false;
			}
			
			var username = $("#username").val();
			if(username == "" || username == null){
				alert("이름을 입력해주세요.");
				return false;
			}
			
			var birth = $("#birth").val();
			if(birth == "" || birth == null){
				alert("생년월일을 입력해주세요.");
				return false;
			}
			
			var gender = $("input[name=gender]:checked").val();
			console.log("성별 => " +  gender);
			if(gender == "" || gender == null){
				alert("성별을 선택해주세요");
				return false;
			}
			
			var email1 = $("#email1").val();
			if(email1 == "" || email1 == null){
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			var email2 = $("#email2").val();
			if(email2 == "" || email2 == null){
				alert("도메인 주소를 입력해주세요.");
				return false;
			}
			
			var tel1 = $("#tel1").val();
			if(tel1 == "" || tel1 == null){
				alert("연락처를 입력해주세요.");
				return false;
			}
			
			var addr = $("#addr").val();
			if(addr == "" || addr == null){
				alert("우편번호와 주소를 입력해주세요.");
				return false;
			}
			
			var i = 0;
			console.log("=============================================");	
			$("span").each(function(){
				var spanColor = $(this).css("color");
				var id = $(this).attr("id");
				
				console.log("spanColor => " + spanColor);
				console.log("id => " + id);
				if(spanColor === "rgb(255, 0, 0)"){
					i = i + 1;
				}
				console.log("i => " + i);
			});
			if(i>0){
				i = 0;
				alert("입력한 정보를 다시 확인해주세요");
				return false;
			}
			
			return true;
		});
	});
	
</script>
</head>
<body>
	<form id="regFrm" method="post" action="<%=request.getContextPath()%>/parentRegFormOk" >
	<div class="container">
		<input type="hidden" id="lat" name="lat" />
		<input type="hidden" id="lng" name="lng" />
		<input type="hidden" id="joinType" name="joinType" value="${joinType}" placeholder="가입유형"/> 
		
		<div id="headerDiv">
			<img src="<%=request.getContextPath()%>/img/DOL02.PNG" />
			<h5>돌봄몬을 찾기 위한 내용 작성이 끝났습니다. 이제, 사용하실 아이디와 비밀번호를 입력해주세요</h5>
		</div>
		<div id="useridDiv">
			<label for="userid">아이디</label><span id="useridRegChk"></span><br/>
			<input type="text" id="userid" name="userid" placeholder="아이디 입력" style="width:50%;"/><input type="button" id="useridChkBtn" value="아이디 중복검사" disabled="disabled" style="width:27%; margin-left:3%;"/> 
			<input type="hidden" name="idStatus" id="idStatus" value="N"/>
		</div>
		<div id="userpwdDiv">
			<label for="userpwd">비밀번호</label><span id="userpwdRegChk"></span><br/>
			<input type="password" id="userpwd" name="userpwd" placeholder="비밀번호 입력"/>
		</div>
		<div id="userpwdChkDiv">
			<label for="userpwdChk">비밀번호 확인</label><span id=userpwdChkChk></span><br/>
			<input type="password" id="userpwdChk" />
		</div>
		<div id="usernameDiv">
			<label>이름</label><span id="usernameChk"></span><br/>
			<input type="text" id="username" name="username" placeholder="이름 입력" style="width:80%;"/> 
		</div>
		<div id="birthDiv">
			<input type="button" id="birthBtn" value="생년월일" style="width:20%;margin-right:5%" />
			<input type="text" id="birth" name="birth" style="width:50%;" readonly="readonly" placeholder="생년월일"/>
		</div>
		<div id="genderDiv"> 
			<label for="1"  ><input type="radio" name="gender" id="1" value="M" />남자</label>
			<label for="2" style="margin-left:2%;"><input type="radio" name="gender" id="2" value="F" />여자</label>
		</div>
		<div id="emailDiv">
			<label for="email1">이메일</label><span id="emailChk"></span><br/>
			<input type="text" id="email1" name="email1" placeholder="이메일 입력" style="width:24%;" /><span style="wdith:2%; height:50px; line-height:50px; text-aling:center; margin:0 1%;">@</span><input type="text" id="email2" name="email2" placeholder="직접 입력" style="width:24%;"/>
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
			<label for="tel1" style="width:80%;clear:both; margin-top:10px;">연락처</label><br/>
			<input type="text" id="tel1" name="tel1" value="" style="width:80%;" />
		</div>
		<div id="zonecodeDiv">
			<label>우편번호</label><br/>
			<input type="text" id="zipcode" name="zipcode" placeholder="우편번호 입력" style="width:28%;"/>
			<input type="button" value="우편번호 선택" id="zipcodeBtn" style="width:28%; margin-left:4%;"/> 
			<label for="tel1" style="width:80%; clear:both; margin-top:10px;">도로명 주소</label><br/>
			<input type="text" id="addr" name="addr" placeholder="도로명 주소 입력" style="width:80%;"/>
			<label for="tel1" style="width:80%; clear:both; margin-top:10px;">상세 주소</label><br/>
			<input type="text" id="addrdetail" name="addrdetail" placeholder="상세주소 입력" style="width:80%;"/>
		</div>
		<input type="submit" value="회원가입" />
	</div>
	</form>
</body>
</html>