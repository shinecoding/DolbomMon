
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.container{width:600px;
		margin: 0 auto;
	}
	.container div{width:100%;overflow:hidden; height:auto; margin-top:15px;}
	
	#headerDiv{
		text-align: center;
		font-size: 30px;
		margin: 15px;
		padding: 15px;
		font-size: 30px;
	}
	#headerDiv>a>img{width:250px;} 	
	#headerDiv>h4{width:70%; margin:0 auto;}
	
	.container>div>div>label{display:inline-block;width:auto;float:left; margin:0px;}
	.container>div>div>span{display:inline-block; width:auto;height:20px;float:left;font-size:16px; margin-top:5px; margin-left:5px;}
	.container>div>input{height:40px; padding:5px 10px; float:left;}
	
	#genderDiv label{width:19%; height:40px; line-height:40px; text-align:center; border:none; border-radius:20px; background-color:#EFEFEF; cursor:pointer; margin: 3px;}
	#genderDiv input[type=radio]{display:none;}
	input[type=submit]{width:100%; height:40px; margin:30px 0 100px 0;}
	
	label{-webkit-transition:background-color 1s; transition:background-color 1s;}
	#zonecodeDiv span{
		display:inline-block; width:auto;height:20px;float:left;font-size:16px; margin-top: 15px; margin-bottom:5px;
	}
	#zonecodeDiv input{
		height:40px; padding:5px 10px; float:left;
	}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87&libraries=services"></script>
