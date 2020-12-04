<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>

</head>
<script>
	$(function(){
		$(document).ready(function(){
			/////////////////////// 시간 설정 //////////////////////
			if($("#timeType1").is(":checked")){
				$("label[for=timeType1]").css("background-color", "#FF5400").css("color", "white");
				$("#specificDateDiv").css("display", "inline-block");
				$("label[for=timeType2]").css("background-color", "#EFEFEF").css("color", "black");
				$("#regularDateDiv").css("display", "none");
				$("#timeDiv").css("display", "inline-block");
			}else if($("#timeType2").is(":checked")){
				$("label[for=timeType2]").css("background-color", "#FF5400").css("color", "white");
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
			startTime(); // selectBox 설정
			for(var i=1;i<8;i++){
				if($("input[id=rd"+i+"]").is(":checked")){
					$("label[for=rd"+i+"]").css("background-color", "#ff5400").css("color", "white");
				}else{
					$("label[for=rd"+i+"]").css("background-color", "#EFEFEF");
				}
			}
			
		/////////////////////////// 페이지 로딩 시 ///////////////////////////////////end			
		});
	
		//////////////////////정기적으로, 특정날에만 선택//////////////////////////////
		$("#timeTypeDiv >input[type=radio]").change(function(){
			if($("#timeType1").is(":checked")){
				$("label[for=timeType1]").css("background-color", "#FF5400").css("color", "white");
				$("#specificDateDiv").fadeIn();
				$("#timeDiv").fadeIn();;
				$("label[for=timeType2]").css("background-color", "#EFEFEF").css("color", "black");
				$("#regularDateDiv").css("display", "none");
				
			}else if($("#timeType2").is(":checked")){
				$("label[for=timeType2]").css("background-color", "#FF5400").css("color", "white");
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
		
		//////////////////////////정기적으로 ////////////////////////// 
		$("#regularDateDiv #startDateBtn").datepicker({ // 시작일 데이트피커
			showAnim : "show",
			minDate : "0",
			maxDate : "30d",
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				$("#regularDateDiv #start_date").val(dateText);
				$("#regularDateDiv #startDateBtn").val("돌봄 시작일");
			},
			altFormat:"yyyy-mm-dd"
		});
		
		$("#regularDateDiv #endDateBtn").datepicker({ // 종료일 데이트피커
			showAnim : "show",
			minDate : "+14d",
			maxDate : "+6m",
			dateFormat : "yy-mm-dd",
			onSelect:function(dateText){
				$("#regularDateDiv #end_date").val(dateText);
				$("#regularDateDiv #endDateBtn").val("돌봄 종료일");
			},
			altFormat:"yyyy-mm-dd"
		});
		// 요일 선택 시 색상변경
		$("input[name=yoil]").change(function(){
			$("#boom").fadeIn(100);
			$("#boom").fadeOut(100);
			$("#fatman").fadeIn(50);
			$("#fatman").fadeOut(1200);
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				$("label[for="+selectedData+"]").css("background-color", "#ff5400").css("color", "white");//노랑
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
		
	///////////////////////// function end /////////////////////////// 
	}); 
	
	
	
	function startTime(){ // 시작 시간
		var time = new Date(2020, 0, 1);
		var tag="";
		for(var i=1;i<=48;i++){
			if(time.getHours()<10 && time.getMinutes()==0) {
				tag += "<option id='rt"+i+"'>0"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()<10 && time.getMinutes()!=0){
				tag += "<option id='rt"+i+"'>0"+time.getHours()+":"+time.getMinutes()+"</option>";
			}else if(time.getHours()>10 && time.getMinutes()==0){
				tag += "<option id='rt"+i+"'>"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()>10 && time.getMinutes()!=0){
				tag += "<option id='rt"+i+"'>"+time.getHours()+":"+time.getMinutes()+"</option>";
			}
			time.setMinutes(time.getMinutes()+30);
		}
		document.getElementById("start_time").innerHTML = tag;
	}
	
	$(function(){
		$("#start_time").on('change' ,function(){
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
			}else if(time.getHours()>10 && time.getMinutes()==0){
				tag += "<option>"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()>10 && time.getMinutes()!=0){
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
	*{margin:0;padding:0; list-style:none; }
	input[type=radio], input[type=checkbox]{display:none;}
	#timeTypeDiv{width:80%; text-align:center; margin-top:100px;}
	#timeTypeDiv> label{display:inline-block; width:30%; height:40px; line-height:40px; margin:0 5%; border-radius:10px; border:none; background-color:#EFEFEF;}
	#timeTypeDiv #title{margin:20px 0; width:100%;}
	
	/* ==================== 정기적으로 - 날짜 설정 =================== */
	#regularDateDiv {display:inline-block; width:60%; text-align:center;}
	#regularDateDiv #startDateDiv{display:inline-block; margin-bottom:5px; width:70%; border:2px solid gray; border-radius:20%; margin-right:30px;}
	#regularDateDiv #startDateDiv>input{width:35%; height:40px; margin:0 5%; text-align:center; border:1px solid gray; border-radius:15px;}
	#regularDateDiv #startDateDiv>hr{position:relative; left:100%;width:50%; margin:0;border:0;height:10px;background-color:gray;}
	#regularDateDiv #startDateDiv>img{display:none;position:relative;left:130%;bottom:50px;width:50px;height:50px;}
	#regularDateDiv #startDateDiv>input[type=text]{font-weight:bold;}
	#fatman{display:none; position:relative; left:80%; bottom:500px;}
	/* ===================== =====================*/
	#regularDateDiv #selectDayDiv{width:100%; overflow:hidden; height:auto; border:2px solid gray; border-radius:40%;}
	#regularDateDiv #selectDayDiv li>label{
		display:block; 
		width:100%; height:100%; 
		border:1px solid gray; border-radius:50%; 
		background-color:#EFEFEF; 
		margin:0;
	}
	#regularDateDiv #selectDayDiv li{
		width:12.28%; 
		height:60px; 
		line-height:60px; 
		border-radius:50%; 
		text-align:center; 
		float:left; margin:1%; 
	}	
	/* ===================== =====================*/
	
	/* ==================== 활동 시간 설정  ======================== */
	#timeTypeDiv #timeDiv{display:inline-block; width:60%; overflow:hidden; height:auto; border-top:3px solid #CCC; margin-top:10px;}
	#timeTypeDiv #timeDiv div{width:50%; height:100px; float:left;}
	#timeTypeDiv #startDiv{padding:20px; border-right:1px solid gray;}
	#timeTypeDiv #startDiv *{float:right;}
	#timeTypeDiv #endDiv *{float:left;}
	#timeTypeDiv #endDiv{padding:20px;}
	#timeTypeDiv #startDiv>select{text-align-last:center}
	#timeTypeDiv #endDiv>select{text-align-last:center;}
	#timeTypeDiv select{width:60%; height:40px; font-size:17px; -webkit-appearance: none; moz-appearance: none;}
	/* ==================== 활동 요일 설정  ======================== */
	
	/* ========================= 특정날짜 선택 ======================== */
	#specificDateDiv{display:inline-block; width:60%; text-align:center;}
	#specificDateDiv>div{display:inline-block; width:100%;}
	/* ========================= 특정날짜 선택 ======================== */
	.ui-datepicker:nth-of-type(1){width:100%;}
</style>
<body>
	<form>
	<div class="container">
		<div id="timeTypeDiv" class="mainDiv">
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
					<input type="button" id="endDateBtn" value="돌봄 종료일 선택" />
					<hr/><img src="<%=request.getContextPath()%>/img/boom.png" id="boom"/>
					<input type="text" id="start_date" name="start_date" readonly="readonly" />
					<input type="text" id="end_date" name="end_date" readonly="readonly" />
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
			</div><br/>
			<button type="button" class="btn btn-warning next">저장</button>
			<img src="<%=request.getContextPath()%>/img/fatman.png" id="fatman"/>
		</div>
	</div>
	</form>
</body>
</html>