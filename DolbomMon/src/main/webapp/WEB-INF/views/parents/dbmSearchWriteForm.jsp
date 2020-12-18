<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dbmSearchWriteForm.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87&libraries=services"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<script>
	$(function(){
		/////////////////// 페이지 로딩 시 //////////////////////
		$(document).ready(function(){
			
			startTime();
			
			/////////////////////// 시간 설정 //////////////////////
			if($("#timeType1").is(":checked")){
				$("label[for=timeType1]").css("background-color", "#ffc207");
				$("#specificDateDiv").css("display", "inline-block");
				$("label[for=timeType2]").css("background-color", "#EFEFEF");
				$("#regularDateDiv").css("display", "none");
				$("#timeDiv").css("display", "inline-block");
			}else if($("#timeType2").is(":checked")){
				$("label[for=timeType2]").css("background-color", "#ffc207");
				$("#regularDateDiv").css("display", "inline-block");
				$("label[for=timeType1]").css("background-color", "#EFEFEF");
				$("#specificDateDiv").css("display", "none");
				$("#timeDiv").css("display", "inline-block");
			}else{
				$("label[for=timeType1]").css("background-color", "#EFEFEF");
				$("label[for=timeType2]").css("background-color", "#EFEFEF");
				$("#specificDateDiv").css("display", "none");
				$("#regularDateDiv").css("display", "none");
				$("#timeDiv").css("display", "none");
			}
			///////////////////////////// 정기적으로 날짜 설정 요일 //////////////////////////////
			
			for(var i=1;i<8;i++){
				if($("input[id=rd"+i+"]").is(":checked")){
					$("label[for=rd"+i+"]").css("background-color", "#ffc207");
				}else{
					$("label[for=rd"+i+"]").css("background-color", "#EFEFEF");
				}
			}
			
			///////////////////// 돌봄유형 //////////////////
			for(var i=1;i<14;i++){
				var nowImg = $("label[for=pa"+i+"]").children("img").attr("src");
				if($("input[id=pa"+i+"]").is(":checked")){
					if(i=="2"){
						var changeImg = nowImg.replace("-n@", "-s@"); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
					}else if(i=="5"){
						var changeImg = nowImg.replace("-n-","-s-");
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
					}else{
						var changeImg = nowImg.replace("-n.", "-s."); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
					}
				}else{
					if(i=="2") {
						var changeImg = nowImg.replace("-s@", "-n@"); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
					}else if(i=="5"){
						var changeImg = nowImg.replace("-s-", "-n-");
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
					}else{
						var changeImg = nowImg.replace("-s.", "-n."); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
					}
				}
			}
			
			/////////////// 성별 설정 /////////////////
			for(var i=1;i<=3;i++){
				if($("input[id=g"+i+"]").is(":checked")){
					$("label[for=g"+i+"]").css("background-color", "#ffc207");
				}else{
					$("label[for=g"+i+"]").css("background-color", "#EFEFEF");
				}
			}
			/////////////// 나이대 설정 ////////////
			for(var i=2;i<7;i++){
				if($("input[id="+i+"0]").is(":checked")){
					$("label[for="+i+"0]").parent().css("background-color", "#ffc207");
				}else{
					$("label[for="+i+"0]").parent().css("background-color", "#EFEFEF");
				}
			}
			
			for(var i=1;i<5;i++){
				if($("#childrenInfo>input[id=childrenCnt"+i+"]").is(":checked")){
					$("label[for=childrenCnt"+i+"]").css("background-color", "#ffc207");
					$("#childcnt"+i).fadeIn(700);
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF");
					$("#childcnt"+i).css("display", "none");
				}
			}
			/////////////////// 페이지 로딩 시 //////////////////////end
		});
		
		////////////////////// 정기적으로, 특정날에만 선택//////////////////////////////
		$("#timeTypeDiv >input[type=radio]").change(function(){
			if($("#timeType1").is(":checked")){
				$("label[for=timeType1]").css("background-color", "#ffc207");
				$("#specificDateDiv").fadeIn();
				$("#timeDiv").fadeIn();
				$("label[for=timeType2]").css("background-color", "#EFEFEF");
				$("#regularDateDiv").css("display", "none");
				
			}else if($("#timeType2").is(":checked")){
				$("label[for=timeType2]").css("background-color", "#ffc207");
				$("#regularDateDiv").fadeIn();
				$("label[for=timeType1]").css("background-color", "#EFEFEF");
				$("#specificDateDiv").css("display", "none");
				$("#timeDiv").fadeIn();
			}else{
				$("label[for=timeType1]").css("background-color", "#EFEFEF");
				$("label[for=timeType2]").css("background-color", "#EFEFEF");
				$("#specificDateDiv").css("display", "none");
				$("#regularDateDiv").css("display", "none");
				$("#timeDiv").css("display", "none");
			}
		});
		
		// 돌봄 유형 선택 시 색상 변경
		$("input[name=pw_activity]").change(function(){
			var selectedData = $(this).attr("id");
			var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
			$("label[for="+selectedData+"]").children("img").fadeOut(200);
			$("label[for="+selectedData+"]").children("img").fadeIn(200);
			$("label[for="+selectedData+"]").children("img").fadeOut(100);
			$("label[for="+selectedData+"]").children("img").fadeIn(100);
			if($(this).is(":checked")){
				if(selectedData=="pa2"){
					var changeImg = nowImg.replace("-n@", "-s@"); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else if(selectedData == "pa5"){
					var changeImg = nowImg.replace("-n-","-s-");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);	
				}else{
					var changeImg = nowImg.replace("-n.", "-s."); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}
			}else{
				if(selectedData=="pa2") {
					var changeImg = nowImg.replace("-s@", "-n@"); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else if(selectedData=="pa5"){
					var changeImg = nowImg.replace("-s-","-n-");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else{
					var changeImg = nowImg.replace("-s.", "-n."); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}
			}
		});
		
		/////////// 성별 변경 ///////////
		$("input[name=wish_gender]").change(function(){
			for(var i=1;i<=3;i++){
				if($("input[id=g"+i+"]").is(":checked")){
					$("label[for=g"+i+"]").css("background-color", "#ffc207");
				}else{
					$("label[for=g"+i+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		
		//////////// 나이 변경 ///////////////
		$("input[name=wish_age]").change(function(){
			for(var i=0;i<20;i++){
			}
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				
				$("label[for="+selectedData+"]").parent().css("background-color", "#ffc207");
			}else{
				
				$("label[for="+selectedData+"]").parent().css("background-color", "#EFEFEF");
			}
			
		});
		
		//////////// 자녀 정보 //////////////
		$("#childrenInfo>input[type=radio]").change(function(){
			$(".child_birth").val("");
			for(var i=1;i<5;i++){
				if($("input[id=childrenCnt"+i+"]").is(":checked")){
					$("label[for=childrenCnt"+i+"]").css("background-color", "#ffc207");
					$("#childcnt"+i).fadeIn(700);
				}else{
					$("label[for=childrenCnt"+i+"]").css("background-color", "#EFEFEF");
					$("#childcnt"+i).css("display", "none");
				}
			}
		});
		var todayday = new Date();
		$(".childBtn").datepicker({
			showAnim : "show",
			changeMonth : true,
			changeYear : true,
			minDate : new Date(todayday.getFullYear()-10, todayday.getMonth(), todayday.getDate()),
			maxDate : new Date(todayday.getFullYear(), todayday.getMonth()-1, todayday.getDate()),
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				var tname = $(this).val();
				console.log("fd => " + tname);
				$(this).val("자녀 생년월일");
				$(this).next().val(tname);
			},
			altFormat:"yyyy-mm-dd"
		});
		////////////자녀 정보 //////////////
		///////////////////////////// 지도 생성 ////////////////////////////////
		
		///////////////////////////// 지도 생성 ////////////////////////////////
		
		$(document).on('keyup','input[inputmode=numeric]',function(event){
			this.value = this.value.replace(/[^0-9]/g,'');  
			this.value = this.value.replace(/,/g,'');  
			$("input[id=avgWage]").prop("checked", false);
			if(this.value<8590){
				$(this).css("color", "gray");
				$("#minWage").html("최저시급(8590원)이상의 시급을 입력해주세요");
			}else {
				$("#minWage").html("");
				$(this).css("color", "black");
			}
		});
		
		$("input[id=avgWage]").change(function(){
			var wage = $("#wish_wage").val;
			if(wage<8590){
				$("#wish_wage").css("color", "gray");
				$("#minWage").html("최저시급(8590원)이상의 시급을 입력해주세요");
			}else {
				$("#wish_wage").css("color", "black");
				$("#minWage").html("")
			}
			
			if(this.checked){
				$("#wish_wage").val("8600");
			}
		});
		////////////////////////// 정기적으로 ////////////////////////// 
		$("#regularDateDiv #startDateBtn").datepicker({ // 시작일 데이트피커
			showAnim : "show",
			minDate : "0",
			maxDate : "15d",
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				$("#regularDateDiv #start_date").val(dateText);
				$("#regularDateDiv #startDateBtn").val("돌봄 시작일");
				var startDate = new Date(dateText);
				var minDate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate()+14);
				var maxDate = new Date(minDate.getFullYear(), minDate.getMonth(), minDate.getDate()+16);
				$("#regularDateDiv #endDateBtn").datepicker("option", "minDate", minDate);
				$("#regularDateDiv #endDateBtn").datepicker("option", "maxDate", maxDate);
				$("#regularDateDiv #endDateBtn").val("돌봄 종료일");
				$("#regularDateDiv #end_date").val("");
				$("input[name=week]").each(function(){
					$(this).prop("checked", false);
					$(this).parent("label").css("background-color", "#EFEFEF");
					$(this).parent("label").fadeOut(300);
					$(this).parent("label").fadeIn(250);
					$(this).parent("label").fadeOut(200);
					$(this).parent("label").fadeIn(150);
					$(this).parent("label").fadeOut(100);
					$(this).parent("label").fadeIn(50);
					$(this).parent("label").fadeOut(10);
					$(this).parent("label").fadeIn(300);
				});
			},
			altFormat:"yyyy-mm-dd"
		});
		
		//////////////////////////정기적으로 ////////////////////////// 
		$("#regularDateDiv #endDateBtn").datepicker({ // 종료일 데이트피커
			showAnim : "show",
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				$("#regularDateDiv #end_date").val(dateText);
				
				$("#regularDateDiv #endDateBtn").val("돌봄 종료일");
				
			},
			altFormat:"yyyy-mm-dd"
		});
		
		// 요일 선택 시 색상변경
		$("input[name=yoil]").change(function(){
			
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				$("label[for="+selectedData+"]").css("background-color", "#ffc207");//노랑
			}else{
				$("label[for="+selectedData+"]").css("background-color", "#EFEFEF");//회색
			}
			
		});
		
		
		////////////////////////// 정기적으로 ////////////////////////// 
		
		////////////////////////// 특정날선택 //////////////////////////
		var selectedCnt = 0;
		$("#specificDateDiv #specificDateCal").multiDatesPicker({ // 고정 데이트피커
			showAnim : "show",
			maxDate : "+30d",
			minDate : "0", 
			yearRange : 'c-100:c',
			dateFormat : "yy-mm-dd",
			altField : "#select_date",
			onSelect:function(dateText){
				var test = $("#select_date").val();
				console.log(test);
			},
			altFormat:"yyyy-mm-dd"
		});
		
		///////////// 종료일 설정 ////////////
		$("input[name=week]").change(function(){
			var start_dateVal = $("input[id=start_date]").val();
			console.log("start_dateVal => " +start_dateVal);
			if(start_dateVal!=""){
				var selectedData = $(this).attr("id");
				console.log("selectedData => " + selectedData);
				for(var i=2;i<5;i++){
					if(selectedData==("week"+i)){
						setEndDate(i);
						$(this).parent("label").css("background-color", "#FFC207");
					}else{
						$("label[for=week"+i+"]").css("background-color", "#EFEFEF");
					}
				}
			}else{
				swal({
					title : "시작날짜를 먼저 입력해주세요",
					icon : "info"
				});
			}
		});
		$("#subjectSelect").change(function(){
			var subjectSel = document.getElementById("subjectSelect");
			
			$("input[name=title]").val(subjectSel.value);
						
			if(subjectSel.selectedIndex==0){
				$("input[name=title]").val("");
			}
		});
		
		$("input[name=title]").keyup(function(){
			var subjectSel = document.getElementById("subjectSelect");
			subjectSel.selectedIndex = 1;
		});
		
		/////////////////////////// 등록하기 버튼 누를 시 ////////////////////////
		$("#writeFrm").submit(function(){
			var wage = $("#wish_wage").val();
			if(wage==null || wage==""){
				alert("희망시급을 입력해주세요");
				return false;
			}else if(wage<8590){
				alert("희망시급은 최소 8590원 이상이어야합니다.");
				return false;
			}
			var pw_activityCnt = $("input[name=pw_activity]:checked").length;
			if(pw_activityCnt==0){
				swal({
					title : "돌봄유형",
					text : "원하는 돌봄유형을 입력해주세요",
					icon : "info"
				});
				return false;
			}
			
			var wish_genderCnt = $("input[name=wish_gender]:checked").length;
			if(wish_genderCnt==0){
				swal({
					title : "선생님 성별",
					text : "원하는 선생님 성별을 입력해주세요",
					icon : "info"
				});
				return false;
			}
			
			var wish_ageCnt = $("input[name=wish_age]:checked").length;
			if(wish_ageCnt==0){
				swal({
					title : "선생님 나이",
					text : "원하는 선생님 나이대를 입력해주세요",
					icon : "info"
				});
				return false;
			}
			
			var child_cnt = $("input[name=childrenCnt]:checked").length;
			if(child_cnt < 1) {
				swal({
					title : "자녀 정보 입력",
					text : "자녀의 정보를 입력해주세요",
					icon : "info"
				});
				return false;
			}
			
			var cnttt = 0;
			$(".child_birth").each(function(){
				var cb = $(this).val();
				console.log("cb =>"+cb+"<= cb");
				console.log(cb);
				if(cb!=""){
					cnttt = cnttt+1;
					console.log("cnttt => " + cnttt);
				}
			});
			if(cnttt == 0){
				swal({
					title : "자녀 정보 입력",
					text : "자녀의 생년월일을 입력해주세요",
					icon : "info"
				});
				return false;
			}
			
			var addr = $("input[name=dong_addr]").val();
			if(addr == null || addr == ""){
				swal({
					title : "돌봄 장소 입력",
					text : "돌봄 장소를 입력해주세요",
					icon : "info"
				});
				return false;
			}
			
			if($("input[name=time_type]:checked").length<1){
				swal({
					title : "돌봄 날짜 선택",
					text : "선생님을 만나고 싶은 날을 선택해주세요",
					icon : "info"
				});
				return false;
			}
			
			var time_type = $("input[name=time_type]:checked").val();
			if(time_type=="S"){ // 특정날에만
				console.log("특정날에만");
				var select_date = $("#select_date").val();
				if(select_date==null || select_date==""){
					swal({
						title : "돌봄 날짜를 선택 해주세요",
						icon : "info"
					});
					return false;
				}
			} else if(time_type=="R"){ // 정기적으로 
				console.log("정기적으로");
				var start_date = $("#start_date").val();
				var end_date = $("#end_date").val();
				if(start_date==null || start_date==""){
					swal({
						title : "돌봄 날짜 선택",
						text : "돌봄 시작날짜를 선택해주세요",
						icon : "info"
					});
					return false;
				}else if(end_date==null || end_date==""){
					swal({
						title : "돌봄 날짜 선택",
						text : "돌봄 종료날짜를 선택해주세요",
						icon : "info"
					});
					return false;
				}
				
				var yoil = $("input[name=yoil]:checked").length;
				if(yoil < 1) {
					swal({
						title : "돌봄 날짜 선택",
						text : "선생님을 만나고 싶은 요일을 선택해주세요",
						icon : "info"
					});
					return false;
				}
				
				var week = $("input[name=week]:checked").length;
				if(week < 1){
					swal({
						title : "돌봄 날짜 선택",
						text : "기간을 설정해주세요",
						icon : "info"
					});
					return false;
				}
				
			}
			
			var start_time = $("#start_time").val();
			var end_time = $("#end_time").val();
			console.log("stime => " + start_time);
			console.log("etime => " + end_time);
			
			if(end_time==null || end_time=="종료시간") {
				swal({
					title : "돌봄 시간 선택",
					text : "돌봄 종료시간을 선택해주세요",
					icon : "info"
				});
				return false;
			}
			
			
			return true;
		});
		
		// 포커스 없애기
		$(":focus").blur();
	});

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87"></script>
<script>
					$(function(){
						var lng;
						var lat;
						$(".zipcodeBtn").click(function(){
							console.log("클릭");
							new daum.Postcode({
						        oncomplete: function(data) {
						        	console.log("우편번호 => " + data.zonecode );
						        	console.log("도로명 주소 " + data.address )
						            console.log("시, 도 =>" + data.sido);
						            console.log("시군구 =>" + data.sigungu);
						            console.log("법정동명(동) => " + data.bname);
						            console.log("법정동명(읍, 면, 리) => " + data.bname1);
						            
						            var dongJuso = data.sido + " " + data.sigungu + " " + data.bname + " " + data.bname1;
						            console.log("동주소 =>" + dongJuso);
						            var geocoder = new kakao.maps.services.Geocoder();
						            
						            geocoder.addressSearch(dongJuso, function(result, status) {
				
						                // 정상적으로 검색이 완료됐으면 
						                 if (status === kakao.maps.services.Status.OK) {
											
											console.log("경도=> " + result[0].x);
											console.log("위도=> " + result[0].y);
											
											lat = result[0].y;
											lng = result[0].x;
											
											var coords = new kakao.maps.LatLng(lat, lng);
											
											$("#lng").val(result[0].x);
											$("#lat").val(result[0].y);
											
											$("#care_addr").val(data.address);
											$("#dong_addr").val(dongJuso);
											
											console.log("지도생성 시작");
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
											// 지도를 생성합니다    
											$("#mapImgDiv").fadeOut(10);
											$("#mapDiv").fadeIn();
											var map = new kakao.maps.Map(mapContainer, mapOption);
											map.setCenter(coords);
						                } 
						            });
						        },theme:{
						        	searchBgColor: "#ffc207", //검색창 배경색
						            queryTextColor: "#black" //검색창 글자색
						        }
						    }).open();
						});
					});
									
				</script>
<script>
	
	function startTime(){ // 시작 시간
		var time = new Date(2020, 0, 1);
		var tag="";
		for(var i=1;i<=48;i++){
			if(time.getHours()<10 && time.getMinutes()==0) {
				tag += "<option id='rt"+i+"'>0"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()<10 && time.getMinutes()!=0){
				tag += "<option id='rt"+i+"'>0"+time.getHours()+":"+time.getMinutes()+"</option>";
			}else if(time.getHours()>=10 && time.getMinutes()==0){
				tag += "<option id='rt"+i+"'>"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()>=10 && time.getMinutes()!=0){
				tag += "<option id='rt"+i+"'>"+time.getHours()+":"+time.getMinutes()+"</option>";
			}
			time.setMinutes(time.getMinutes()+30);
		}
		document.getElementById("start_time").innerHTML = tag;
	}
	
	$(function(){
		$(document).on('change',"#start_time" ,function(){
			var test = $("#start_time").val();
			var i=1;
			for(i;i<=48;i++){
				if($("#start_time option[id=rt"+i+"]").val()==test){
					endTime(i); 	
				}
			}
		});
	});
	
	function endTime(i){ // 종료 시간
		var time = new Date(2020, 0, 1);
		var tag="";
		time.setMinutes(time.getMinutes()+30*i);
		for(i;i<48;i++){
			if(time.getHours()<10 && time.getMinutes()==0) {
				tag += "<option>0"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()<10 && time.getMinutes()!=0){
				tag += "<option>0"+time.getHours()+":"+time.getMinutes()+"</option>";
			}else if(time.getHours()>=10 && time.getMinutes()==0){
				tag += "<option>"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()>=10 && time.getMinutes()!=0){
				tag += "<option>"+time.getHours()+":"+time.getMinutes()+"</option>";
			}else if(time.getHours()>=24){
				break;
			}
			time.setMinutes(time.getMinutes()+30);
		}
		document.getElementById("end_time").innerHTML = tag;
	}
	
	function setEndDate(i){
		var date = new Date();
		var startDate = document.getElementById("start_date").value;
		console.log("startDate => " + startDate);
		var data = new Date(startDate);
		var endDate;
		var setEndDate;
		var month = Number(data[1]);
		console.log(i);
		endDate = new Date(data.getFullYear(), data.getMonth(), data.getDate()+(7*i));
		console.log("end_date => " + endDate);
		setEndDate = endDate.getFullYear()+"-"+(endDate.getMonth()+1)+"-"+endDate.getDate();
		document.getElementById("end_date").value = setEndDate;

		/* aos적용하기 */
		   $(function() {
			     AOS.init({
			       duration: 1200
			     });
			     onElementHeightChange(document.body, function(){
			       AOS.refresh();
			     });
			   });


			   function onElementHeightChange(elm, callback) {
			       var lastHeight = elm.clientHeight
			       var newHeight;
			       
			       (function run() {
			           newHeight = elm.clientHeight;      
			           if (lastHeight !== newHeight) callback();
			           lastHeight = newHeight;

			           if (elm.onElementHeightChangeTimer) {
			             clearTimeout(elm.onElementHeightChangeTimer); 
			           }

			           elm.onElementHeightChangeTimer = setTimeout(run, 200);
			       })();
			     }
			   $(window).scroll(function() {  
			        var position = $(window).scrollTop(); 
			      if (position >= 700){
			         $(".redution").delay(500).fadeOut(1000);
			      }
			   });        
			   

				$(function() {
				  AOS.init({
				    duration: 1200
				  });
				  onElementHeightChange(document.body, function(){
				    AOS.refresh();
				  });
				});   
		function onElementHeightChange(elm, callback) {
		    var lastHeight = elm.clientHeight
		    var newHeight;
		    
		    (function run() {
		        newHeight = elm.clientHeight;      
		        if (lastHeight !== newHeight) callback();
		        lastHeight = newHeight;

		        if (elm.onElementHeightChangeTimer) {
		          clearTimeout(elm.onElementHeightChangeTimer); 
		        }

		        elm.onElementHeightChangeTimer = setTimeout(run, 200);
		    })();
		  }
				
	}
</script>
<style>
	*{ font-family: 'Poor Story', cursive;
		list-style:none;
	}
 	.ui-datepicker:nth-of-type(1){width:100%;}
 	.ui-datepicker td>a{text-align:center;}
 	.ui-state-active{background-color:#FFC207;}
 	.divOff{display:none;}
 	.divOn{display:inline-block;}
 	.divOnOff{font-family: 'Poor Story', cursive; 
 	font-weight:bold; color:black; font-size:25px; }
 	.orangeSpan{
 	font-size: 1em;
    text-align: center;
    color: #ff7928;
    font-weight: 800;
    font-family: 'Poor Story', cursive;
    margin-top:20px;
    margin-bottom:200px;
 	}
</style>
<body>
	<div id="top">
		<%@include file="/WEB-INF/views/top.jsp"%>
	</div>
	<div class="container">
		<form id="writeFrm" method="post" action="dbmSearchWriteFormOk">
			<div class="title222" style="margin-bottom:80px;">
			<img src="<%=request.getContextPath() %>/img/iii11.svg" style="width:300px;height:200px; margin:0 auto;"/><br/><br/>
			<span class="orangeSpan" style="font-size:25px; color:black; margin-bottom:80px;"> 
			회원님과 꼭 맞는 돌봄몬을 찾기위해
			몇가지 질문으로 시작하겠습니다.</span></div>
			
			<div class="title" style="margin-bottom:80px; margin-top:0px;"><label class="divOnOff" for="activityTypeDiv" 
			>어떤 돌봄을 원하세요?</label><span class="orangeSpan" > 
			원하시는 놀이 유형을 선택해주세요. </span>
				
			</div>
			
			<div id="activityTypeDiv" class="mainDiv" style="color:gray; font-weight:bold; font-size:14px;" data-aos="fade-up">
				<input type="checkbox" id="pa1" value="실내놀이" name="pw_activity"/>
				<input type="checkbox" id="pa2" value="등하원돕기" name="pw_activity" />
				<input type="checkbox" id="pa3" value="책읽기" name="pw_activity" />
				<input type="checkbox" id="pa4" value="야외활동" name="pw_activity" />
				<input type="checkbox" id="pa5" value="한글놀이" name="pw_activity" />
				<input type="checkbox" id="pa6" value="영어놀이" name="pw_activity" />
				<input type="checkbox" id="pa7" value="학습지도" name="pw_activity" />
				<input type="checkbox" id="pa8" value="체육놀이" name="pw_activity" />
				<input type="checkbox" id="pa9" value="간단청소" name="pw_activity" />
				<input type="checkbox" id="pa10" value="밥챙겨주기" name="pw_activity" />
				<input type="checkbox" id="pa11" value="간단설거지" name="pw_activity" />
				<input type="checkbox" id="pa12" value="장기입주" name="pw_activity" />
				<input type="checkbox" id="pa13" value="단기입주" name="pw_activity" />
				<div id="activityListDiv">
					<div><label for="pa1"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg"/><br/><span>실내놀이</span></label></div>
					<div><label for="pa2"><img src="<%=request.getContextPath()%>/icon/join-walk-n@2x.png" style="width:56px; height:56px;"/><br/><span>등하원돕기</span></label></div>
					<div><label for="pa3"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg"/><br/><span>책읽기</span></label></div>
					<div><label for="pa4"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg"/><br/><span>야외활동</span></label></div>
					<div><label for="pa5"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg"/><br/><span>한글놀이</span></label></div>
					<div><label for="pa6"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg"/><br/><span>영어놀이</span></label></div>
					<div><label for="pa7"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg"/><br/><span>학습지도</span></label></div>
					<div><label for="pa8"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg"/><br/><span>체육놀이</span></label></div>
					<div><label for="pa9"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"/><br/><span>간단 청소</span></label></div>
					<div><label for="pa10"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"/><br/><span>밥 챙겨주기</span></label></div>
					<div><label for="pa11"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg"/><br/><span>간단 설거지</span></label></div>
					<div></div>
					<div><label for="pa12"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"/><br/><span>장기입주</span></label></div>
					<div><label for="pa13"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"/><br/><span>단기입주</span></label></div>
				</div>
			</div>
			<div id="dataALLwrapper" data-aos="fade-up">
			<div class="title"><label class="divOnOff" for="ageAndGenderDiv">원하는 돌봄몬의 성별과 나이대가 있으신가요?</label></div>
			<div id="ageAndGenderDiv" class="mainDiv">
				<div id="genderDiv" style="color:gray; font-weight:bold;">
					<div>
						<img src="<%=request.getContextPath()%>/img/genderImg.png" style="width:80px;height:80px; margin:30px 0"/>
					</div>
					<input type="radio" id="g1" name="wish_gender" value="F" />
					<input type="radio" id="g2" name="wish_gender" value="M"/>
					<input type="radio" id="g3" name="wish_gender" value="A"/>
					<label class="label" for="g1">여자</label>
					<label for="g2">남자</label>
					<label for="g3">무관</label>
				</div>
				<div id="ageDiv" style="color:gray; font-weight:bold;">
					<input type="checkbox" id="20" name="wish_age" value="20" checked="checked"/>
					<input type="checkbox" id="30" name="wish_age" value="30" checked="checked"/>
					<input type="checkbox" id="40" name="wish_age" value="40" checked="checked"/>
					<input type="checkbox" id="50" name="wish_age" value="50" />
					<input type="checkbox" id="60" name="wish_age" value="60" />
					<ul style="color:gray;">
						<li style="width:60px; color:gray; list-style:none;"><label for="20">20대</label></li>
						<li style="width:60px; color:gray; list-style:none;"><label for="30">30대</label></li>
						<li style="width:60px; color:gray; list-style:none;"><label for="40">40대</label></li>
						<li style="width:60px; color:gray; list-style:none;"><label for="50">50대</label></li>
						<li style="width:60px; color:gray; list-style:none;"><label for="60">60대</label></li>
					</ul>
				</div>
			</div>
			</div>
			<div id="dataALLwrapper" data-aos="fade-up">
			<div class="title" ><label class="divOnOff" for="childrenInfoDiv">몇 명의 아이를 돌봐드릴까요?</label>
			<span class="orangeSpan" > 
			해당하는 자녀 수 버튼을 클릭하시면, 
			생년월일 입력으로 이동합니다.
			 </span>
			</div>
			<div id="childrenInfoDiv" class="mainDiv">
				<div id="childrenInfo">
					<div>
						<img src="<%=request.getContextPath() %>/img/childrenImg.png" style="width:150px;height:150px;" />
					</div>
					<input type="radio" id="childrenCnt1" name="childrenCnt" value="1"/>
					<input type="radio" id="childrenCnt2" name="childrenCnt" value="2"/>
					<input type="radio" id="childrenCnt3" name="childrenCnt" value="3"/>
					<input type="radio" id="childrenCnt4" name="childrenCnt" value="4"/>
					<div id="childrenCnt" style="color:gray; font-weight:bold;">
						<div><label for="childrenCnt1">1명</label></div>
						<div><label for="childrenCnt2">2명</label></div>
						<div><label for="childrenCnt3">3명</label></div>
						<div><label for="childrenCnt4">4명</label></div>
					</div>
					<div id="childrenDetailDiv">
						<ul id="childcnt1">
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
						</ul>
						<ul id="childcnt2">
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
						</ul>
						<ul id="childcnt3">
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
						</ul>
						<ul id="childcnt4">
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
							<li><input type="button" class="btn btn-warning childBtn" value="생년월일 입력" />-<input type="text" id="child_birth" class="child_birth" name="child_birth" readonly="readonly"/></li>
						</ul>
					</div>
				</div>
			</div>
			</div>
			<div id="dataALLwrapper" data-aos="fade-up">
			<div class="title">
				<label class="divOnOff" for="addrDiv">돌봄 장소를 입력해주세요</label>
			</div>
			<div id="addrDiv" class="mainDiv" style="color:gray; font-weight:bold;">
				<div id="mapImgDiv" style="margin:30px 0;">
					<div style="color:#ff7942; font-weight:bold;">아직 장소를 입력하지 않았습니다. 지도를 클릭해주세요.</div><br/><br/>
					<img class="zipcodeBtn" src="<%=request.getContextPath() %>/img/mapImg.png" style="width:150px;height:150px;"/>
				</div>
				<div id="mapDiv" style="margin:30px 0; display:none; text-align:center;">
					<div><input type="text" id="dong_addr" name="dong_addr" readonly="readonly" style="display:inline-block;border:none;"/></div>
					<div id="map" style="width:300px;height:300px; display:inline-block; " ></div>
				</div>
				<div id="zidcodeBtnDiv">
					<input class="btn btn-warning zipcodeBtn" type="button" id="zipcodeBtn" value="돌봄 장소 선택" />
					<input type="hidden" id="care_addr" name="care_addr"/>
					<input type="hidden" id="lat" name="lat"/>
					<input type="hidden" id="lng" name="lng"/>
				</div>
			</div>
			
			<div class="title" style="margin-bottom:50px; margin-top:100px;"><label class="divOnOff" for="timeTypeDiv">언제 돌봐드릴까요?</label></div>
			
			<div id="timeTypeDiv" class="mainDiv" style="color:gray; font-weight:bold;margin-bottom:50px;"> 
				<div><img src="<%=request.getContextPath() %>/img/calImg.png" style="width:150px;height:150px; margin-bottom:50px;"/></div>
				<input type="radio" id="timeType1" name="time_type" value="S"/>
				<input type="radio" id="timeType2" name="time_type" value="R"/>
				<label for="timeType1">특정날에만</label>
				<label for="timeType2">정기적으로</label>
				
				<div id="specificDateDiv">
					<div id="title">특정날에만</div>
					<div id="specificDateCal"></div>
					<br/><input type="hidden" id="select_date" name="select_date" />
				</div>
				
				<div id="regularDateDiv">
					<div id="title">정기적으로</div>
						<input type="hidden" id="end_date" name="end_date" readonly="readonly" />
					<div id="startDateDiv">
						<input class="btn btn-warning" type="button" id="startDateBtn" value="돌봄 시작일" />
						<input class="btn" type="text" id="start_date" name="start_date" readonly="readonly" />
					</div>
					<div id="selectDayDiv">
						<input type="checkbox" id="rd1" name="yoil" value="월" />
						<input type="checkbox" id="rd2" name="yoil" value="화" />
						<input type="checkbox" id="rd3" name="yoil" value="수" />
						<input type="checkbox" id="rd4" name="yoil" value="목" />
						<input type="checkbox" id="rd5" name="yoil" value="금" />
						<input type="checkbox" id="rd6" name="yoil" value="토" />
						<input type="checkbox" id="rd7" name="yoil" value="일" />
						<ul>
							<li><label for="rd1">월</label></li>
							<li><label for="rd2">화</label></li>
							<li><label for="rd3">수</label></li>
							<li><label for="rd4">목</label></li>
							<li><label for="rd5">금</label></li>
							<li><label for="rd6">토</label></li>
							<li><label for="rd7">일</label></li>
						</ul>
					</div>
					<hr/>
					<div id="periodDiv">
						<div>기간을 선택해주세요.</div>
						<label for="week2"><input type="radio" id="week2" name="week" value="2"/>2주</label>
						<label for="week3"><input type="radio" id="week3" name="week" value="3"/>3주</label>
						<label for="week4"><input type="radio" id="week4" name="week" value="4"/>4주</label>
					</div>
				</div>
				<div id="timeDiv">
					<div id="startDiv">
						<span>시작 시간</span><br/>		
						<select id="start_time" name="start_time" onselect="endTime();">
						</select>
					</div>
					<div id="endDiv">
						<span>종료 시간</span><br/>
						<select id="end_time" name="end_time">
							<option>종료시간</option>
						</select>
					</div>
					<div class="custom-control custom-switch" style="margin:15px 0; text-align:center;">
    					<input type="checkbox" class="custom-control-input" id="time_consultation" name="time_consultation" value="Y">
    					<label class="custom-control-label" for="time_consultation">시간 협의가능</label>
					</div>
				</div>
			</div>
			</div>
			
			<div id="dataALLwrapper" data-aos="fade-up">
			<div class="title"><label class="divOnOff" for="paymentDiv">희망시급을 입력해주세요</label></div>
			<div id="paymentDiv" class="mainDiv">
				<div>
					<img src="<%=request.getContextPath() %>/img/payImg.png" style="width:150px;height:150px;margin:20px 0" />
				</div>
				<div>
					<span id="minWage" style="color:red"></span>
				</div>
				<div id="wageDiv" style="color:gray; font-weight:bold;">
					<input type="number" inputmode="numeric" id="wish_wage" name="wish_wage" maxlength="6" value="8590"/><span>원/1시간</span>
				</div>
					<div class="custom-control custom-switch" style="margin:7px 0; text-align:center;">
    					<input type="checkbox" class="custom-control-input" id="avgWage">
    					<label class="custom-control-label" for="avgWage">평균시급 적용</label>
					</div>
					<div class="custom-control custom-switch" style="margin:7px 0; text-align:center;">
    					<input type="checkbox" class="custom-control-input" id="consultation" name="consultation" value="Y">
    					<label class="custom-control-label" for="consultation">시급 협의가능</label>
					</div>
				<p>
					아이 1명을 돌보는 경우 - 최저시급 8590원 이상 필수<br/>
					아이 2명을 돌보는 경우 - 희망시급의 1.5배 수준으로 합의
				</p>
			</div>
			</div>
			
			<div id="dataALLwrapper" data-aos="fade-up">
			<div class="title"><label class="divOnOff" for="descriptionDiv">제목과 신청내용을 적어주세요</label></div>
			<div id="descriptionDiv" class="mainDiv">
				<div><img src="<%=request.getContextPath()%>/img/contentImg.png" style="width:170px;height:150px; margin:20px 0;"/></div>
				<div style="display:inline-block;width:70%;padding-left:10px;text-align:left;">제목</div>
				<div id="subject" style="display:inline-block;width:70%;text-align:center; margin-bottom:20px";>
					<select id="subjectSelect" class="form-control selectpicker noborder" style="display:inline-block;">
						<option disabled="disabled">제목을 선택해주세요.</option>
						<option>직접 입력</option>
						<option>간단한 학습지도 해줄 돌봄몬 찾습니다.</option>
						<option>하원 후 저녁 시간까지 돌봐줄 돌봄몬 찾습니다.</option>
						<option>아이가 좋아하는 놀이를 같이해줄 돌봄몬 찾습니다.</option>
						<option>야외활동 같이해줄 돌봄몬 찾습니다.</option>
					</select>
					<input type="text" name="title" class="form-control spread-underline" placeholder="직접 입력" style="display:inline-block;padding-left:10px;border:none;border-bottom:1px solid gray;border-radius:0;margin-top:5px;">
				</div>
				<textarea name="content" placeholder="아이의  성격, 특이사항 등을 적어주세요."></textarea>
				<div id="warningDiv"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/s-membership-09-nono-icon.svg"/><p>자기소개 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</p></div>
			</div>
			
			<div id="submitDiv" style="font-weight:bold; font-size:20px;" >
				<input class="btn btn-warning" type="submit" value="등록하기" style="font-weight:bold; font-size:20px;"/>
			</div>
			</div>
			<div id="footer">
			</div>
		</form>
	</div>
	<script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 2000
    });
 
</script>
</body>
</html>
<jsp:include page="../footer.jsp"/>
