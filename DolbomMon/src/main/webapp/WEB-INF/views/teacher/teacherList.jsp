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
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<style>
	.container{width:800px;}
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
	#tMenuList a, #tBottomList a{
	text-decoration: none; cursor:pointer;
	color:black;
	}
	i{ color: orange;}
	
	.rightlog>i, .rightlog>a, .rightlog>div {
	float:right;
	
	}
	#myBox{
	width:100%; 
	/*background-color: #fef8f2;*/
	background-color: orange;
	color:white;
	border-radius:20px; 
	margin-bottom:10px;
	height:100px;
	line-height:100px;
	}
	#profimg{
	width:50px;
	height:50px;
	border-radius:50%;
	margin-left:30px;
	margin-right:5px;
	}
	/*==================================================*/
/* 아래 다 토글 버튼 */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  margin-right: 30px;
  top:33px;
  margin-left:5px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: white; /*구직종료 백그라운드 색-흰색*/
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  /*background-color: white;*/
  background-color: #ddd; /*동그라미-체크 안 했을 때*/
  
  -webkit-transition: .4s;
  transition: .4s;
}
.slider:after{
background-color: red;
}

input:checked + .slider:before {
  background-color: orange; /*동그라미-체크했을 때*/
}

input:focus + .slider {
  box-shadow: 0 0 1px #white;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>



<script>
	$(function(){
		$("#tMenuList a", "#tBottomList a").hover(function(){
			  $(this).css("text-decoration", "none").css("color", "black");
			  }, function(){
			  $(this).css("text-decoration", "none").css("color", "black");
			});
		
		//토글
		$(document).on("change", ".switch", function(){
			var active = "";
			if($(this).children("input").is(":checked")==false){
				active = "N";
				$(this).siblings().css("color", "white");
				$(this).parent().parent().css("background-color", "#ddd");
				$(this).siblings().text("구직 종료");
			}else if($(this).children("input").is(":checked")==true){
				active = "Y";
				$(this).siblings().css("color", "white");
				$(this).parent().parent().css("background-color", "orange");
				$(this).siblings().text("구직 중");
			}
			
			console.log("액티브->"+active);
		var url = "/dbmon/updateActive";
		var params = "active="+ active;
		console.log("파람->"+ params);
			$.ajax({
				url:url,
				data:params,
				type:'GET',
				success:function(result){
					console.log("ajax 성공");
				}, error:function(){
					console.log("ajax 실패");
				}
			})
		
		});
	});//제이쿼리
</script>

</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
<div class="container" >
   <div id="title">
   		<div id="titlefont">마이페이지</div>
   		<div class="rightlog">   
			   <a id="lgt" href="/dbmon/logout">로그아웃</a>
			   <div id="dividebar">|</div>
			   <a id="pwdchg" href="/dbmon/identityEdit"><i class="fas fa-pen"></i>비밀번호 변경</a>
			   
	   </div>
	</div>   
 <br/>
 
 <div id="myBox"  <c:if test="${vo.active=='Y'}">style="background-color:orange"</c:if> <c:if test="${vo.active=='N' || vo.active==null }">style="background-color:#ddd"</c:if>  >
    <img id="profimg" <c:if test="${vo.pic==null}">src="img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">src="upload/${vo.pic}"</c:if> />
	<span><b>${mvo.username}</b></span>
	<span id ="switchTxt" class="float-right">
		<c:if test="${vo.active=='Y'}"><span style="color:white"> 구직 중</span></c:if>
		<c:if test="${vo.active=='N' || vo.active==null }"><span style="color:white"> 구직 종료</span></c:if>
	
		<label class="switch">
		  <input name="activeCheck" type="checkbox" <c:if test="${vo.active=='Y'}"> checked </c:if> >
		  <span class="slider round"></span>
		</label>
	</span>
 </div>
   <ul id="tMenuList" class="list-group list-group-flush">
   		<li class="list-group-item list-group-item-action"><a href="teacherApplyHistory"><i class="fas fa-clipboard mx-2"></i> 내 구직현황</a><i class="fas fa-angle-right float-right mt-1 mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherHeart"><i class="fas fa-heart mx-2"></i> 찜한 일자리</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherView"><i class="fas fa-user-circle mx-2"></i> 내 프로필 보기</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherEdit"><i class="fas fa-user-edit mx-2"></i> 내 프로필 수정</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherProof"><i class="fas fa-check-circle mx-2"></i> 인증 관리</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="#"><i class="fas fa-chalkboard-teacher mx-2"></i> 활동내역</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="/dbmon/myReport"><i class="fas fa-exclamation-triangle mx-2"></i> 신고내역</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   </ul>
   <br/>
   <ul id="tBottomList" class="list-group">
   		<li class="list-group-item list-group-item-action"><a href="#">결제내역</a></li>
   		<li class="list-group-item list-group-item-action"><a href="/dbmon/identityForm">계정관리</a></li>
   </ul>
</div>

</body>
</html>
<jsp:include page="../footer.jsp"/>

