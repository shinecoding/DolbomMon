<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
	$(function(){
		
		//신고버튼
		$(document).on("click", "#report", function(){
			location.href="/dbmon/report?userid=${vo.userid}";
		})
		
		var popupWidth = 1060;
		var popupHeight = 596;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		$(document).on("click", ".shinchung", function(){
			console.log('test');
			popupWidth = 1060;
			popupHeight = 1600;
			var userid = $(this).attr('id');
			console.log(userid);
			window.open('/dbmon/contractOpenT?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		})
		$(document).on("click",".cBtn",function(){
			popupWidth = 1060;
			popupHeight = 656;
			var userid = $(this).attr('id');
			window.open('/dbmon/chat?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		});
		
		
		
	});//제이쿼리
</script>
<style>
.container{width:800px;}
i{color:gray;}
#profimg{
	width:400px;
	height:400px;
	text-align:center;
}
h5{
	padding: 20px 0px 0px 0px;
	font-weight: bold;
}
 .fa-check-circle{
 font-size:60px;
 margin: 8px;
}

.boldFont{
color:orange;
font-weight:bold;
}
img{
width:50%;
}
#report{
	cursor: pointer;
}
#map {
width:100%;
height:200px;
border-radius:10px;
}

.clearfix:after { clear:both; }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/>
<div class="container">
	
	
	<div>
		<img class="rounded mx-auto d-block" id="profimg" <c:if test="${vo.pic==null}">src="img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">src="upload/${vo.pic}"</c:if> />
	</div>
   <div class="clearfix" style="width:100%">
	   <div style="position:relative; float:right; height:1px; top:-420px;">
			<c:if test="${mvo.userid!=paramid}"><div class="badge badge-warning badge-pill float-right mt-3 p-2" id="report"><img src="icon/icon-alarm.png" style="width:1em; height:1em"/>신고</div></c:if>
	   </div>
   </div>
   <ul class="list-group">
   		
   		<li class="list-group-item align-middle">
   		<span  style="font-size:1.4em; font-weight:bold">${mvo.username}</span>
   		<span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2"><c:if test="${vo.teacher_type=='선생님'}">선생님 돌봄몬</c:if><c:if test="${vo.teacher_type=='대학생'}">대학생 돌봄몬</c:if><c:if test="${vo.teacher_type=='엄마'}">엄마 돌봄몬</c:if><c:if test="${vo.teacher_type=='일반'}">일반 돌봄몬</c:if></span>
   		<c:if test="${mvo.userid!=paramid}">
   		<input type="button" class="btn btn-warning cBtn" id="${userid }" value="협의하기" style="float:right; margin:0 5px;"/>
   		<button name="shinchung" id="${userid }" class="btn btn-warning float-right shinchung">신청</button></c:if><br/>
   		<c:forEach var="s" begin="1" end="5"><i class="fas fa-star"></i></c:forEach> <span class="mx-2">20세</span> | <span class="mx-2"><c:if test="${mvo.gender=='F'}"><i class="fas fa-venus"></i></c:if><c:if test="${mvo.gender=='M'}"><i class="fas fa-mars"></i></c:if></span>| <span class="ml-2">no.${mvo.no}</span></li>
   		
   </ul>

   <br/>
   <ul class="list-group list-group-horizontal-sm">
   		<li class="list-group-item col-4" style="text-align:center"><i class="fas fa-search mr-2"></i>조회수<br/><div>${vo.hit}</div></li>
   		<li class="list-group-item col-4" style="text-align:center"><i class="far fa-clock mr-2"></i>프로필 작성<br/>${timeStr}</li>
   		<li class="list-group-item col-4" style="text-align:center"><i class="fas fa-video mr-2"></i>CCTV<br/><c:if test="${vo.cctv=='Y'}">동의함</c:if><c:if test="${vo.cctv!='Y'}">동의안함</c:if></li>
   </ul>
   <ul class="list-group">
   	<li class="list-group-item">
   		<div class="row">
   			<div class="col-1">
   			<span class="fa-stack fa-2x">
   			<i class="fas fa-circle fa-stack-2x"  <c:if test="${cvo.identi_status=='Y'}">style="color:orange" </c:if> ></i>
		   	
		   	<c:if test="${cvo.identi_status=='N' || cvo.identi_status=='S' || cvo.identi_status==null}">
		   	<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
		   	</c:if>
		   	<c:if test="${cvo.identi_status=='Y'}">
		   		<i class="fas fa-shield-alt fa-stack-1x fa-inverse"></i>
		   	</c:if>
   			</span>
	   		</div>
	   		<div class="col-10 ml-3 mt-1">
	   		<b style="font-size:1.2em">본인 인증 완료</b><br/>
	   		돌봄몬 고객안전관리팀에서 실명 / 생년월일 / 연락처를 확인하였습니다.
	   		</div>
   		</div>
   	</li>
   	</ul>
   	<h5>핵심인증</h5>
   	<ul class="list-group">
   	<li class="list-group-item">
	   	<span class="fa-stack fa-2x">
	   	<i class="fas fa-circle fa-stack-2x"  <c:if test="${cvo.license_status=='Y'}">style="color:orange" </c:if> ></i>
	   	
	   	<c:if test="${cvo.license_status=='N' || cvo.license_status=='S' || cvo.license_status==null}">
	   	<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
	   	</c:if>
	   	<c:if test="${cvo.license_status=='Y'}">
	   		<i class="fas fa-shield-alt fa-stack-1x fa-inverse"></i>
	   	</c:if>
	   	</span>선생님 인증</li>
	   	
	   	<li class="list-group-item">
	   	<span class="fa-stack fa-2x">
	   	<i class="fas fa-circle fa-stack-2x"  <c:if test="${cvo.school_status=='Y'}">style="color:orange" </c:if> ></i>
	   	
	   	<c:if test="${cvo.school_status=='N' || cvo.school_status=='S'|| cvo.school_status==null}">
	   	<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
	   	</c:if>
	   	<c:if test="${cvo.school_status=='Y'}">
	   		<i class="fas fa-shield-alt fa-stack-1x fa-inverse"></i>
	   	</c:if>
	   	</span>학교 인증</li>
	   	
	   	<li class="list-group-item">
	   	<span class="fa-stack fa-2x">
	   	<i class="fas fa-circle fa-stack-2x"  <c:if test="${cvo.crime_status=='Y'}">style="color:orange" </c:if> ></i>
	   	
	   	<c:if test="${cvo.crime_status=='N' || cvo.crime_status=='S' || cvo.school_status==null}">
	   	<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
	   	</c:if>
	   	<c:if test="${cvo.crime_status=='Y'}">
	   		<i class="fas fa-shield-alt fa-stack-1x fa-inverse"></i>
	   	</c:if>
	   	
	   	</span>성범죄 경력 조회 인증</li>
	   	
   	</ul>
   	
   	<h5>간단 자기소개</h5>
   	<ul class="list-group">
   	<li class="list-group-item p-5" style="text-align:center">
		  <c:if test="${vo.intro!=null }">	${vo.intro }</c:if>
	   <c:if test="${vo.intro==null }">작성 시 부모로부터<br/>
			<span class="boldFont">4배 더 많은 선택</span>을 받게 됩니다!</c:if>
   	</li></ul>
   	<h5>선호하는 돌봄유형</h5>
   	<ul class="list-group">
   	<li class="list-group-item p-5" style="text-align:center">
   		"저는 <span class="boldFont">${vo.care_type}</span> 돌봄을 가장 선호해요"
   	</li>
   	</ul>
   	<h5>활동 가능 시간</h5>
   	<ul class="list-group">
   	<li class="list-group-item">스케쥴차트</li>
   	</ul>
   	<c:set var = "str" value = "${vo.child_age}"/>
   	<h5>돌봄 가능 연령</h5>
   	<ul class="list-group">
   	<li class="list-group-item">
	   	<ul class="list-group list-group-horizontal-sm" >
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${!fn:contains(str, '신생아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '신생아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-s.svg"</c:if> 
			alt="신생아" /><br/>신생아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '영아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '영아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-s.svg"</c:if>
			 alt="영아" /><br/>영아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '유아')}">
			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '유아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-s.svg"</c:if>
			 alt="유아" /><br/>유아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${!fn:contains(str, '초등학생')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-n.svg"</c:if> 
			<c:if test = "${fn:contains(str, '초등학생')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-s.svg"</c:if> 
			 alt="초등학생" /><br/>초등학생</li>
	   </ul>
   </li>
   </ul>
   <c:set var = "str" value = "${vo.activity_type}"/>
   <h5>가능한 활동</h5>
   <ul class="list-group">
   <li class="list-group-item">
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-s.svg" </c:if> 
	   			/><br/>실내놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-s.svg" </c:if>
	   			/><br/>등하원돕기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-n@2x.png" </c:if>
	   			<c:if test = "${fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-s@2x.png" </c:if>
	   			 /><br/>책읽기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-s.svg" </c:if> 
	   			/><br/>야외활동</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-s-2.svg" </c:if>
	   			 /><br/>한글놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				 <c:if test = "${!fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg" </c:if> 
				<c:if test = "${fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-s.svg" </c:if> 
				/><br/>영어놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-s.svg" </c:if>
				/><br/>학습지도</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-s.svg" </c:if>		
				/><br/>체육놀이</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '간단 청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '간단 청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-s.svg"</c:if>
				/><br/>간단 청소</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '밥 챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '밥 챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-s.svg"</c:if>
				/><br/>밥 챙겨주기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '간단 설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '간단 설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-s.svg" </c:if>						
				/><br/>간단 설거지</li>
   		
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-s.svg"</c:if>
				/><br/>장기입주</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"</c:if> 
				<c:if test = "${fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-s.svg"</c:if> 			
				/><br/>단기입주</li>

   		</ul>
   	</li>
   	</ul>	
		<h5>활동 가능 지역</h5>
		<ul class="list-group">
		<li class="list-group-item p-4"><span class="badge badge-warning">1순위</span> ${vo.area1} </li>
		</ul>
		
		<!-- 타인에게만 보여주는 지도 -->
		<c:if test="${mvo.userid!=paramid}">
		<h5>출발 위치</h5>
		<div id="map"></div>
		<div style="font:0.8em gray; text-align:center; width:100%;" >※돌봄몬의 개인정보보호를 위해 대략적인 위치만 표시됩니다.</div>
		</c:if>
		
		
		
   		<h5>관련 경험</h5>
   		<ul class="list-group">
   		<li class="list-group-item p-4">
   		<c:forEach var="evo" items="${list}">
   			<b>${evo.exp_content}</b><br/>
   			${evo.exp_start} ~ ${evo.exp_end}<br/><br/>
   		</c:forEach>	
   		</li>
   		</ul>
   		
   		<h5>후기</h5>
   		<ul class="list-group">
   		<li class="list-group-item">
   		<c:forEach var="rvo" items="${review}">
   			<ul class="list-group list-group-horizontal" style="margin:0; padding:0;">
	   			<li class="list-group-item" style="border:none; margin-top:5px;padding-left:0;">
	   				<img src="upload/${rvo.pic}" style="width:60px; height:60px; border-radius:10px;margin-left:10px;"/>
	   			</li>
	   			<li class="list-group-item" style="border:none; padding-left:0;">
		   			${rvo.username.substring(0,1)}O${rvo.username.substring(2) }
		   			<br/>
		   			<c:forEach var="s" begin="1" end="${rvo.review_star}">
		   				<i class="fas fa-star" style="color:orange"></i>
		   			</c:forEach>
		   			<c:forEach var="s" begin="1" end="${5-rvo.review_star}">
		   				<i class="fas fa-star" style="color:gray"></i>
		   			</c:forEach>
		   			
		   			<span class="ml-2" style="font-size:0.7em">
						<fmt:parseNumber integerOnly="true" var="edit_year" value="${rvo.review_date/525600}"/>
						<fmt:parseNumber integerOnly="true" var="edit_month" value="${rvo.review_date/43200}"/>
						<fmt:parseNumber integerOnly="true" var="edit_day" value="${rvo.review_date/1440}"/>
						<fmt:parseNumber integerOnly="true" var="edit_hour" value="${rvo.review_date/60}"/>					
					<c:choose>
						<c:when test="${rvo.review_date>525600}">${edit_year}년</c:when>
						<c:when test="${rvo.review_date>43200}">${edit_month}달</c:when>
						<c:when test="${rvo.review_date>1440}">${edit_day}일</c:when>
						<c:when test="${rvo.review_date>60}">${edit_hour}시간</c:when>
						<c:otherwise>${rvo.review_date}분</c:otherwise>
					</c:choose>
					 전
				</span>
		   			<br/>
		   			
		   			
		   			
		   			<b>${rvo.review_content}</b><br/>
	   			</li>
   			</ul>
   		</c:forEach>	
   		</li>
   		</ul>
   		
   		
   <br/>
   
   	
   
   
   <!-- ================================지도======================================== -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${mvo.lat}, ${mvo.lng}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(false);    


var imageSrc = 'img/orangeMarker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(90, 90), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 45)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(${mvo.lat}, ${mvo.lng}); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
</script>


   
</div>




</body>
</html>

<jsp:include page="../footer.jsp"/>