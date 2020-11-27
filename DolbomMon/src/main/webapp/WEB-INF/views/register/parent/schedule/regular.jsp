<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	/* ==================== 초기화 ====================== */
	*{margin:0; padding:0; text-decoration:none; list-style:none;}
	.container{width:518px; padding:0;}
	/* ==================== 초기화 ====================== */
	#selectDayDiv input[type=checkbox]{display:none;}
	
	/* ==================== 헤더 ====================== */
	#header{
		width:100%; 
		overflow:hidden; 
		height:auto; 
		text-align:center; 
		font-size:20px; 
		margin-top:40px;
	}
	/* ==================== 헤더 ====================== */
	
	/* ==================== 기간, 요일 설정 ====================== */
	#startDateDiv{border-bottom:1px solid gray; overflow:hidden; height:auto; padding:15px 0;}
	#startDateDiv span{float:left; font-weight:bold; color:gray; line-height:30px;}
	#startDateDiv input[type=date]{float:right; background-color:rgb(255, 222, 89);}/*돌봄 시작일*/
	
	
	#selectDayDiv{width:100%; overflow:hidden; height:auto;}
	#selectDayDiv li>label{
		width:100%; height:100%; 
		border:1px solid gray; border-radius:50%; 
		background-color:#EFEFEF; 
		margin:0;
	}
	#selectDayDiv li{
		width:60px; 
		height:60px; 
		line-height:60px; 
		border-radius:50%; 
		text-align:center; 
		float:left; margin:7px; 
	}	
	
	#selectTimeDiv{margin:30px 0;}
	#selectTimeDiv>ul{width:100%; overflow:hidden; height:auto;}
	#selectTimeDiv li{width:25%;}
	#selectTimeDiv li:nth-of-type(1){float:left;}
	#selectTimeDiv li:nth-of-type(2){float:right;text-align:right;}
	#selectTimeDiv select{width:100%; height:50px; font-size:20px; padding-left:10px;}
	option{border-bottom:1px solid gray;}
	input[type=submit]{width:100%; height:40px; background-color:rgb(255, 222, 89);}
	/* ==================== 기간, 요일 설정 ====================== */
	
</style>
<script>

	$(function(){
		$(document).ready(function(){
			for(var i=1;i<8;i++){
				if($("input[id=y"+i+"]").is(":checked")){
					$("label[for=y"+i+"]").css("background-color", "rgb(255, 222, 89)");//노랑
				}else{
					$("label[for=y"+i+"]").css("background-color", "#EFEFEF");//회색
				}
			}
		});
		
		// 요일 선택 시 색깔변경
		$("input[name=yoil]").change(function(){
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				$("label[for="+selectedData+"]").css("background-color", "rgb(255, 222, 89)");//노랑
			}else{
				$("label[for="+selectedData+"]").css("background-color", "#EFEFEF");//회색
			}
		});
	});
		
	function startTime(){
		var time = new Date(2020, 0, 1);
		var tag="";
		for(var i=1;i<=48;i++){
			if(time.getHours()<10 && time.getMinutes()==0) {
				tag += "<option id='"+i+"'>0"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()<10 && time.getMinutes()!=0){
				tag += "<option id='"+i+"'>0"+time.getHours()+":"+time.getMinutes()+"</option>";
			}else if(time.getHours()>10 && time.getMinutes()==0){
				tag += "<option id='"+i+"'>"+time.getHours()+":0"+time.getMinutes()+"</option>";
			}else if(time.getHours()>10 && time.getMinutes()!=0){
				tag += "<option id='"+i+"'>"+time.getHours()+":"+time.getMinutes()+"</option>";
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
				if($("#start_time option[id="+i+"]").val()==test){
					endTime(i);
				}
			}
			
		});
	});
	
	function endTime(i){
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
	
	function setEndDate(){
		var startDate = document.getElementById("start_date").value;
		var data = startDate.split("-");
		var year = Number(data[0]); 
		var month = Number(data[1])+3;
		if(month==12){
			month = 1;
			year = year + 1;
		}
		var endDate = new Date(year, month, data[2]);
		document.getElementById("end_date").value = endDate.getFullYear()+"-"+endDate.getMonth()+"-"+endDate.getDate();
	}
	
	
</script>
</head>

<body onload="startTime();">
	<div class="container">
		<form method="post" onsubmit="setEndDate();" action="<%=request.getContextPath()%>/parent/description">
		<input id="end_date" name="end_date" type="text" value="" />
		<div id="header">정기적으로</div>	
		<div id="startDateDiv"><span>돌봄시작일</span><input type="date" id="start_date" name="start_date"/></div>
		<div id="selectDayDiv">
			<input type="checkbox" id="y1" name="yoil" value="월" />
			<input type="checkbox" id="y2" name="yoil" value="화" />
			<input type="checkbox" id="y3" name="yoil" value="수" />
			<input type="checkbox" id="y4" name="yoil" value="목" />
			<input type="checkbox" id="y5" name="yoil" value="금" />
			<input type="checkbox" id="y6" name="yoil" value="토" />
			<input type="checkbox" id="y7" name="yoil" value="일" />
			<ul>
				<li><label for="y1">월</label></li>
				<li><label for="y2">화</label></li>
				<li><label for="y3">수</label></li>
				<li><label for="y4">목</label></li>
				<li><label for="y5">금</label></li>
				<li><label for="y6">토</label></li>
				<li><label for="y7">일</label></li>
			</ul>
		</div>
		<div id="selectTimeDiv">
			
			
			<ul id="selectTimeList">
				<li><span>시작시간</span><br/>
				<select id="start_time" name="start_time" onselect="endTime();">
				
				</select></li>
				<li><span>종료시간</span><br/>
				<select id="end_time" name="end_time">
					<option>종료시간</option>
				</select></li>
			</ul>
			<input type="submit" value="다음" />
		</div>
		</form>
	</div>
</body>
</html>