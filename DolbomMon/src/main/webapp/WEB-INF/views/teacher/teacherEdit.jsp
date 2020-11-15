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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.container{width:800px;}
i{color:gray;}
#profimg{
	width:50%;
}
h5{
	padding: 20px 0px 0px 0px;
	font-weight: bold;
}
 .fa-check-circle{
 font-size:60px;
 margin: 8px;
}

#cctvLst>label{
width:45%;
height:150px;
border: 1px solid #ddd;
padding:50px 0;
margin:5px;
text-align:center;

}
#cctvWarning{
font-size: 0.8em;
color: gray;
text-align:center;
}
#cctvHidden{
overflow:hidden;
height:0px;
}
#cctvCheck1, #cctvCheck2{
font-size: 40px;
float:right;
color:white;
}

</style>
<script>
	$(function(){
		$("#cctvLst>label").click(function(){
			$(this).css("background-color", "orange").css("font-weight", "bold");
			$(this).siblings().css("background-color", "white").css("font-weight", "normal");
	
		});
			
		
	});
</script>
</head>
<body>

<div class="container">
	<h5>내 사진</h5>
   	<a href="teacherPicture">내 사진</a>
   <img class="rounded mx-auto d-block" id="profimg" src="img/profilepic.png"/>
   <ul class="list-group">
   		<li class="list-group-item align-middle"><span  style="font-size:1.4em; font-weight:bold">홍O동</span><span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2">일반 돌봄몬</span><br/>
   		<c:forEach var="s" begin="1" end="5"><i class="fas fa-star"></i></c:forEach> <span class="mx-2">20세</span> | <span class="ml-2">no.798521</span></li>
   </ul>
   <br/>
   <ul class="list-group list-group-horizontal-sm">
   		<li class="list-group-item col-4" style="text-align:center"><i class="fas fa-search mr-2"></i>조회수<br/><div>129</div></li>
   		<li class="list-group-item col-4" style="text-align:center"><i class="far fa-clock mr-2"></i>프로필 작성<br/>3일 전</li>
   		<li class="list-group-item col-4" style="text-align:center"><i class="fas fa-video mr-2"></i>CCTV<br/>동의함</li>
   </ul>

   	<h5>간단 자기소개</h5>
   	<a href="teacherIntro">자기소개</a>
   	<li class="list-group-item p-5" style="text-align:center">아직 작성하지 않았습니다.</li>
   	<h5>선호하는 돌봄유형</h5>
   	<li class="list-group-item p-5" style="text-align:center">"저는 <span>놀이/학습</span>돌봄을 가장 선호해요"</li>
   	<h5>희망 시급</h5>
   	<a href="teacherWage">희망 시급</a>
   	<li class="list-group-item p-5" style="text-align:center">원하는 시급을 자유롭게 작성해주세요.</li>
   	<h5>활동 가능 시간</h5>
   	<li class="list-group-item">스케쥴차트</li>
   	<h5>돌봄 가능 연령</h5>
   	<li class="list-group-item">
	   	<ul class="list-group list-group-horizontal-sm" >
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-new-off.svg" alt="신생아" /><br/>신생아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-young-on.svg" alt="영아" /><br/>영아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-child-on.svg" alt="유아" /><br/>유아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-element-on.svg" alt="초등학생" /><br/>초등학생</li>
	   </ul>
   </li>
   <h5>가능한 활동</h5>
   <li class="list-group-item">
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-indoorplay-on.svg" /><br/>실내놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-join-walk-off.svg"/><br/>등하원돕기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-read-on.svg" /><br/>책읽기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-outdooractivities-off.svg"/><br/>야외활동</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-korean-off.svg"/><br/>한글놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-english-off.svg"/><br/>영어놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-study-off.svg"/><br/>학습지도</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-pe-off.svg"/><br/>체육놀이</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-cleaning-off.svg"/><br/>간단 청소</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-cook-off.svg"/><br/>밥 챙겨주기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-washing-off.svg"/><br/>간단 설거지</li>
   		
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-longterm-off.svg"/><br/>장기입주</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-shortperiod-off.svg"/><br/>단기입주</li>

   		</ul>
   	</li>	
		<h5>활동 가능 지역</h5>
		<li class="list-group-item p-4"><span class="badge badge-warning">1순위</span> 서울특별시 마포구 마포동</li>
		
		<h5>CCTV동의 여부</h5>
		<li id="cctvLst" class="list-group-item" >
			<div id="cctvHidden">
				<input type="radio" name="options" id="cctvDisagree" />
			    <input type="radio" name="options" id="cctvAgree" />
		    </div>
		    <label for="cctvDisagree" class="rounded">   
		    CCTV촬영을<br/> 원치 않습니다.<br/>
		    	<i id="cctvCheck1" class="fas fa-check-circle"></i>
		    </label>
		    <label for="cctvAgree" class="rounded">
		    CCTV가 있어도<br/>당당히 일할 수 있습니다.<br/>
		    	<i id="cctvCheck2" class="fas fa-check-circle"></i>
			</label>
	
			<p id="cctvWarning">단, 녹화된 영상을 유출 배포하지 않는 전제</p>		
		
		</li>
   		
   <br/>
</div>



</body>
</html>

