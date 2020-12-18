<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/multidatepicker.css" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.container{width:800px;}
	i{color:gray;}
	#profimg{
	   	width:100px;
		height:100px;
	}
	h5{
	   padding: 20px 0px 0px 0px;
	   font-weight: bold;
	}
	 .fa-check-circle{
	 font-size:60px;
	 margin: 8px;
	}
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
 		line-height:40px;
 		text-align:center;
 	}
 	#regularDate .dateCls{text-align:center;}
 	#timebarDiv {position:relative;width:0px;height:0px;}
 	.timebar{position:absolute;top:50px; background-color:orange;opacity:0.7; width:50px;}
 	.clearfix:after { clear:both; }
 	
 	.viewContract{
		position: relative;
	    margin: 0 5px;
	    top: 0px;
	    right: 0px;
	}
</style>

<script>

	// 신생아 0-6개월, 영아 7-36개월, 유아 4-7세, 초딩
	var pw_activityStr = '${rbVO.pw_activity }';
	var care_addr = "${rbVO.care_addr}";
	var cb = '${cVO.child_birth}';
	var child_age1;
	var child_age2;
	
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
	
	$(function(){
		////////////////////자녀 정보 /////////////////////
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
		
	});
	$(function(){
		var popupWidth = 1060;
		var popupHeight = 596;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		$(document).on("click",".cBtn",function(){
			popupWidth = 1060;
			popupHeight = 656;
			var userid = $(this).attr('id');
			window.open('/dbmon/chat?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		});
		
		$(document).on("click",".contractOpen",function(){
			popupWidth = 1060;
			popupHeight = 1600;
			var userid = $(this).attr('id');
			window.open('/dbmon/contractOpen?userid='+userid+'&no='+${rbVO.job_board_no }, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		});
		$(document).on("click",".viewContract",function(){
			popupWidth = 1060;
			popupHeight = 1600;
			var origin_no = $(this).attr('id');
			var teacherid = $(this).prev().attr('id'); //아래 버튼 위치 수정하면 이것도 수정
			window.open('/dbmon/contractView?origin_no='+origin_no+'&teacherid='+teacherid+'&payment=${checkVo.payment}', '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		});
		
		
		
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
			var jobNo = $("#jobNo").text();
			$.ajax({
	          	url:"refusalDbm",
	          	type:"post",
	            data:{dbmid: dbmid,
	            	no : jobNo
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
			var jobNo = $("#jobNo").text();
			console.log("jobNo => " + jobNo);
			if(cancleQna){
				$.ajax({
		          	url:"applyCancel",
		          	type:"post",
		            data:{dbmid: dbmid,
		            	no : jobNo
		            },
		            success:function(result){
		            	console.log("result => " + result);
		               	if(result>0){
		               		alert("취소하였습니다");
		               		location.reload();
		               	}else{
		               		
		               	}
		            }, error:function(){
		                    
		            }
		    	});
			}
			
		});

		$("#deleteBtn").click(function(){
			var deleteConfirm = confirm("삭제하시겠습니까?");
			var applyCnt = ${rbVO.tcnt};
			if(applyCnt == 0){
				location.href="<%=request.getContextPath()%>/deleteBoard?no=${rbVO.job_board_no}";
			}else {
				swal({
					title : "이미 지원한 선생님이 있습니다.",
					icon : "info"
				});
			}
		});
		
		$("#editBtn").click(function(){
			var applyCnt = ${rbVO.tcnt};
			console.log("지원자 수 => " + applyCnt);
			if(applyCnt == 0){
				location.href="<%=request.getContextPath()%>/editBoard?no=${rbVO.job_board_no}";
			}else{
				swal({
					title : "이미 지원한 선생님이 있습니다.",
					icon : "info"
				});
			}
		});
		
		var time_type = "${rbVO.time_type}";
		/////////////////////////////////////////////////// 
		console.log("time type => " + time_type);
		if(time_type=="R") {
		///////////////////////////////////////// rd
		var start_time = "${rdVO.start_time}";
		var end_time = "${rdVO.end_time}";
		console.log("endtime in r => " + end_time);
		var start_date = "${rdVO.start_date}";
		var end_date = "${rdVO.end_date}";
		var syoil = "${rdVO.yoil}";
		var selectedYoil = syoil.split(",");
		console.log("start_date => " + start_date);
		console.log("end_date => " + end_date);
		console.log("start_time => " + start_time);
		console.log("end_time => " + end_time);
		var tag = "";
		var today = new Date();
		var startday = new Date(start_date);
		var endday = new Date(end_date);
		
		var getYoil = new Array();
		for(var i=0;i<7;i++){
			if(selectedYoil[i] == "일"){
				getYoil[i] = 7;
			}else if(selectedYoil[i] == "월"){
				getYoil[i] = 1;
			}else if(selectedYoil[i] == "화"){
				getYoil[i] = 2;
			}else if(selectedYoil[i] == "수"){
				getYoil[i] = 3;
			}else if(selectedYoil[i] == "목"){
				getYoil[i] = 4;
			}else if(selectedYoil[i] == "금"){
				getYoil[i] = 5;
			}else if(selectedYoil[i] == "토"){
				getYoil[i] = 6;
			}
		}
		var first = 0;
		var cnt = 0;
		var ttest = 0;
		var gylength = getYoil.length;
		console.log("시작날짜의 요일 => " + startday.getDay());
		console.log("같은 요일 체크 전 =>" + getYoil);
		for(var i=0;i<getYoil.length;i++){
			if(getYoil[i]==(startday.getDay())){
				console.log("입력한 요일 중 시작날의 요일과 같은 요일이 있는 경우")
				cnt = 1;
				var idx = getYoil.indexOf(getYoil[i]);
				console.log("삭제할 배열의 인덱스 =>" + idx);
				getYoil.splice(idx,1);
				console.log("삭제 후 => " +  getYoil);
				getYoil.unshift(startday.getDay());
			}
		}
		
		console.log("정렬 후 v => " + getYoil);
		var cnt = 0;
		for(var i=0;i<getYoil.length;i++){
			if(getYoil[i]<startday.getDay()){
				cnt = cnt + 1;
			}else {
				cnt = 0;
			}
		}
		
		if(cnt==0){
			console.log("선택날짜에 해당요일이 없는 경우");
			console.log("요일 확인 => " + getYoil);
			lbl :
			for(var i=0;i<7;i++){
				for(var j=0;j<7;j++){
					mdata = getYoil[j]-i;
					pdata = getYoil[j]+i;
					
					if(pdata == 8){
						pdata = 1;
					}else if(pdata == 9){
						pdata = 2;
					}else if(pdata == 10){
						pdata = 3;
					}else if(pdata == 11){
						pdata = 4;
					}else if(pdata == 12){
						pdata = 5;
					}else if(pdata == 13){
						pdata = 6;
					}
					
					if(mdata == 0){
						mdata = 7;
					}else if(mdata == -1){
						mdata = 6;
					}else if(mdata == -2){
						mdata = 5;
					}else if(mdata == -3){
						mdata = 4;
					}else if(mdata == -4){
						mdata = 3;
					}else if(mdata == -5){
						mdata = 2;
					}else if(mdata == -6){
						mdata = 1;
					}
					
					if(mdata==startday.getDay()){
						console.log("mdata로 설정됨 => " + mdata);
						var idx = getYoil.indexOf(getYoil[j]);
						var temp = getYoil[j];
						console.log("삭제할 배열의 인덱스 =>" + idx);
						getYoil.splice(idx,1);
						console.log("삭제 후 => " +  getYoil);
						getYoil.unshift(temp);
						console.log("다시 정렬 후 => " +  getYoil);
						break lbl; 
					}
					
					/* if(pdata==startday.getDay()){
						console.log("pdata로 설정됨 => " + pdata);
						var idx = getYoil.indexOf(getYoil[j]);
						var temp = getYoil[j];
						console.log("삭제할 배열의 인덱스 =>" + idx);
						getYoil.splice(idx,1);
						console.log("삭제 후 => " +  getYoil);
						getYoil.unshift(temp);
						console.log("다시 정렬 후 => " +  getYoil);
						break lbl;
					} */
				}
			}
		}
		
		console.log("시작일 확인 =>" + startday.getDay());
		if(cnt==0){
			if(startday.getDay()>getYoil[0]){
				cnt = 1;
				loop :
				for(var i=1;i<7;i++){
					
					var data = getYoil[0]+i;
					if(data == 8){
						data = 1;
					}else if(data == 9){
						data = 2;
					}else if(data == 10){
						data = 3;
					}else if(data == 11){
						data = 4;
					}else if(data == 12){
						data = 5;
					}else if(data == 13){
						data = 6;
					}
					if(data == startday.getDay()){
						console.log("fiiiiiiirst ++  => " - i);
						startday = new Date(startday.getFullYear(), startday.getMonth(), startday.getDate()-i);
						break loop;
					}
				}
			}else {
				cnt = 1;
				loop :
				for(var i=1;i<7;i++){
					
					var data = getYoil[0]-i;
					if(data == 0){
						data = 7;
					}else if(data == -1){
						data = 6;
					}else if(data == -2){
						data = 5;
					}else if(data == -3){
						data = 4;
					}else if(data == -4){
						data = 3;
					}else if(data == -5){
						data = 2;
					}else if(data == -6){
						data = 1;
					}
					if(data == startday.getDay()){
						console.log("fiiiiiiirst -- => " + i);
						startday = new Date(startday.getFullYear(), startday.getMonth(), startday.getDate()+i);
						break loop;
					}
				}
			}
		}else {
			console.log("입력한 모든 요일이 시작 요일 뒤에 있는 경우 => " + getYoil[0]);
			for(var i=1;i<7;i++){
				var startdaypp = startday.getDay()+i;
				if(startdaypp==8){
					startdaypp=1;
				}else if(startdaypp==9){
					startdaypp=2;
				}else if(startdaypp==10){
					startdaypp=3;
				}else if(startdaypp==11){
					startdaypp=4;
				}else if(startdaypp==12){
					startdaypp=5;
				}else if(startdaypp==13){
					startdaypp=6;
				}else if(startdaypp==14){
					startdaypp=7;
				}
				if(startdaypp == getYoil[0]){
					console.log("선택한 요일이 시작 요일보다 전부 앞에 있는 경우 => " + i );
					startday = new Date(startday.getFullYear(), startday.getMonth(), startday.getDate()+i);
				}
			}
		}
		
		console.log("입력받은 요일 => " + selectedYoil);
		console.log("시작일의 요일 => " + startday.getDay());
		console.log("정렬 전 => " + getYoil);
		 // 시작일의 요일과 입력받은 요일들 중 같은 값이 있는지 확인
		
		
		var pdata;
		var mdata;
		
		if(cnt == 120){
			console.log("선택날짜에 해당요일이 없는 경우");
			lbl :
			for(var i=0;i<7;i++){
				for(var j=0;j<7;j++){
					mdata = getYoil[j]-i;
					pdata = getYoil[j]+i;
					console.log("mdata 확인 => " + mdata);
					console.log("pdata 확인 => " + pdata);
					if(pdata == 7){
						pdata = 1;
					}else if(pdata == 8){
						pdata = 2;
					}else if(pdata == 9){
						pdata = 3;
					}else if(pdata == 10){
						pdata = 4;
					}else if(pdata == 11){
						pdata = 5;
					}else if(pdata == 12){
						pdata = 6;
					}else if(pdata == 13){
						pdata = 1;
					}
					
					if(mdata == 0){
						mdata = 7;
					}else if(mdata == -1){
						mdata = 6;
					}else if(mdata == -2){
						mdata = 5;
					}else if(mdata == -3){
						mdata = 4;
					}else if(mdata == -4){
						mdata = 3;
					}else if(mdata == -5){
						mdata = 2;
					}else if(mdata == -6){
						mdata = 1;
					}
					
					console.log("시작일 확인 =>" + startday.getDay());
					if(mdata==startday.getDay()){
						console.log("mdata로 설정됨 => " + mdata);
						first = first+i;
						console.log("이동할 날짜  => " + first);
						break lbl; 
					}
					
					if(pdata==startday.getDay()){
						console.log("pdata로 설정됨 => " + pdata);
						first = first+i;
						console.log("이동할 날짜  => " + first);
						break lbl;
					}
				}
			}
			
			startday = new Date(startday.getFullYear(), startday.getMonth(), startday.getDate()+first);
			
			for(var i=0;i<getYoil.length;i++){
				if(getYoil[i]==(startday.getDay())){
					first = getYoil[i];
					console.log("getDay => " + startday.getDay());
					console.log("getYoil => " + getYoil[i]);
					console.log("인덱스 => " + i);
					cnt = 1;
					var idx = getYoil.indexOf(getYoil[i]);
					console.log("?" + idx);
					getYoil.splice(idx,1);
					console.log("지우기" +  getYoil);
					getYoil.unshift(startday.getDay());
				}
			}
			
		}
		
		console.log("바뀐 데이터 => " + getYoil);
		
		var mn = 0;
		if(getYoil[0]==1){
			mn=0;
		}else if(getYoil[0]==2){
			mn=1;
		}else if(getYoil[0]==3){
			mn=2;
		}else if(getYoil[0]==4){
			mn=3;
		}else if(getYoil[0]==5){
			mn=4;
		}else if(getYoil[0]==6){
			mn=5;
		}else if(getYoil[0]==7){
			mn=6;
		}
		
		for(var i=0;i<getYoil.length;i++){
			if((getYoil[i]-mn)==0){
				getYoil[i] = 7;
			}else if((getYoil[i]-mn)==-1){
				getYoil[i] = 6;
			}else if((getYoil[i]-mn)==-2){
				getYoil[i] = 5;
			}else if((getYoil[i]-mn)==-3){
				getYoil[i] = 4;
			}else if((getYoil[i]-mn)==-4){
				getYoil[i] = 3;
			}else if((getYoil[i]-mn)==-5){
				getYoil[i] = 2;
			}else if((getYoil[i]-mn)==-6){
				getYoil[i] = 1;
			}else {
				getYoil[i] = getYoil[i] - mn;
			}
		}
		
		console.log("변환 후 => " + getYoil);
		
 		for(var i=0; i<120; i++){
				var nextDay = new Date(startday.getFullYear(), startday.getMonth(), startday.getDate()+i);
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
		
		var stArr = start_time.split(":");
		var etArr = end_time.split(":");
		
		var stH = Number(stArr[0]);
		var stM = Number(stArr[1]);
		
		var etH = Number(etArr[0]);
		var etM = Number(etArr[1]);
		
		var startDivLoc = 0;
		
		startDivLoc = stH*2;
		
		if(stM == '30'){
			startDivLoc = stH*2 + 1;
			console.log("시작 시간 분 O => " + startDivLoc)
		}
		console.log("시작 시간 분 x => " + startDivLoc)
		
		var endDivLoc = 0;
		
		endDivLoc = etH*2;
		
		if(etM == '30'){
			endDivLoc = etH*2 +1;
			console.log("종료시간 분 O => " + endDivLoc)
		}		
		console.log("종료시간 분 X => " + endDivLoc)
		console.log("총 일할 시간 =>" + (endDivLoc - startDivLoc));
		console.log("입력받은 요일 => " + getYoil);
		
		var sd = startday.getTime() - today.getTime();
		var sdd = new Date(start_date);
		console.log("dsd=>" + sdd);
		var ed = endday.getTime() - startday.getTime();
		var edd = new Date(end_date);
		var edl = Math.floor(ed/1000/60/60/24)+1;
		edll = Math.floor(edl/7);
		var edlll = edl%7;
		
		
		console.log("두 날짜 사이의 일 수 => " + edl);
		console.log("두 날짜 사이의 나머지 일 수 => " + edlll);
		console.log("마지막 날짜 => " + edd);
		var weeek = "${rdVO.week}";
		console.log("weeekekekekek -> " + weeek);
		var timebar = "";
		
		for(var j=0;j<weeek;j++){ // j 값에 몇 주치 데이터를 넣을지 정함
			for(var i=0;i<getYoil.length;i++){
				var height = (endDivLoc - startDivLoc)*10;
				var top = startDivLoc*10+50+1;
				if(getYoil[i] == 1){
					var left = Number(350*j)+Number(50*0);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}else if(getYoil[i] == 2){
					var left = Number(350*j)+Number(50*1);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}else if(getYoil[i] == 3){
					var left = Number(350*j)+Number(50*2);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}else if(getYoil[i] == 4){
					var left = Number(350*j)+Number(50*3);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}else if(getYoil[i] == 5){
					var left = Number(350*j)+Number(50*4);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}else if(getYoil[i] == 6){
					var left = Number(350*j)+Number(50*5);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}else if(getYoil[i] == 7){ 
					console.log("칠");
					var left = Number(350*j)+Number(50*6);
					timebar += "<div class='timebar' style='left:"+left+"px;top:"+top+"px;height:"+height+"px'><div style='text-align:center;'>${rdVO.start_time}</div><div style='text-align:center;'>${rdVO.end_time}</div></div>"
				}
			}
		}
		$("#timebarDiv").append(timebar);
		
		}else { /////////////////////////////sd
			var start_time = "${sdVO.start_time}";
			console.log("sd _ start_time => " + start_time);
			var end_time = "${sdVO.end_time}";
			console.log("ed _ end_time => " + end_time);
			
			
			var sd = "${sdVO.select_date}";
			console.log("sdsdsd sd => " + sd);
			var selectedDate = sd.split(", ");
			
			$(function(){
				
				function available(date) {
					
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
		
				$("#specificDate").multiDatesPicker({ // 고정 데이트피커
					numberOfMonths : [1, 2],
					maxDate : "+30d",
					minDate : "0",
					format : "yy-mm-dd",
					beforeShowDay: available
				});
				
				$("#specificDate>div").css("width", "100%");
				$(".ui-state-disabled>span").css("text-align", "center");
				$("a").parent("td").addClass("ui-state-highlight ui-datepicker-current-day");
				$("td a").addClass('ui-state-active');
				$("a").parent("td").css("background-color", "orange");
			});
		}
		//////////////////////////////////////////////////////////////////////////
		function timeForToday(value) {
	        var today = new Date();
	        var timeValue = new Date(value);

	        var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	        if (betweenTime < 1) return '방금전';
	        if (betweenTime < 60) {
	            return betweenTime+"분전";
	        }

	        var betweenTimeHour = Math.floor(betweenTime / 60);
	        if (betweenTimeHour < 24) {
	            return betweenTimeHour+"시간전";
	        }

	        var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	        if (betweenTimeDay < 365) {
	            return betweenTimeDay+"일전";
	        }
	        return Math.floor(betweenTimeDay / 365)+"년전";
	 	}
		var getWritedate = "${rbVO.writedate}";
		console.log("writedate => " + getWritedate);
		var writedatee = timeForToday(getWritedate);
		console.log(writedatee);
		$("#writedate").text(writedatee);
	});
	
	
</script>
<style>
	#specificDate>div{width:100%;}
	.ui-state-disabled>span{text-align:center;}
</style>
</head>
<body>

<%@include file="/WEB-INF/views/top.jsp"%>
<hr/>
<div class="container">
	<div style="margin:20px 0;">
  	 	<img class="rounded-circle mx-auto d-block " id="profimg" <c:if test="${rbVO.pic==null || rbVO.pic==''}" >src="img/profilepic.png" </c:if><c:if test="${rbVO.pic!=null || rbVO.pic != '' }" >src="upload/${rbVO.pic}"</c:if>/>
  	 	<div style="text-align:center;font-size:20px;">${rbVO.title }</div>
   	</div>
   	<div class="clearfix" style="width:100%">
	   <div style="position:relative; float:right; height:1px; top:-420px;">
			<div class="badge badge-warning badge-pill mt-3 p-2"><img src="icon/icon-alarm.png" style="width:1em; height:1em"/></div>
	   </div>
   	</div>
   	<div>
   	<ul class="list-group">
         <li class="list-group-item align-middle"><span  style="font-size:1.4em; font-weight:bold">${rbVO.username }</span><span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2">학부모</span><br/>
         <c:forEach var="s" begin="1" end="5"><i class="fas fa-star"></i></c:forEach> <span class="mx-2"></span> | <span id="jobNo" class="ml-2">${rbVO.job_board_no }</span></li>
   	</ul>
   	</div>
   	<br/>
   	<c:if test="${rbVO.status!='C'}">
   	<ul class="list-group list-group-horizontal-sm">
         <li class="list-group-item col-6" style="text-align:center"><i class="fas fa-search mr-2"></i>지원자 수<br/><div style="color:orange;">현재 ${rbVO.tcnt }명</div></li>
         <li class="list-group-item col-6" style="text-align:center"><i class="far fa-clock mr-2"></i>프로필 작성<br/><div id="writedate" style="color:orange;"></div></li>
   	</ul>
    </c:if>  
    <h5>신청 내용</h5>
    <li class="list-group-item p-5" style="text-align:center"><c:if test="${rbVO.content==null || rbVO.content=='' }" >아직 작성하지 않았습니다.</c:if><c:if test="${rbVO.content!=null || rbVO.content!='' }">${rbVO.content }</c:if></li>
    <h5>돌봄 장소</h5>
   	<li class="list-group-item p-4"><span style="color:orange;">*${rbVO.dong_addr }</span> 
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
	      	<li class="list-group-item" style="border-bottom:none;">
	      		<c:if test="${rbVO.time_consultation == 'Y'}">
	      			<span style="color:orange;">*이 일정은 선생님에 맞춰 얼마든지 조절할 수 있습니다.</span>
	      		</c:if>
	      		<c:if test="${rbVO.time_consultation == 'N'}">
	      			<span style="color:orange;">아래 표시된 날짜만 돌봐주세요.</span>
	      		</c:if>
	      	</li>
      	<div style="display:inline-block; border:1px solid #EFEFEF;border-top:none; height:auto; width:100%;;">
      		<c:if test="${rbVO.time_type=='S' }" >
				<div id="specificDate">
					
				</div>
				<div >
					<div style="width:50%;float:left;text-align:center;font-size:25px;">돌봄시작시간 : <b>${sdVO.start_time }</b></div>
					<div style="width:50%;float:left;text-align:center;font-size:25px;">돌봄종료시간 : <b>${sdVO.end_time }</b></div>
				</div>
			</c:if>
			<c:if test="${rbVO.time_type=='R' }">
				<div id="regularDate" style="overflow:scroll;overflow-y:hidden;">
					<div id="timeDiv" style="width:50px; height:570px; float:left;">
						<div id="dateDiv" style="width:6050px;">
							<div id="timebarDiv">
							</div>
						</div>
						<hr style="width:6100px;margin:0;margin-top:50px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">00:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">02:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">04:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">06:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">08:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">10:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">12:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">14:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">16:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">18:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">20:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">22:00</div>
						<hr style="width:6100px;margin:0px;border:0;height:0.1px;background:#EFEFEF"/>
						<div class="settime">00:00</div>
					</div>
				</div>
			</c:if>
			<div>
				
			</div>
      	</div>
      	
      	<h5>자녀 정보</h5>
      	<li class="list-group-item">
			<ul id="childList" class="list-group list-group-horizontal-sm" >
	         	
	      	</ul>
      	</li>
      	<c:if test="${rbVO.status!='C'}">
      		<h5>희망 시급</h5>
      	</c:if>
      	<c:if test="${rbVO.status=='C'}">
      	<h5>제안 시급</h5>
      	</c:if>
      	<li class="list-group-item">
      		<img src="<%=request.getContextPath()%>/img/moneyImg.png" style="width:60px; height:60px; line-height:80px;" /><b style="font-size:25px;line-height:86px;margin-left:5px;">${rbVO.wish_wage } 원</b>
      		<c:if test="${rbVO.status!='C'}">
      		<span style="color:orange;"><c:if test="${rbVO.consultation=='Y' }">*협의 가능</c:if><c:if test="${rbVO.consultation=='N' }"></c:if></span>
      		</c:if>
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
			<c:if test="${rbVO.tcnt>0 }" ><h5>나에게 신청한 돌봄몬</h5></c:if>
			<c:forEach var="tlist" items="${tlist }">
		        <div class="wrapper2" style="margin:5px 0;" id="dbmDiv">
		        	<input type="hidden" id="dbmid" value="${tlist.userid }" />
					<ul class="list-group">
						<li class="list-group-item" style="height:200px; margin:10px 0;">
							<ul class="list-group list-group-horizontal" style="height:100%;">
								<li class="list-group-item border-0 col-3" style="height:100%;">
									<img <c:if test="${tlist.pic==null}">src="img/profilepic.png"</c:if><c:if test="${tlist.pic!=null}">src="upload/${tlist.pic}"</c:if> class="rounded" style="width:100%; height:100px; margin-bottom:10px;"/><br/>
									<h6 style="font-weight:bold; text-align:center;">${tlist.username.substring(0,1) }O${tlist.username.substring(2)}</h6> 
									<h6 style="text-align:center;">${tlist.birth }세  <c:if test="${tlist.gender=='F'}">여자</c:if><c:if test="${tlist.gender=='M'}">남자</c:if></h6>
								</li>
								<li class="list-group-item border-0 col-5" id="applyDbmList" style="height:100%;">
									
									<h6 class="mb-3">						
									<span ><i class="far fa-clock" style="color:orange;"></i>
										<fmt:parseNumber integerOnly="true" var="edit_year" value="${tlist.apply_date/525600}"/>
										<fmt:parseNumber integerOnly="true" var="edit_month" value="${tlist.apply_date/43200}"/>
										<fmt:parseNumber integerOnly="true" var="edit_day" value="${tlist.apply_date/1440}"/>
										<fmt:parseNumber integerOnly="true" var="edit_hour" value="${tlist.apply_date/60}"/>					
									<c:choose>
										<c:when test="${tlist.apply_date>525600}">${edit_year}년</c:when>
										<c:when test="${tlist.apply_date>43200}">${edit_month}달</c:when>
										<c:when test="${tlist.apply_date>1440}">${edit_day}일</c:when>
										<c:when test="${tlist.apply_date>60}">${edit_hour}시간</c:when>
										<c:otherwise>${tlist.apply_date}분</c:otherwise>
									</c:choose> 전에 지원
									</span>
									</h6>
									
									<h6 class="mb-3"><i class="fas fa-video" style="color:orange;"></i><c:if test="${tlist.cctv=='Y' }"> CCTV 촬영 <b>가능</b></c:if> <c:if test="${tlist.cctv!='Y' }"> CCTV 촬영 <b>불가능</b></c:if></h6>
									<h6 class="mb-3"><i class="fas fa-coins mr-1" style="color:orange;"></i>희망시급 ${tlist.desired_wage }원</h6>
									<h6 class="mb-3"><i class="fas fa-hands-helping" style="color:orange"></i><c:if test="${tlist.discussion=='Y' }" >협의 <b>가능</b></c:if><c:if test="${tlist.discussion=='N' }" >협의 <b>불가능</b></c:if></h6>
									
									<c:if test="${checkVo.teacherid==tlist.userid and checkVo.agree=='T' and checkVo.payment!='Y'}">
										<span style="color:orange; font-size:1.2em;position:relative; top:10px;"><b>-계약이 진행중입니다-</b></span>
									</c:if>
									<c:if test="${checkVo.teacherid==tlist.userid and checkVo.agree=='Y' and checkVo.payment!='Y'}">
										<span style="color:orange; font-size:1em;position:relative; top:10px;"><b>선생님이 계약을 수락하였습니다. <br/>계약서에서 결제를 진행해주세요.</b></span>
									</c:if>
									<c:if test="${checkVo.teacherid==tlist.userid and checkVo.agree=='N' and checkVo.payment!='Y'}">
										<span style="color:red; font-size:1.2em; position:relative; top:10px;"><b>-계약이 거절되었습니다-</b></span>
									</c:if>
									<c:if test="${checkVo.teacherid==tlist.userid and checkVo.agree=='Y' and checkVo.payment=='Y'}">
										<span style="color:orange; font-size:1em; position:relative; top:10px;"><b>결제가 완료되었습니다.<br/>마이페이지 활동내역을 확인하세요.</b></span>
									</c:if>
								</li>
								<li class="list-group-item border-0 col-4" style="height:100%;text-align:right;">
									<c:choose>
									
										<c:when test="${checkVo.teacherid==tlist.userid and (checkVo.agree=='T' or checkVo.agree=='Y') and checkVo.payment!='Y'}">
												<input type="hidden" name="idcheck" id="${tlist.userid}">
												<input class="btn btn-outline-warning mb-2 viewContract" type="button" value="계약서 확인" id="${rbVO.job_board_no}" style="margin:0;"><br/>
												<input type="button" class="btn btn-outline-warning mb-2 cBtn" id="${tlist.userid }" value="협의하기" /><br/>
										</c:when>
										
										<c:when test="${checkVo.teacherid==tlist.userid and checkVo.agree=='Y' and checkVo.payment=='Y'}">
												<input type="hidden" name="idcheck" id="${tlist.userid}">
												<input class="btn btn-outline-warning mb-2 viewContract" type="button" value="계약서 확인" id="${rbVO.job_board_no}" style="margin:0;"><br/>
												<input type="button" class="btn btn-outline-warning mb-2 cBtn" id="${tlist.userid }" value="협의하기" /><br/>
										</c:when>
										
										<c:otherwise>
											<c:if test="${checkVo.payment!='Y'}">
												<input type="button" class="btn btn-outline-warning mb-2 contractOpen" id="${tlist.userid }" value="계약하기" /><br/>
												<input type="button" class="btn btn-outline-warning mb-2 cBtn" id="${tlist.userid }" value="협의하기" /><br/>
												<input class="btn btn-outline-warning mb-2" type="button" value="거절하기" id="refusalBtn"  /><br/>
											</c:if>
											<c:if test="${checkVo.payment=='Y'}">
												<input class="btn btn-outline-danger mb-2" type="button" value="계약이 완료된 페이지 입니다." id=""  /><br/>
											</c:if>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>

						</li>
					</ul>
				</div>
			</c:forEach>
		<script>
		console.log("${contractId}");
		console.log("${contractId2}");
		console.log("${contractId3}");
		console.log("${contractId4}");
		
		</script>
      	</c:if>
      	
        <c:if test="${who=='T' }">
        	<c:if test="${apChk<1 }">
        		<c:if test="${rbVO.status!='C'}">
        		<div style="text-align:center; margin:50px 0">
					<input id="applyBtn" type="button" value="신청하기" class="btn btn-warning" style="width:40%; height:50px;"/>
				</div>
				</c:if>
        	</c:if>
        	<c:forEach var="tlist" items="${tlist }">
        		<c:if test="${userid == tlist.userid }" >
        			<h5 style="margin-top:30px;">학부모의 연락을 기다리고 있습니다.</h5>
			        <div class="wrapper2" style="margin:5px 0;" id="dbmDiv">
			        	<input type="hidden" id="dbmid" value="${tlist.userid }" />
						<ul class="list-group">
							<li class="list-group-item">
								<ul class="list-group list-group-horizontal">
			
									<li class="list-group-item border-0 col-3">
					
										<img <c:if test="${tlist.pic==null}">src="img/profilepic.png"</c:if><c:if test="${tlist.pic!=null}">src="upload/${tlist.pic}"</c:if> style="width:100%;height:70%; border-radius:20px;"/><br/><br/>
									</li>
									<li class="list-group-item border-0 col-9" id="applyDbmList">
										<h4><b>${tlist.username }</b></h4> 
										<h6>나이 - ${tlist.birth }세</h6>
										<h6><c:if test="${tlist.cctv == 'Y'}">CCTV가 있어도 당당히 일할 수 있습니다.</c:if><c:if test="${tlist.cctv == 'N'}">CCTV촬영을 원하지 않습니다.</c:if></h6><br/>
										<h6><i class="fas fa-coins mr-1" style="color:orange;"></i>희망 시급 ${tlist.desired_wage } | <b>협의가능</b></h6>
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
			<input type="button" class="btn btn-warning ed" id="editBtn" value="수정하기" style="margin-right:10px;"/><input type="button" id="deleteBtn" class="btn btn-warning ed" value="삭제하기"/>
		</div>
 	</c:if>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>