<script>
	$(function(){
		$("#genderDiv input[type=radio]").each(function(){
			if($(this).is(":checked")){
				$(this).css("background-color", "#ffc207"); 
			}else{
				$(this).parent("label").css("background-color", "#EFEFEF"); 
			}
		});
		
		
		// 생년월일 옵션
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
		
		// 우편번호 검색창
		$("#zipcodeBtn").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#zipcode").val(data.zonecode);
		            $("#addr").val(data.address);
		            console.log("시, 도 =>" + data.sido);
		            console.log("시군구 =>" + data.sigungu);
		            console.log("법정동명(동) => " + data.bname);
		            console.log("법정동명(읍, 면, 리) => " + data.bname1);
		            
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
		        	searchBgColor: "#ffc207", //검색창 배경색
		            queryTextColor: "#black" //검색창 글자색
		        }
		    }).open();
		});
		
		// 성별 라디오 버튼 
		$("#genderDiv input[type=radio]").change(function(){
			var selectedDate = $(this).attr("id");
			for(var i=1;i<=2;i++){
				if($("input[id="+i+"]").is(":checked")) {
					$("label[for="+i+"]").css("background-color", "#ffc207");
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		
		
		$("#userid").keyup(function(){
			var userid = $(this).val();
			var useridReg = /^[A-Za-z]{1}\w{7,11}$/;
			$("#idStatus").val("N");
			if(!useridReg.test(userid)){
				$("#useridRegChk").html("시작문자는 영문자, 아이디는 8~14글자의 영문,숫자,_만 입력가능").css("color", "#ff0000");
				$("#idChkBtn").attr("disabled", true);
			}else{
				$("#useridRegChk").html("사용가능한 아이디 입니다.").css("color", "green");
				$("#idChkBtn").attr("disabled", false);
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
				$("#emailChk").html("첫 번째 글자는 영문자만 가능, 8~12자의 영문, 숫자, _ 만 가능 ").css("color", "red");
			}else{
				$("#emailChk").html("").css("color", "green");
			}
			
			var email2 = $("#email2").val();
			var email2Reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(!email2Reg.test(email2)) {
				$("#email2").val("");
				$("#emailChk").css("color","red");
			}
		})
		
		$("#email2").keyup(function(){
			var domain = document.getElementById("domain");
			domain.selectedIndex = 0;
			var selectText = domain.options[domain.selectedIndex].text;
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
				$("#emailChk").val("").css("color", "red");
			}
		});
		
		$("#domain").change(function(){
			var domain = $(this).val();
			if(domain == '직접입력'){
				$("#email2").val("");				
			}else {
				$("#email2").val(domain);
			}
			var email2 = $("#email2").val();
			var email2Reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(!email2Reg.test(email2)) {
				$("#emailChk").html("올바른 이메일 도메인 형식이 아닙니다.").css("color", "red");
			}else{
				$("#emailChk").html("").css("color", "green");
			}
			
			var email1 = $("#email1").val();
			var email1Reg = /^[A-Za-z]{1}\w{7,11}$/;
			if(!email1Reg.test(email1)){
				$("#emailChk").css("color", "red");
				$("#emailChk").html("첫 번째 글자는 영문자만 가능, 8~12자의 영문, 숫자, _ 만 가능 ");
			}
		});
		
		$("#tel1").keyup(function(){
			$("#smsIdentityYN").val("N");
			$("#userNum").css("display", "none");
			$("#userNumChk").css("display", "none");
			var tel1 = $(this).val();
			var tel1Reg = /^01(?:0)\d{8}$/;
			if(!tel1Reg.test(tel1)){
				$("#tel1Chk").html("-를 제외한 휴대폰 번호를 입력해주세요.ex)010...").css("color", "red");
				$("#smsIdentity").attr("disabled", true);
			}else{
				$("#tel1Chk").html("").css("color", "green");
				$("#smsIdentity").attr("disabled", false);
			}
		});
		
		///////////////// 아이디 중복검사 ///////////////// 
		$("#idChkBtn").click(function(){
	        var userid = $("#userid").val();
	        console.log("userid => " + userid);
	        $.ajax({
                url:"idCheckAjax",
                type:"post",
                data:{userid: $("#userid").val()
                     },
              success:function(result){
            	  if(result>=1){
            		  alert("이미 사용중인 아이디입니다.");
            	  }else if(result==0){
            		  if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
            			  $("#idStatus").val("Y");
            		  }else{
            			  $("#idStatus").val("N");
            		  }
            	  }
                }, error:function(){
                   
                }
             });
	    });
		
		//////////////////////// 휴대폰 본인인증 ////////////////////////
		$("#smsIdentity").click(function(){
			//////////////// 휴대폰 중복검사 ///////////////////
			var tel1 = $("#tel1").val();
	        console.log("tel1 => " + tel1);
	        
	        $.ajax({
                url:"telCheckAjax",
                type:"post",
                data:{tel1: $("#tel1").val()
                     },
              	success:function(result){
            	  	if(result>=1){
            		  	var idpwQna = confirm("이미 사용중인 연락처입니다. \n 아이디찾기 페이지로 이동하시겠습니까?");
            		  	if(idpwQna){
            		  		console.log("이동");
            		  	}
            	  	}else if(result==0){
          				var number = Math.floor(Math.random() * 100000) + 100000;
          	      		if(number>100000){
          	        		number = number - 10000;
          	        	}
          	      		
          				var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");
          				
          	       		if(con_test == true){
          	       			$("#text").val()
          	       			$("#text").val(number);
	          	          	$.ajax({
	          	            	url:"sendSms",
	          	            	type:"post",
	          	                data:{tel1: $("#tel1").val(),
	          	                  	text: $("#text").val()
	          	                    },
	          	                 	success:function(){
	          	                 		swal({
	          	      						title : "인증번호를 발송했습니다.",
	          	      						icon : "info"
	          	      					});
		          	                	$("#userNum").fadeIn(1500);
		                  				$("#userNumChk").fadeIn(1500);
	          	                   	}, error:function(){
	          	                      
	          	                   	}
	          	                });
          	      		}else{
          	        	  
          	       		}
            	  	}
                }, error:function(){
                   
                }
           	});
		});
		
		$("#userNumChk").click(function(){
			var userNum = $("#userNum").val();
	       	var sysNum = $("#text").val();    
	         
	      	if(userNum.trim() == sysNum.trim()){
	      		$("#smsIdentityYN").val("Y");
	           	alert("인증되었습니다.");
	        } else {
	      		$("#smsIdentityYN").val("N");
	        	alert("인증번호가 일치하지 않습니다.");
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
			
			var smsIdentityYN = $("#smsIdentityYN").val();
			if(smsIdentityYN=="N" || smsIdentityYN==null){
				alert("휴대폰 본인인증을 해주세요");
				return true;
			}
			
			var idStatus = $("#idStatus").val();
			if(idStatus=="N"){
				alert("아이디 중복검사를 해주세요");
				return false;
			}
			
			return true;
		});
	});
</script>
</head>
<body>
	<form class="input-group mb-3" id="regFrm" method="post" action="<%=request.getContextPath()%>/regFormOk" >
	<div class="container">
	<c:if test="${who=='T' }" >
		<input type="hidden" name="teacher_type" value="${teacher_type }" />
		<input type="hidden" name="child_age" value="${child_age }" />
		<input type="hidden" name="activity_type" value="${activity_type }" />
		<input type="hidden" name="yoil" value="${yoil }" />
		<input type="hidden" name="start_time" value="${start_time }" />
		<input type="hidden" name="end_time" value="${end_time }" />
		<input type="hidden" name="start_date" value="${start_date }" />
		<input type="hidden" name="end_date" value="${end_date }" />
		<input type="hidden" name="desired_wage" value="${desired_wage }" />
		<input type="hidden" name="cctv" value="${cctv }" />
		<input type="hidden" name="pic" value="${pic }" />
		<input type="hidden" name="intro" value="${intro }" />
	</c:if>
		<input type="hidden" name="who" value="${who }" />
		<input type="hidden" id="lat" name="lat" />
		<input type="hidden" id="lng" name="lng" />
		
		<div id="headerDiv">
			<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/mylogo.png" /></a><br/><br/>
			<c:if test="${who == 'P' }"><b>회원가입</b></c:if><c:if test="${who == 'T' }"><h5>일자리를  찾기 위한 내용 작성이 끝났습니다. <br/>이제, 사용하실 아이디와 비밀번호를 입력해주세요.</h5></c:if>
		</div>
		<div id="useridDiv" class="form-group has-warning has-feedback">
			<div><label class="form-label" for="userid">아이디</label><span id="useridRegChk"></span></div>
			<input type="text" class="form-control" id="userid" name="userid" placeholder="사용하실 아이디를 입력하세요" style="width:72%;"/><input type="button" class="btn btn-warning" id="idChkBtn" value="아이디 중복검사" disabled="true" style="width:25%; margin-left:3%;"/> 
			<input type="hidden" id="idStatus" value="N"/>
		</div>
		<div id="userpwdDiv">
			<div><label class="form-label" for="userpwd">비밀번호</label><span id="userpwdRegChk"></span></div>
			<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호를 입력하세요"/>
		</div>
		<div id="userpwdChkDiv">
			<div><label class="form-label" for="userpwdChk">비밀번호 확인</label><span id=userpwdChkChk></span></div>
			<input type="password" class="form-control" id="userpwdChk" placeholder="비밀번호를 한번 더 입력하세요"/>
		</div>
		<div id="usernameDiv">
			<div><label class="form-label">이름</label><span id="usernameChk"></span></div>
			<input type="text" class="form-control" id="username" name="username" placeholder="이름을 입력하세요"/> 
		</div>
		<div id="birthDiv">
			<div><label class="form-label">생년월일</label></div>
			<input type="text" class="form-control" id="birth" name="birth" style="width:72%;" readonly="readonly" placeholder="생년월일"/>
			<input type="button" class="btn btn-warning" id="birthBtn" value="선택" style="width:25%; margin-left:3%;" />
		</div>
		<div id="genderDiv"> 
			<div><p>성별</p></div>
			<label for="1" class="form-label"><input type="radio" class="form-control" name="gender" id="1" value="M" />남자</label>
			<label for="2" class="form-label" style="margin-left:2%;"><input type="radio" class="form-control" name="gender" id="2" value="F" />여자</label>
		</div>
		<div id="emailDiv">
			<div><label class="form-label" for="email1">이메일</label><span id="emailChk"></span></div>
			<input type="text" class="form-control" id="email1" name="email1" placeholder="이메일 입력" style="width:30%;" />
			<span style="display:inline-block; float:left; width:3%; height:40px; line-height:40px; text-align:center; margin:0 1%;">@</span>
			<input type="text" class="form-control" id="email2" name="email2" placeholder="직접 입력" style="width:31%;"/>
			<select id="domain" style="width:30%; margin-left:3%; height:40px;" >
				<option class="form-control" selected="selected" >직접입력</option>
				<option>gmail.com</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>daum.net</option>
			</select>
		</div>
		<div id="smsDiv">
			<div><label for="tel1" class="form-label" style="clear:both;">연락처</label><span id="tel1Chk"></span></div>
			<input type="text" id="tel1" class="form-control" name="tel1" style="width:72%;" placeholder="전화번호를 입력하세요" />
			<input type="button" class="btn btn-warning" id="smsIdentity" value="본인인증하기" disabled="true" style="width:25%; margin-left:3%;"/>
			<input type="text" class="form-control" id="userNum" name="userNum" style="margin-top:10px; display:none;" placeholder="인증번호 입력"/>
			<input type="button" class="btn btn-warning" id="userNumChk" style="margin-top:10px;display:none;" value="인증하기"/>
			<input type="hidden" name="text" id="text">
			<input type="hidden" id="smsIdentityYN" value="N" /> 
		</div>
		<div id="zonecodeDiv">
			<div><label for="zipcode" class="form-label"><span>우편번호</span></label></div>
			<input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호 입력" style="width:72%;"/>
			<input type="button" class="btn btn-warning" value="우편번호 선택" id="zipcodeBtn" style="width:25%; margin-left:3%;"/> 
			<div><label for="addr"style="width:80%; clear:both; margin-top:10px;"><span>도로명 주소</span></label></div>
			<input type="text" class="form-control" id="addr" name="addr" placeholder="도로명 주소 입력"/>
			<div><label for="addrdetail" style="width:80%; clear:both; margin-top:10px;"><span>상세 주소</span></label></div>
			<input type="text" class="form-control" id="addrdetail" name="addrdetail" placeholder="상세주소 입력"/>
		</div>
		<input type="submit" class="btn btn-warning btn-lg" value="가입하기" />
	</div>
	</form>
</body>
</html>
