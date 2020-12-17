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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
 		line-height:40px;
 		text-align:center;
 	}
 	#regularDate .dateCls{text-align:center;}
 	#timebarDiv {position:relative;width:0px;height:0px;}
 	.timebar{position:absolute;top:50px; background-color:orange;opacity:0.7; width:50px;}
 	.clearfix:after { clear:both; }
</style>

<script>
var charge; //총결제금액
	// 신생아 0-6개월, 영아 7-36개월, 유아 4-7세, 초딩
	var pw_activityStr = '${rbVO.pw_activity }';
	var care_addr = "${rbVO.care_addr}";
	var cb = '${cVO.child_birth}';
	var child_age1;
	var child_age2;
	
	
	function paymentTest(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp05848718');

			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '돌봄몬 결제',
			    amount : 100, //판매 가격
			    buyer_email : '${mvo.email}',
			    buyer_name : '${mvo.username }',
			    buyer_tel : '${mvo.tel1}',
			    buyer_addr : '${mvo.addr}',
			    buyer_postcode : '${mvo.zipcode}',
			    m_redirect_url : 'http://localhost:9090/dbmon/'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	
			    	var msg = '결제가 완료되었습니다.';
			           msg += '고유ID : ' + rsp.imp_uid;
			           msg += '상점 거래ID : ' + rsp.merchant_uid;
			           msg += '결제 금액 : ' + rsp.paid_amount;
			           msg += '카드 승인번호 : ' + rsp.apply_num;
						alert(msg);	
						
						var tag = "<form name='hiddenForm' id='hiddenForm' action='/dbmon/paymentSuccess'>";
							tag += "<input type='hidden' name='pay_id' value='"+ rsp.imp_uid +"'>";//고유id
							tag += "<input type='hidden' name='merchant_id' value='"+ rsp.merchant_uid +"'>";//상점거래id
							tag += "<input type='hidden' name='pay_money' value='"+ rsp.paid_amount +"'>";//결재금액
							tag += "<input type='hidden' name='apply_num' value='"+ rsp.apply_num +"'>";//카드승인번호
							tag += "<input type='hidden' name='teacherid' value='${teacherid}'>";//카드승인번호
							tag += "<input type='hidden' name='pay_no' value='${rbVO.job_board_no}' >"; 
							tag += "</form>";
						$("#hiddenDiv").html(tag);
						hiddenForm.submit();

				   	 	//location.href="http://localhost:9090/dbmon/"
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			    
			});
			
		}
	
	
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

		
		$(document).on("click",".cBtn",function(){
			var agree = $(this).attr('id');
			location.href="<%=request.getContextPath()%>/contractOk?no=${rbVO.job_board_no}&agree="+agree;
		});
		
		$(document).on("click",".cancelBtn",function(){
			if(confirm("제안을 취소하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/contractCancel?no=${rbVO.job_board_no}";
			}
		});
		
/* 		$(document).on("click",".pBtn",function(){
			var no = $(this).attr('id');
			console.log(payment);
			console.log(charge);
			location.href="/dbmon/payment";
			//?charge="+charge+"no="+no;
			
		}); */
		
		
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
		var yoilCnt = getYoil.length;
		console.log("요일 수 => " + yoilCnt);
		var money = "${rbVO.wish_wage}";
		console.log("돈 => " +money);
		var weeek = "${rdVO.week}";
		console.log("주 => " + weeek);
		console.log("지불 예상 금액 => " + (endDivLoc - startDivLoc)*weeek*yoilCnt*money/2);
		$("#charge").val((endDivLoc - startDivLoc)*weeek*yoilCnt*money/2);
		console.log("두 날짜 사이의 일 수 => " + edl);
		console.log("두 날짜 사이의 나머지 일 수 => " + edlll);
		console.log("마지막 날짜 => " + edd);
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
			var etArr = end_time.split(":");
			var stArr = start_time.split(":");
			var hour = etArr[0]-stArr[0];
			var min = etArr[1]-stArr[1];
			if(min==-30){
				hour = hour - 1;
				min = 30;
			}
			if(min==30){
				hour = hour + 0.5;
			}
			console.log("시간 => " + hour);
			var sd = "${sdVO.select_date}";
			var selectedDate = sd.split(", ");
			var selectedDatelength = selectedDate.length;
			var money = "${rbVO.wish_wage}";
			console.log("시급 => " + money);
			console.log("일할 날의 수 => " + selectedDatelength);
			charge = money * hour * selectedDatelength;
			console.log("예상 결제 금액 => " + charge);
			$("#charge").val(charge);
			console.log("sdsdsd sd => " + sd);
			
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
		
	});


	
	
