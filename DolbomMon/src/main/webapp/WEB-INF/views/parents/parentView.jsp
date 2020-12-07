<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
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
	#dbmDiv{height:200px;margin-top:50px;}
	#applyDbmList h6{height:7%;}
 	.ui-datepicker:nth-of-type(1){width:100%;}
 	.ui-datepicker td>a{text-align:center;}
 	.divOff{display:none;}
 	.divOn{display:inline-block;}
 	
 	
 	#regularDate{
 		display:inline-block;
 		width:100%;
 	}
 	#regularDate #timeDiv{width:50px;float:left;}
 	#regularDate #dateDiv{float:left; margin-left:50px;}
 	#regularDate .settime{
 		height:40px; 
 		text-align:center;
 	}
 	#regularDate .dateCls{text-align:center;}
 	#timebarDiv {position:relative;width:0px;height:0px;}
 	.tilebar{width:50px;position:relative;top:210px;  text-align:center;background-color:green;}
 	
 	
</style>

<script>
	// 신생아 0-6개월, 영아 7-36개월, 유아 4-7세, 초딩
	var pw_activityStr = '${rbVO.pw_activity }';
	var cb = '${cVO.child_birth}';
	var care_addr = "${rbVO.care_addr}";
	var child_age1;
	var child_age2;
	var sd = "${sdVO.select_date}";
	
	$(function(){
		
		function available(date) {
			var selectedDate = sd.split(",");
			
			var thismonth = date.getMonth()+1;
			var thisday = date.getDate();
			if(thismonth<10){
				thismonth = "0"+thismonth;
			}
			if(thisday<10){
				thisday = "0"+thisday;
			}
		    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;
		    if ($.inArray(ymd, selectedDate) >= 0) {
		        return [true,"",""];
		    } else {
		        return [false,"",""];
		    }
		}

		$("#specificDate").datepicker({ // 고정 데이트피커
			yearRange : 'c-100:c',
			format : "yy-mm-dd",
			beforeShowDay: available
		});
	});
	
	$(document).ready(function(){
		
		
		
		
		
		///////////////////////////////////
		var dbmid = $(this).parents("#dbmDiv").children("#dbmid").val();
		///////////////////// 원하는 활동 ///////////////////
		$(".pwa").each(function(){
			var selectedData = $(this).text();
			var nowImg = $(this).children("img").attr("src");
			pw_activity = pw_activityStr.split(',');
			for(var i=0;i<pw_activity.length;i++){
				if(selectedData==pw_activity[i]){
					if(pw_activity[i]=="등하원돕기"){
						var newImg = nowImg.replace("-n@", "-s@");
						$(this).children("img").attr("src", newImg);
												
					}else if(pw_activity[i]=="한글놀이"){
						var newImg = nowImg.replace("-n-", "-s-");
						$(this).children("img").attr("src", newImg);
						
					}else{
						var newImg = nowImg.replace("-n.", "-s.");
						$(this).children("img").attr("src", newImg);
					}
				}
			}
		});
		
		//////////////////// 자녀 정보 /////////////////////
		var cbArr = cb.split(",");
		for(var i=0; i<cbArr.length;i++){
			console.log("cbArr => " + cbArr[i]);
			var childYMD = cbArr[i].split("-");
			var child_birth = childYMD[0] + "," + childYMD[1] + "," +childYMD[2];
			console.log("child_birth => " + child_birth);
			getAge(child_birth);
			
			if(child_age2 == "초등학생"){
				$("#childList").append('<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/profile-child.png" style="width:50px; height:50px;"/><br/>'+child_age1+'</li>');
			}else if(child_age2 == "유아"){
				$("#childList").append('<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/profile-elementary.png" style="width:50px; height:50px;"/><br/>'+child_age1+'</li>');
			}else if(child_age2 == "영아"){
				$("#childList").append('<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/profile-infant.png" style="width:50px; height:50px;"/><br/>'+child_age1+'</li>');
			}else if(child_age2 == "신생아"){
				$("#childList").append('<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/profile-newborn.png" style="width:50px; height:50px;"/><br/>'+child_age1+'</li>');
			}
		}
		
		
		
	});
	$(function(){
		
		$("#testBtn").click(function(){
			
			console.log("pwa => " + pw_activityStr);
			
			console.log("child_birth => " + cb);
			
			console.log("care_addr => " + care_addr);
			
		
		});
		
		$("#applyBtn").click(function(){
			var applyQna = confirm("신청하시겠습니까?");
			if(applyQna){
				location.href="<%=request.getContextPath()%>/applyToParent?no=${rbVO.job_board_no}";
			}else{
			
			}
		});
		
		$(document).on('click', '#refusalBtn', function(){
			var dbmid = $(this).parents("#dbmDiv").children("#dbmid").val();
			
			$.ajax({
	          	url:"refusalDbm",
	          	type:"post",
	            data:{dbmid: dbmid
	            },
	            success:function(result){
	            	console.log("result => " + result);
	               	if(result>0){
	               		alert("거절하였습니다");
	               		location.reload();
	               	}else{
	               		
	               	}
	            }, error:function(){
	                    
	            }
	    	});
		});
		
		$(document).on('click', '#cancleBtn', function(){
			var cancleQna = confirm("정말 취소하시겠습니까?");
			var dbmid = $(this).parents("#dbmDiv").children("#dbmid").val();
			
			if(cancleQna){
				$.ajax({
		          	url:"applyCancel",
		          	type:"post",
		            data:{dbmid: dbmid
		            },
		            success:function(result){
		            	console.log("result => " + result);
		               	if(result>0){
		               		alert("취소하였습니다");
		               		location.reload();
		               	}else{
		               		2
		               	}
		            }, error:function(){
		                    
		            }
		    	});
			}
			
		});

		$("#deleteBtn").click(function(){
			var deleteConfirm = confirm("삭제하시겠습니까?");
			location.href="<%=request.getContextPath()%>/deleteBoard?no=${rbVO.job_board_no}";
		});
		var start_time = "${rdVO.start_time}";
		var end_time = "${rdVO.end_time}";
		var start_date = "${rdVO.start_date}";
		var end_date = "${rdVO.end_date}";
		var syoil = "${rdVO.yoil}";
		var selectedYoil = syoil.split(",");
		
		for(var i=0;i<7;i++){
			if(selectedYoil[i] == "일"){
				selectedYoil[i] = 0;
			}else if(selectedYoil[i] == "월"){
				selectedYoil[i] = 1;
			}else if(selectedYoil[i] == "화"){
				selectedYoil[i] = 2;
			}else if(selectedYoil[i] == "수"){
				selectedYoil[i] = 3;
			}else if(selectedYoil[i] == "목"){
				selectedYoil[i] = 4;
			}else if(selectedYoil[i] == "금"){
				selectedYoil[i] = 5;
			}else if(selectedYoil[i] == "토"){
				selectedYoil[i] = 6;
			}
		}
		
		var tag = "";
		var today = new Date();
		
		
		
		for(var i=0; i<120; i++){
			console.log("st => " + start_time);
			console.log("et => " + end_time);
			console.log("yoil => " + selectedYoil);
			var nextDay = new Date(today.getFullYear(), today.getMonth(), today.getDate()+i);
			var year = nextDay.getFullYear();
			var month = nextDay.getMonth()+1;
			var date = nextDay.getDate();
			var day = nextDay.getDay();
			var yoil = "";
			if(day==0){
				yoil = "일";
			}else if(day==1){
				yoil = "월";
			}else if(day==2){
				yoil = "화";
			}else if(day==3){
				yoil = "수";
			}else if(day==4){
				yoil = "목";
			}else if(day==5){
				yoil = "금";
			}else if(day==6){
				yoil = "토";
			}
			
			tag += "<div class='dateCls' style='width:50px;height:50px;float:left;'><span class='yoilCls'>"+yoil+"</span><br/>"+month+"/"+date+"</div>"
		}
		
		$("#regularDate #dateDiv").append(tag);
		
	});
	
	function getAge(a){
		var today = new Date();
		var birthDay = new Date(a);
		
		var time = Math.floor((today - birthDay) / 86400000);
		var year = Math.floor(time/365)+1;
		var month = Math.ceil(time/30);
		if(month >= 96 && year < 14){
			console.log("초딩"+year+"세");
			child_age2 = "초등학생";
			child_age1 = year+"세";
		}else if(month<96 && month>=37){
			console.log("유아"+year+"세");
			child_age2 = "유아";
			child_age1 = year+"세";
		}else if(month<=36 && month>=7){
			console.log("영아"+month+"개월");
			child_age2 = "영아";
			child_age1 = month + "개월";
		}else{
			console.log("신생아"+month+"개월");
			child_age2 = "신생아";
			child_age1 = month + "개월";
		}
	}
	
