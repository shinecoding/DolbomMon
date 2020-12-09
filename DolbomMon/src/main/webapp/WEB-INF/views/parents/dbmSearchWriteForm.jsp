<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dbmSearchWriteForm.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87&libraries=services"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script>
	$(function(){
		/////////////////// 페이지 로딩 시 //////////////////////
		$(document).ready(function(){
			
			startTime();
			
			/////////////////////// 시간 설정 //////////////////////
			if($("#timeType1").is(":checked")){
				$("label[for=timeType1]").css("background-color", "#ffc207").css("color", "white");
				$("#specificDateDiv").css("display", "inline-block");
				$("label[for=timeType2]").css("background-color", "#EFEFEF").css("color", "black");
				$("#regularDateDiv").css("display", "none");
				$("#timeDiv").css("display", "inline-block");
			}else if($("#timeType2").is(":checked")){
				$("label[for=timeType2]").css("background-color", "#ffc207").css("color", "white");
				$("#regularDateDiv").css("display", "inline-block");
				$("label[for=timeType1]").css("background-color", "#EFEFEF").css("color", "black");
				$("#specificDateDiv").css("display", "none");
				$("#timeDiv").css("display", "inline-block");
			}else{
				$("label[for=timeType1]").css("background-color", "#EFEFEF").css("color", "black");
				$("label[for=timeType2]").css("background-color", "#EFEFEF").css("color", "black");
				$("#specificDateDiv").css("display", "none");
				$("#regularDateDiv").css("display", "none");
				$("#timeDiv").css("display", "none");
			}
			///////////////////////////// 정기적으로 날짜 설정 요일 //////////////////////////////
			
			for(var i=1;i<8;i++){
				if($("input[id=rd"+i+"]").is(":checked")){
					$("label[for=rd"+i+"]").css("background-color", "#ffc207").css("color", "white");
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
					$("label[for=g"+i+"]").css("background-color", "#ffc207").css("color", "white");
				}else{
					$("label[for=g"+i+"]").css("background-color", "#EFEFEF").css("color", "black");
				}
			}
			/////////////// 나이대 설정 ////////////
			for(var i=2;i<7;i++){
				if($("input[id="+i+"0]").is(":checked")){
					$("label[for="+i+"0]").parent().css("background-color", "#ffc207").css("color", "white");
				}else{
					$("label[for="+i+"0]").parent().css("background-color", "#EFEFEF").css("color", "black");
				}
			}
			
			for(var i=1;i<5;i++){
				if($("#childrenInfo>input[id=childrenCnt"+i+"]").is(":checked")){
					$("label[for=childrenCnt"+i+"]").css("background-color", "#ffc207");
					$("#childrenDetail").html("");
					var tag = ""
					tag += "<li><span class='cn'>자녀 이름</span><input class='cntext' type='text' name='child_name' /><br/>";
					tag += "<span class='cb'>자녀 생년월일</span><input class='cbtext' type='date' name='child_birth' /></li>";
					for(var j=0;j<i;j++){
						$("#childrenDetail").append(tag);
					}
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF");
				}
			}
			/////////////////// 페이지 로딩 시 //////////////////////end
		});
		
		////////////////////// 정기적으로, 특정날에만 선택//////////////////////////////
		$("#timeTypeDiv >input[type=radio]").change(function(){
			if($("#timeType1").is(":checked")){
				$("label[for=timeType1]").css("background-color", "#ffc207").css("color", "white");
				$("#specificDateDiv").fadeIn();
				$("#timeDiv").fadeIn();
				$("label[for=timeType2]").css("background-color", "#EFEFEF").css("color", "black");
				$("#regularDateDiv").css("display", "none");
				
			}else if($("#timeType2").is(":checked")){
				$("label[for=timeType2]").css("background-color", "#ffc207").css("color", "white");
				$("#regularDateDiv").fadeIn();
				$("label[for=timeType1]").css("background-color", "#EFEFEF").css("color", "black");
				$("#specificDateDiv").css("display", "none");
				$("#timeDiv").fadeIn();
			}else{
				$("label[for=timeType1]").css("background-color", "#EFEFEF").css("color", "black");
				$("label[for=timeType2]").css("background-color", "#EFEFEF").css("color", "black");
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
			$("label[for="+selectedData+"]").children("img").fadeOut(50);
			$("label[for="+selectedData+"]").children("img").fadeIn(50);
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
					$("label[for=g"+i+"]").css("background-color", "#ffc207").css("color", "white");
				}else{
					$("label[for=g"+i+"]").css("background-color", "#EFEFEF").css("color", "black");
				}
			}
		});
		
		//////////// 나이 변경 ///////////////
		$("input[name=wish_age]").change(function(){
			for(var i=0;i<20;i++){
				$("#dadadada").fadeIn(30);
				$("#dadadada").fadeOut(30);
			}
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				
				$("label[for="+selectedData+"]").parent().css("background-color", "#ffc207").css("color", "white");
			}else{
				
				$("label[for="+selectedData+"]").parent().css("background-color", "#EFEFEF").css("color", "black");
			}
			
		});
		
		//////////// 자녀 정보 //////////////
		$("#childrenInfo>input[type=radio]").change(function(){
			for(var i=1;i<5;i++){
				if($("input[id=childrenCnt"+i+"]").is(":checked")){
					$("label[for=childrenCnt"+i+"]").css("background-color", "#ffc207");
					$("#childrenDetail").html("");
					var tag = ""
					tag += "<li>";
					tag += "<input type='button' class='cb' value='자녀생년월일'><input type='date' id='child_birth' name='child_birth' /></li>";
					for(var j=0;j<i;j++){
						$("#childrenDetail").append(tag);
					}
				}else{
					$("label[for=childrenCnt"+i+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		
		///////////////////////////// 지도 생성 ////////////////////////////////
		
		///////////////////////////// 지도 생성 ////////////////////////////////
		
		$(document).on('keyup','input[inputmode=numeric]',function(event){
			this.value = this.value.replace(/[^0-9]/g,'');  
			this.value = this.value.replace(/,/g,'');  
			if(this.value<8590){
				$(this).css("color", "gray");
				$("#minWage").html("최저시급(8590원)이상의 시급을 입력해주세요");
			}else {
				$(this).css("color", "white");
				$("#minWage").html("")
			}
		});
		
		$("input[id=avgWage]").change(function(){
			var wage = $("#wish_wage").val;
			
			if(wage<8590){
				$("#wish_wage").css("color", "gray");
				$("#minWage").html("최저시급(8590원)이상의 시급을 입력해주세요");
			}else {
				$("#wish_wage").css("color", "white");
				$("#minWage").html("")
			}
			
			if(this.checked){
				$("#wish_wage").val("8600").attr("readonly", "readonly");
			}else{
				$("#wish_wage").prop("readonly", false);
			}
		});
		////////////////////////// 정기적으로 ////////////////////////// 
		$("#regularDateDiv #startDateBtn").datepicker({ // 시작일 데이트피커
			showAnim : "show",
			minDate : "0",
			maxDate : "30d",
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				$("#regularDateDiv #start_date").val(dateText);
				console.log(dateText);
				$("#regularDateDiv #startDateBtn").val("돌봄 시작일");
				setEndDate(3);
			},
			altFormat:"yyyy-mm-dd"
		});
		function setEndDate(i){
			var date = new Date();
			var startDate = document.getElementById("start_date").value;
			var data = startDate.split("-");
			var endDate;
			var setEndDate;
			var month = Number(data[1]);
			if(i==1){
				endDate = new Date(data[0], data[1], Number(data[2])+7);
				setEndDate = endDate.getFullYear()+"-"+endDate.getMonth()+"-"+endDate.getDate();
			}else if(i==2){
				if(month+1==12){
					endDate = new Date(data[0], month+1, data[2]);
					setEndDate = endDate.getFullYear()+"-12-"+endDate.getDate();
				}else{
					endDate = new Date(data[0], month+1, data[2]);
					setEndDate = endDate.getFullYear()+"-"+endDate.getMonth()+"-"+endDate.getDate();
				}
			}else if(i==3){
				if(month+3==12){
					endDate = new Date(data[0], month+3, data[2]);
					setEndDate = endDate.getFullYear()+"-12-"+endDate.getDate();
				}else{
					endDate = new Date(data[0], month+3, data[2]);
					setEndDate = endDate.getFullYear()+"-"+endDate.getMonth()+"-"+endDate.getDate();
				}
			}else if(i==4){
				if(month+6==12){
					endDate = new Date(data[0], month+6, data[2]);
					setEndDate = endDate.getFullYear()+"-12-"+endDate.getDate();
				}else{
					endDate = new Date(data[0], month+6, data[2]);
					setEndDate = endDate.getFullYear()+"-"+endDate.getMonth()+"-"+endDate.getDate();
				}
			}
			document.getElementById("end_date").value = setEndDate;
		}
		
		
		
		// 요일 선택 시 색상변경
		$("input[name=yoil]").change(function(){
			
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				$("label[for="+selectedData+"]").css("background-color", "#ffc207").css("color", "white");//노랑
			}else{
				$("label[for="+selectedData+"]").css("background-color", "#EFEFEF").css("color", "black");//회색
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
		
		/////////////////////////// 등록하기 버튼 누를 시 ////////////////////////
		$("#writeFrm").submit(function(){
			var wage = $("#wish_wage").val();
			if(wage==null || wage==""){
				alert("희망시급을 입력해주세요");
				$.divOnOff(this);
				return false;
			}else if(wage<8590){
				alert("희망시급은 최소 8590원 이상이어야합니다.");
				$.divOnOff(this);
				return false;
			}
			var pw_activityCnt = $("input[name=pw_activity]:checked").length;
			if(pw_activityCnt==0){
				swal({
					title : "돌봄유형",
					text : "원하는 돌봄유형을 입력해주세요",
					icon : "info"
				});
				$.divOnOff("input[name=pw_activity]");
				return false;
			}
			
			var wish_genderCnt = $("input[name=wish_gender]:checked").length;
			if(wish_genderCnt==0){
				swal({
					title : "선생님 성별",
					text : "원하는 선생님 성별을 입력해주세요",
					icon : "info"
				});
				$.divOnOff("input[name=wish_gender]");
				return false;
			}
			
			var wish_ageCnt = $("input[name=wish_age]:checked").length;
			if(wish_ageCnt==0){
				swal({
					title : "선생님 나이",
					text : "원하는 선생님 나이대를 입력해주세요",
					icon : "info"
				});
				$.divOnOff("input[name=wish_age]");
				return false;
			}
			
			var childCnt = $("input[name=childrenCnt]:checked").length;
			if(childCnt < 1) {
				swal({
					title : "자녀 정보 입력",
					text : "자녀의 정보를 입력해주세요",
					icon : "info"
				});
				$.divOnOff("input[name=childrenCnt]");
				return false;
			}
			
			$("input[name=child_birth]").each(function(){
				var cbtext = $(this).val();
				if(cbtext == null || cbtext == ""){
					console.log("cb =>" + cbtext);
					swal({
						title : "자녀 정보 입력",
						text : "자녀의 생년월일을 입력해주세요",
						icon : "info"
					});
					$.divOnOff("input[name=child_birth]");
					return false;
				}
			});
			
			if($("input[name=time_type]:checked").length<1){
				swal({
					title : "돌봄 날짜 선택",
					text : "선생님을 만나고 싶은 날을 선택해주세요",
					icon : "info"
				});
				$.divOnOff("input[name=time_type]");
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
					$.divOnOff("input[name=time_type]");
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
					$.divOnOff("#start_date");
					return false;
				}else if(end_date==null || end_date==""){
					swal({
						title : "돌봄 날짜 선택",
						text : "돌봄 종료날짜를 선택해주세요",
						icon : "info"
					});
					$.divOnOff("#end_date");
					return false;
				}
				
				var yoil = $("input[name=yoil]:checked").length;
				if(yoil < 1) {
					swal({
						title : "돌봄 날짜 선택",
						text : "선생님을 만나고 싶은 요일을 선택해주세요",
						icon : "info"
					});
					$.divOnOff("input[name=yoil]");
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
				$.divOnOff("#end_time");
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
						$("#zipcodeBtn").click(function(){
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
						           	window.close();
						        },theme:{
						        	searchBgColor: "#ff5400", //검색창 배경색
						            queryTextColor: "#FFFFFF" //검색창 글자색
						        }
						    }).open();
						});
					});
									
				</script>
<script>
	$.divOnOff = function(a){
		$(".mainDiv").fadeOut();
		var divLocation = $(a).parents(".mainDiv").offset();
		console.log("요소의 위치 => " + divLocation);
		$(a).parents(".mainDiv").fadeIn();
	}
	
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
</script>
<style>
 	.ui-datepicker:nth-of-type(1){width:100%;}
 	.ui-datepicker td>a{text-align:center;}
 	.ui-state-active{background-color:#FFC207;}
 	.divOff{display:none;}
 	.divOn{display:inline-block;}
</style>
<body>
	<div id="top">
		<%@include file="/WEB-INF/views/top.jsp"%>
	</div>
	<div class="container">
		<form id="writeFrm" method="post" action="dbmSearchWriteFormOk">
			<div id="header">
				<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/mylogo.png"/></a>
			</div>
			<div class="title"><label class="divOnOff" for="activityTypeDiv">어떤 돌봄을 원하세요?</label></div>
			<div>
				<img src="<%=request.getContextPath()%>/img/actImg.png" style="width:170px;height:170px;" />
			</div>
			
			
			<div id="activityTypeDiv" class="mainDiv">
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
			
			<div class="title"><label class="divOnOff" for="ageAndGenderDiv">원하는 돌봄몬의 나이대와 성별을 알려주세요</label></div>
			<div id="ageAndGenderDiv" class="mainDiv">
				<div id="genderDiv">
					<div>
						<img src="<%=request.getContextPath()%>/img/genderImg.png" style="width:200px;height:150px; margin:30px 0"/>
					</div>
					<input type="radio" id="g1" name="wish_gender" value="F" />
					<input type="radio" id="g2" name="wish_gender" value="M"/>
					<input type="radio" id="g3" name="wish_gender" value="A"/>
					<div>
						
					</div>
					<label for="g1">여자</label>
					<label for="g2">남자</label>
					<label for="g3">무관</label>
				</div>
				<div id="ageDiv">
					<input type="checkbox" id="20" name="wish_age" value="20" checked="checked"/>
					<input type="checkbox" id="30" name="wish_age" value="30" checked="checked"/>
					<input type="checkbox" id="40" name="wish_age" value="40" checked="checked"/>
					<input type="checkbox" id="50" name="wish_age" value="50" />
					<input type="checkbox" id="60" name="wish_age" value="60" />
					<ul>
						<li><label for="20">20대</label></li>
						<li><label for="30">30대</label></li>
						<li><label for="40">40대</label></li>
						<li><label for="50">50대</label></li>
						<li><label for="60">60대</label></li>
					</ul>
				</div>
			</div>
			
			<div class="title" ><label class="divOnOff" for="childrenInfoDiv">자녀의 정보를 입력해주세요</label></div>
			<div id="childrenInfoDiv" class="mainDiv">
				<div id="childrenInfo">
					<div>
						<img src="<%=request.getContextPath() %>/img/childrenImg.png" style="width:250px;height:250px;" />
					</div>
					<input type="radio" id="childrenCnt1" name="childrenCnt"/>
					<input type="radio" id="childrenCnt2" name="childrenCnt"/>
					<input type="radio" id="childrenCnt3" name="childrenCnt"/>
					<input type="radio" id="childrenCnt4" name="childrenCnt"/>
					<div id=childrenCnt>
						<div><label for="childrenCnt1">1명</label></div>
						<div><label for="childrenCnt2">2명</label></div>
						<div><label for="childrenCnt3">3명</label></div>
						<div><label for="childrenCnt4">4명</label></div>
					</div>
					<div id="childrenDetailDiv">
						<ul id="childrenDetail"></ul>
					</div>
				</div>
			</div>
			
			<div class="title">
				<label class="divOnOff" for="addrDiv">돌봄 장소를 입력해주세요</label>
			</div>
			<div id="addrDiv" class="mainDiv">
				<div id="mapImgDiv" style="margin:30px 0;">
					<div>아직 장소를 입력하지 않았습니다.</div>
					<img src="<%=request.getContextPath() %>/img/mapImg.png" style="width:300px;height:300px;"/>
				</div>
				<div id="mapDiv" style="margin:30px 0; display:none;">
					<div id="map" style="width:300px;height:300px; display:inline-block; " ></div>
				</div>
				<div id="zidcodeBtnDiv">
					<input type="button" id="zipcodeBtn" value="돌봄 장소" />
					<input type="hidden" id="care_addr" name="care_addr"/>
					<input type="hidden" id="dong_addr" name="dong_addr"/>
					<input type="hidden" id="lat" name="lat"/>
					<input type="hidden" id="lng" name="lng"/>
				</div>
			</div>
			
			<div class="title"><label class="divOnOff" for="timeTypeDiv">언제 돌봐드릴까요?</label></div>
			
			<div id="timeTypeDiv" class="mainDiv">
				<div><img src="<%=request.getContextPath() %>/img/calImg.png" style="width:270px;height:250px;"/></div>
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
					<div id="startDateDiv">
						<input type="button" id="startDateBtn" value="돌봄 시작일 선택" />
						<input type="text" id="start_date" name="start_date" readonly="readonly" />
						<input type="hidden" id="end_date" name="end_date"  />
						
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
				</div>
			</div>
			
			
			
			<div class="title"><label class="divOnOff" for="paymentDiv">희망시급을 입력해주세요</label></div>
			<div id="paymentDiv" class="mainDiv">
				<div>
					<img src="<%=request.getContextPath() %>/img/payImg.png" style="width:170px;height:150px;margin:20px 0" />
				</div>
				<div>
					<span id="minWage" style="color:red"></span>
				</div>
				<div id="wageDiv">
					<input type="number" inputmode="numeric" id="wish_wage" name="wish_wage" maxlength="6" value="8590" style="color:white;"/><span>원/1시간</span>
				</div>
				<label for="avgWage" style="width:100%;"><input type="checkbox" id="avgWage" style="width:5%;"/><span style="width:90%;">평균시급 적용</span></label>
				<label for="conYN" style="width:100%;"><input type="checkbox" id="consultation" style="width:5%;" name="consultation" value="Y"/><span style="width:90%;">협의 가능</span></label>
				<p>
					아이 1명을 돌보는 경우 - 최저시급 8590원 이상 필수<br/>
					아이 2명을 돌보는 경우 - 희망시급의 1.5배 수준으로 합의
				</p>
			</div>
			
			<div class="title"><label class="divOnOff" for="descriptionDiv">돌봄몬이 알아야 할 내용이 있나요?</label></div>
			<div id="descriptionDiv" class="mainDiv">
				<div><img src="<%=request.getContextPath()%>/img/contentImg.png" style="width:170px;height:150px; margin:20px 0;"/></div>
				<textarea name="content" placeholder="아이의  성격, 특이사항 등을 적어주세요."></textarea>
				<div id="warningDiv"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/s-membership-09-nono-icon.svg"/><p>자기소개 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</p></div>
			</div>
			
			<div id="submitDiv" >
				<input type="submit" value="등록하기" />
			</div>
			
			<div id="footer"></div>
		</form>
	</div>
</body>
</html>