</script>
</head>
<body>
<div class="container">
   <div style="margin:100px 0 20px 0;">
  	 <img class="rounded-circle mx-auto d-block " id="profimg" <c:if test="${rbVO.pic==null || rbVO.pic==''}" >src="img/profilepic.png" </c:if><c:if test="${rbVO.pic!=null || rbVO.pic != '' }" >src="upload/${rbVO.pic}"</c:if>/>
  	 <div style="text-align:center;font-size:20px;">계약서</div>
   </div>
   <div class="clearfix" style="width:100%">
	   <div style="position:relative; float:right; height:1px; top:-420px;">
			<div class="badge badge-warning badge-pill mt-3 p-2"><img src="icon/icon-alarm.png" style="width:1em; height:1em"/>신고</div>
	   </div>
   </div>
   <div>
   <ul class="list-group">
         <li class="list-group-item align-middle"><span  style="font-size:1.4em; font-weight:bold">${rbVO.username }</span><span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2">학부모</span><br/>
         <c:forEach var="s" begin="1" end="5"><i class="fas fa-star"></i></c:forEach> <span class="mx-2"></span> | <span id="jobNo" class="ml-2">${rbVO.job_board_no }</span></li>
   </ul>
   </div>
   <br/>
   <ul class="list-group list-group-horizontal-sm">
         <li class="list-group-item col-6" style="text-align:center"><i class="fas fa-search mr-2"></i>지원자 수<br/><div>${rbVO.tcnt }</div></li>
         <li class="list-group-item col-6" style="text-align:center"><i class="far fa-clock mr-2"></i>프로필 작성<br/>3일 전</li>
   </ul>
      
    <h5>신청 내용</h5>
    <li class="list-group-item p-5" style="text-align:center"><c:if test="${rbVO.content==null || rbVO.content=='' }" >아직 작성하지 않았습니다.</c:if><c:if test="${rbVO.content!=null || rbVO.content!='' }">${rbVO.content }</c:if></li>
    <h5>돌봄 장소</h5>
   	<li class="list-group-item p-4"><span style="color:orange;">*${rbVO.care_addr }</span> 
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
					<div style="width:50%;float:left;text-align:center;font-size:25px;">돌봄시작시간 - <b>${sdVO.start_time }</b></div>
					<div style="width:50%;float:left;text-align:center;font-size:25px;">돌봄종료시간 - <b>${sdVO.end_time }</b></div>
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
      	<h5>희망 시급</h5>
      	<li class="list-group-item">
      		<img src="<%=request.getContextPath()%>/img/moneyImg.png" style="width:60px; height:60px; line-height:80px;" /><b style="font-size:25px;line-height:86px;margin-left:5px;">${rbVO.wish_wage } 원</b>
      		<span><c:if test="${rbVO.consultation=='Y' }">*협의 가능</c:if><c:if test="${rbVO.consultation=='N' }"></c:if></span>
   		
   		</li>
      	<h5>총 예상 결제 금액</h5>
      	<li class="list-group-item">
      		<img src="<%=request.getContextPath()%>/img/moneyImg.png" style="width:60px; height:60px; line-height:80px;" /><input readonly="readonly" type="text" name="charge" id="charge" value="" style="margin-left:5px;height:40px;padding-left:10px;font-size:20px;font-weight:bold;width:100px;border:none;"/><b style="font-size:20px;">원</b>
      		<span></span>
   		</li>
   <h5>돌봄유형</h5>
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
</div>
<div class="container" style="height:80px;">
	<div style=" float:right; height:43px; line-height:43px;">

		<c:if test="${rbVO.agree=='T' and rbVO.teacherid == userid}">
		<input class="btn btn-warning cBtn" type="button" value="계약서 수락" id="Y" style="margin-top:5px; margin-left:10px;" />
		<input class="btn btn-warning cBtn" type="button" value="계약서 거절" id="N" style="margin-top:5px; margin-left:10px;" />
		</c:if>
		<c:if test="${rbVO.teacherid == userid and rbVO.agree=='Y'}">
			<span class="conFont" style="color:green">수락한 계약서입니다.</span>
		</c:if>
		<c:if test="${rbVO.teacherid == userid and rbVO.agree=='N'}">
			<span class="conFont" style="color:red">거절한 계약서입니다.</span>
		</c:if>	
		<c:if test="${rbVO.userid == userid and rbVO.agree=='Y' and payment!='Y'}">
			<a href="javascript:paymentTest()" class="btn btn-warning">결제하기</a>
		</c:if>
		<c:if test="${rbVO.userid == userid and rbVO.agree=='T'}">
			<span class="conFont" style="color:green">선생님의 수락을 기다리고 있습니다.</span>
			<input class="btn btn-warning cancelBtn" type="button" value="계약서 취소" id="" style="margin-left:10px;" />
			
		</c:if>
			<c:if test="${rbVO.userid == userid and rbVO.agree=='Y' and payment=='Y'}">
			<span class="conFont" style="color:red">결제가 완료되었습니다.</span>
		</c:if>
		<c:if test="${rbVO.userid == userid and rbVO.agree=='N'}">
			<span class="conFont" style="color:red">선생님이 거절한 계약서입니다.</span>
		</c:if>
	</div>
</div>
<div style="width:100%; height:300px;" id="hiddenDiv">
</div>
</body>
</html>