</script>
</head>
<body>

<div class="container">
   <div class="badge badge-warning badge-pill float-right mt-3 p-2"><img src="icon/icon-alarm.png" style="width:1em; height:1em"/>신고</div>
   <img class="rounded mx-auto d-block" id="profimg" src="img/profilepic.png"/>
   <ul class="list-group">
         <li class="list-group-item align-middle"><span  style="font-size:1.4em; font-weight:bold">이O준</span><span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2">학부모</span><br/>
         <c:forEach var="s" begin="1" end="5"><i class="fas fa-star"></i></c:forEach> <span class="mx-2"></span> | <span class="ml-2">no.${rbVO.job_board_no }</span></li>
   </ul>
   <br/>
   <ul class="list-group list-group-horizontal-sm">
         <li class="list-group-item col-4" style="text-align:center"><i class="fas fa-search mr-2"></i>조회수<br/><div>${rbVO.hit }</div></li>
         <li class="list-group-item col-4" style="text-align:center"><i class="far fa-clock mr-2"></i>프로필 작성<br/>3일 전</li>
         <li class="list-group-item col-4" style="text-align:center"><i class="fas fa-video mr-2"></i>CCTV<br/>ㅇ</li>
   </ul>
   <ul class="list-group">
      <li class="list-group-item">
         <div class="row">
            <div class="col-1">
            <span class="fa-stack fa-2x"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-check fa-stack-1x fa-inverse"></i></span>
            </div>
            <div class="col-10 ml-3 mt-1">
            <b style="font-size:1.2em">본인 인증 완료</b><br/>
            돌봄몬 고객안전관리팀에서 실명 / 생년월일 /  연락처를 확인하였습니다.
            </div>
         </div>
      </li>
      </ul>
      
    <h5>신청 내용</h5>
    <li class="list-group-item p-5" style="text-align:center"><c:if test="${rbVO.content==null || rbVO.content=='' }" >아직 작성하지 않았습니다.</c:if><c:if test="${rbVO.content!=null || rbVO.content!='' }">${rbVO.content }</c:if></li>
    <h5>돌봄 지역</h5>
   	<li class="list-group-item p-4"><span class="badge badge-warning"></span> ${rbVO.care_addr }
      	<div id="map" style="width:100%;height:300px;"></div>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng("${rbVO.lat}", "${rbVO.lng}"), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
	
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		</script>
      	</li>
      	<h5>돌봄 기간/시간</h5>
      	<div style="display:inline-block; border:1px solid #EFEFEF; height:auto; width:100%;;">
      		
      		<c:if test="${rbVO.time_type=='S' }" >
				<div id="specificDate">
					
				</div>
				<div>
					<input class="" type="text" value="${sdVO.start_time }" readonly="readonly"/>
					<input class="" type="text" value="${sdVO.end_time }" readonly="readonly"/>
					${sdVO.select_date }
					
				</div>
			</c:if>
			<c:if test="${rbVO.time_type=='R' }">
				<div id="regularDate" style="overflow:scroll;">
					<div id="timeDiv" style="width:50px; height:570px; float:left;">
						<div id="dateDiv" style="width:6050px;">
							<div id="timebarDiv"></div>
						</div>
						<div class="settime" style="margin-top:50px;">00:00</div>
						<div class="settime">02:00</div>
						<div class="settime">04:00</div>
						<div class="settime">06:00</div>
						<div class="settime">08:00</div>
						<div class="settime">10:00</div>
						<div class="settime">12:00</div>
						<div class="settime">14:00</div>
						<div class="settime">16:00</div>
						<div class="settime">18:00</div>
						<div class="settime">20:00</div>
						<div class="settime">22:00</div>
						<div class="settime">00:00</div>
					</div>
					
				</div>
			</c:if>
			<div>
				
			</div>
      	</div>
      	
      	<h5>자녀 정보</h5>
      				<input class="" type="text" value="${rdVO.start_time }" readonly="readonly"/>
					<input class="" type="text" value="${rdVO.end_time }" readonly="readonly"/>
      	<li class="list-group-item">
		<ul id="childList" class="list-group list-group-horizontal-sm" >
         	
      	</ul>
   </li>
   <h5>선호하는 돌봄유형</h5>
   <li class="list-group-item">
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg" /><br/>실내놀이</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-n@2x.png" style="width:56px; height:56px;" /><br/>등하원돕기</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg" /><br/>책읽기</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg"/><br/>야외활동</li>
         </ul>
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg"/><br/>한글놀이</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg"/><br/>영어놀이</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg"/><br/>학습지도</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg"/><br/>체육놀이</li>
         </ul>
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"/><br/>간단청소</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"/><br/>밥챙겨주기</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg"/><br/>간단설거지</li>
         
         </ul>
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"/><br/>장기입주</li>
            <li class="list-group-item col-3 pwa" style="text-align:center; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"/><br/>단기입주</li>

         </ul>
      </li> 
      
      
        <h5>그 외에 요청사항</h5>
        <li class="list-group-item p-4">
        	<b>희망 돌봄몬 성별 : <c:if test="${rbVO.wish_gender=='F'}">여자</c:if><c:if test="${rbVO.wish_gender=='M'}">남자</c:if><c:if test="${rbVO.wish_gender=='A'}">무관</c:if></b><br/>
            
        </li>
        </ul>
        
		<c:if test="${userid == rbVO.userid}">
			<h5>나에게 신청한 돌봄몬</h5>
			<c:forEach var="tlist" items="${tlist }">
		        <div class="wrapper2" style="margin:5px 0;" id="dbmDiv">
		        	<input type="hidden" id="dbmid" value="${tlist.userid }" />
					<ul class="list-group">
						<li class="list-group-item"><i class="fas fa-star"></i>
							<ul class="list-group list-group-horizontal">
		
								<li class="list-group-item border-0 col-3">
				
									<img <c:if test="${tlist.pic==null}">src="img/profilepic.png"</c:if><c:if test="${tlist.pic!=null}">src="upload/${tlist.pic}"</c:if> class="rounded-circle" style="width:100%;height:100%;"/><br/><br/>
								</li>
								<li class="list-group-item border-0 col-9" id="applyDbmList">
									<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/favorites/s-list-like-off.png" alt="favorites" style="color:orange; height:30px; width:30px; float:right;">
									<h6 style="color:orange;">이름 - ${tlist.username }</h6> 
									<h6><b>나이 - ${tlist.birth }세</b></h6>
									<h6><b>지원시간</b> | ${tlist.apply_date }</h6>
									<h7>CCTV 촬영가능여부 - ${tlist.cctv } | ? | ? </h7><br/><br/>
									<h6 style="color:orange;"><i class="fas fa-coins mr-1"></i>희망 시급 ${tlist.desired_wage } | <b>협의가능</b></h6>
									<input class="btn btn-warning" type="button" value="거절하기" id="refusalBtn" style="float:right;" /><input type="button" class="btn btn-warning" id="d" value="협의하기" style="float:right;"/><input class="btn btn-warning" type="button" value="채팅하기" style="float:right;" />
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</c:forEach>
			
					
      	</c:if>
      	
        <c:if test="${who=='T' }">
        	<c:if test="${apChk<1 }">
        		<div style="text-align:center; margin:50px 0">
					<input id="applyBtn" type="button" value="신청하기" style="width:40%; height:50px;"/>
				</div>
        	</c:if>
        	<c:forEach var="tlist" items="${tlist }">
        	
        		<c:if test="${userid == tlist.userid }" >
			        <div class="wrapper2" style="margin:5px 0;" id="dbmDiv">
			        	<input type="hidden" id="dbmid" value="${tlist.userid }" />
						<ul class="list-group">
							<li class="list-group-item"><i class="fas fa-star"></i>
								<ul class="list-group list-group-horizontal">
			
									<li class="list-group-item border-0 col-3">
					
										<img <c:if test="${tlist.pic==null}">src="img/profilepic.png"</c:if><c:if test="${tlist.pic!=null}">src="upload/${tlist.pic}"</c:if> class="rounded-circle" style="width:100%;height:100%;"/><br/><br/>
									</li>
									<li class="list-group-item border-0 col-9" id="applyDbmList">
										<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/favorites/s-list-like-off.png" alt="favorites" style="color:orange; height:30px; width:30px; float:right;">
										<h6 style="color:orange;">이름 - ${tlist.username }</h6> 
										<h6><b>나이 - ${tlist.birth }세</b></h6>
										<h6><b>지원시간</b> | </h6>
										<h6><c:if test="${tlist.cctv == 'Y'}">CCTV가 있어도 당당히 일할 수 있습니다.</c:if><c:if test="${tlist.cctv == 'N'}">CCTV촬영을 원하지 않습니다.</c:if></h6><br/>
										<h6 style="color:orange;"><i class="fas fa-coins mr-1"></i>희망 시급 ${tlist.desired_wage } | <b>협의가능</b></h6>
										<input class="btn btn-warning" type="button" value="취소하기" id="cancleBtn" style="float:right;" />
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
        </c:if>
	<br/>
   	<c:if test="${userid == rbVO.userid}">
   		<div style="margin:50px 0; text-align:right;">
			<input type="button" class="btn btn-warning ed" value="수정하기" style="margin-right:10px;"/><input type="button" id="deleteBtn" class="btn btn-warning ed" value="삭제하기"/>
		</div>
 	</c:if>
</div>

</body>
</html>

