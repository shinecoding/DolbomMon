<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<style>
	.container{width:800px;
	margin-bottom: 50px;
	}
	
	#title{
		margin:20px 5px;
		display:block;
    	width:100%;
    	
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	#pwdchg, #lgt {
	background-color:white;
	text-decoration:none;
	color:black;
	border:none;
	border-color:white;
	outline:none;
	display: inline-block;
	}
	#dividebar{
	margin: 0px 5px; 
	}
	a{
	text-decoration: none; cursor:pointer;
	color:black;
	}
	i{ color: orange;}
	
	.rightlog>i, .rightlog>a, .rightlog>div {
	float:right;
	
	}
	
	#ex7{
		width:400px;
		height:230px;
		text-align:center;
	}

</style>
<script>

	$(function(){
			
		//countTest
		$(document).on("click",".comment",function(){
			//var userid = $(this).attr('id');
			var userid = $(this).attr('id');
			var popupWidth = 800;
			var popupHeight = 596;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			var popupY= (window.screen.height / 2) - (popupHeight / 2);
			
			console.log(userid);
			window.open('/dbmon/commentWrite?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
			
		});
		   
		$('a[href="#ex7"]').click(function(event) {
		      event.preventDefault();
		 
		      $(this).modal({
		        fadeIn : 250
		      });
		    });   
				
		$("#regBtn").click(function(){
			params = $("#accountFrm").serialize();
			$.ajax({
				url : "accountUpdate",
				type : 'post',
				data : params,
				success:function(result){
					if(result > 0){
						alert("계좌등록 완료");
						$.modal.close();
					}else {
						alert("다시 확인해주세요");
					}
				}, error:function(e){
					console.log(e);
				}
			});
		});
	});	
	
		
</script>
</head>
<!-- -------------------상단메뉴------------- -->
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
</div>
<div class="in_box" style="position:absolute; margin-left:700px; margin-top:150px; ">
            <h1 class="tit wow fadeIn animated" style="visibility: visible; animation-name: fadeIn; font-weight:bold; color:white;">마이페이지</h1>
	    	<a href="#"></a></div>
	    	<img src="img/bx1.png" style="width:100%; height:400px; "/>

<body>
<div id="ex7" class="modal">
	<form id="accountFrm" >
	<span style="color:orange;font-size:21px;">은행선택</span>
	<div><select name="bank_name" class="form-control selectpicker noborder" style="display:inline-block; width:50%; text-align:center;">
		<option disabled="disabled">은행을 선택해주세요</option>
		<option>직접 입력</option>
		<option>기업은행</option>
		<option>국민은행</option>
		<option>우리은행</option>
		<option>농협</option>
		<option>제일은행</option>
		<option>신한은행</option>
	</select></div>
  	<span style="color:orange;font-size:21px;bottom:0;">계좌번호 입력</span>
  	<div style="margin:0 0 10px 0;"><input type="text" name="bank_account_no" style="width:80%;height:40px;"/></div>
  	<input type="button" class="btn" style="background-color:gray;" value="닫기" />
  	<input type="button" class="btn btn-warning" value="계좌 등록하기" id="regBtn"/>
  	</form>
</div>

<div class="container" >
   <div id="title">
   		<div id="titlefont"></div>
   		<div class="rightlog">   
			   <a id="lgt">로그아웃</a>
			   <div id="dividebar">|</div>
			   <a id="pwdchg">비밀번호 변경</a>
			   <i class="fas fa-pen"></i>
	   </div>
	</div>   
 <br/>
 
   <ul class="list-group list-group-flush">
   		<li class="list-group-item list-group-item-action"><a href="parentApplyHistory"><i class="fas fa-clipboard mx-2"></i> 내 구인현황</a><i class="fas fa-angle-right float-right mt-1 mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="parentHeart"><i class="fas fa-heart mx-2"></i> 찜한 돌봄몬</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="parentProfile?userid=${userid }"><i class="fas fa-user-circle mx-2"></i> 내 프로필 보기</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<!-- <li class="list-group-item list-group-item-action"><a href="parentEdit"><i class="fas fa-user-edit mx-2"></i> 내 프로필 수정</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li> -->
   		<li class="list-group-item list-group-item-action"><a href="parentDealHistory"><i class="fas fa-chalkboard-teacher mx-2"></i> 활동내역</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i>
   		</li>
   		<li class="list-group-item list-group-item-action"><a href="myReport"><i class="fas fa-exclamation-triangle mx-2"></i> 신고내역</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		
   	   </ul>
   <br/>
   <ul class="list-group">
   		<li class="list-group-item list-group-item-action"><a href="#ex7" rel="modal:open">결제/환불 계좌등록</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">결제내역</a></li>
   		<li class="list-group-item list-group-item-action"><a href="/dbmon/identityForm">계정관리</a></li>
   		<li class="list-group-item list-group-item-action"><a href="dbmSearchWriteForm">선생님구하기</a></li>
   </ul>
   
</div>

</body>
</html>
<jsp:include page="../footer.jsp"/>
