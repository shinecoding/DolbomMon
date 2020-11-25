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
	*{margin:0; padding:0; list-style:none;}
	.container{width:518px; padding:0;}
	
	#headerDiv{width:100%; height:auto; text-align:center; margin-top:50px; border-bottom:1px solid #EFEFEF;}
	input[type=radio], input[type=checkbox]{display:none;}
	/* ==================== 시작 날짜 =================== */
	#startDateDiv{padding:10px 0;}
	#startDateDiv>input[type=date]{width:100%;}
	
	/* ===================== =====================*/
	#selectDayDiv{width:100%; overflow:hidden; height:auto; border-bottom:1px solid gray; padding-bottom:20px; margin-bottom:30px;}
	#selectDayDiv li>label{
		display:block; 
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
	/* ===================== =====================*/
	
	/* ==================== 활동 요일 설정  ======================== */
	#timeDiv{width:100%; overflow:hidden; height:auto;}
	#timeDiv div{width:50%; height:100px; float:left;}
	#startDiv{padding:20px; border-right:1px solid gray;}
	#startDiv *{float:right;}
	#endDiv{padding:20px;}
	#startDiv>select{width:50%;}
	#endDiv>select{width:50%;}
	#timeDiv span{}
	
	/* ==================== 활동 기간 설정 ==========================*/
	#periodDiv{width:100%; overflow:hidden; height:auto; text-align:center; margin-top:30px; border-top:1px solid gray;}
	
	#periodDiv h6{color:gray; margin-top:20px;}
	label{display:inline-block; width:100%; height:100%; margin:0;}
	#periodDiv ul{width:100%; overflow:hidden; height:auto; margin:0;}
	#periodList li{width:25%; text-align:center; float:left; border:1px solid #EFEFEF; }
	/* input[type=radio]{display:none;} */
	
	input[type=submit]{width:100%; height:40px; margin-top:30px; background-color:#ff5400; color:white; border:1px solid #EFEFEF;}
	
</style>
<script>

	$(function(){
		$(document).ready(function(){
			for(var i=1;i<8;i++){
				if($("input[id="+i+"]").is(":checked")){
					$("label[for="+i+"]").css("background-color", "rgb(255, 222, 89)");//노랑
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF");//회색
				}
			}
			
			for(var i=1;i<5;i++){
				if($("input[id=p"+i+"]").is(":checked")){
					$("label[for=p"+i+"]").css("background-color", "#ff5400").css("color", "white");
				}else{
					$("label[for=p"+i+"]").css("background-color", "#EFEFEF").css("color", "black");
				}
			}
			
		});
		
		// 요일 선택 시 색상변경
		$("input[name=yoil]").change(function(){
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				$("label[for="+selectedData+"]").css("background-color", "rgb(255, 222, 89)");//노랑
			}else{
				$("label[for="+selectedData+"]").css("background-color", "#EFEFEF");//회색
			}
		});
		
		// 기간 선택 시 색상변경
		$("input[type=radio]").change(function(){
			
			var selectedData = $(this).attr("id");
			var startDate = $("input[id=start_date]").val();
			console.log("startDate ==>" + startDate+"2");
			if(startDate=="") {
				alert("활동 시작일을 먼저 설정해주세요");
			}else{
				for(var i=1;i<5;i++){
					if($("input[id=p"+i+"]").is(":checked")){
						$("label[for=p"+i+"]").css("background-color", "#ff5400").css("color", "white");
						setEndDate(i);
					}else{
						$("label[for=p"+i+"]").css("background-color", "#EFEFEF").css("color", "black");
						
					}
				}
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
	
	function setEndDate(i){
		var startDate = document.getElementById("start_date").value;
		var data = startDate.split("-");
		var endDate;
		if(i==1){
			var endDate = new Date(data[0], data[1], Number(data[2])+7);
		}else if(i==2){
			var endDate = new Date(data[0], Number(data[1])+1, data[2]);
		}else if(i==3){
			var endDate = new Date(data[0], Number(data[1])+3, data[2]);
		}else if(i==4){
			var endDate = new Date(data[0], Number(data[1])+6, data[2]);
		}
		document.getElementById("end_date").value = endDate.getFullYear()+"-"+endDate.getMonth()+"-"+endDate.getDate();
	}
</script>
</head>
<body onload="startTime();">
	<div class="container">
		<form method="post" action="<%=request.getContextPath()%>/dbm/wantedPaymentAndCCTV">
		<div id="headerDiv"><h2>원하는 시간 직접 입력하기</h2></div>
		<div id="startDateDiv">
			<span>활동 시작일</span><br/>
			<input type="date" id="start_date" name="start_date" />
		</div>
		<div id="selectDayDiv">
			<input type="checkbox" id="1" name="yoil" value="월" />
			<input type="checkbox" id="2" name="yoil" value="화" />
			<input type="checkbox" id="3" name="yoil" value="수" />
			<input type="checkbox" id="4" name="yoil" value="목" />
			<input type="checkbox" id="5" name="yoil" value="금" />
			<input type="checkbox" id="6" name="yoil" value="토" />
			<input type="checkbox" id="7" name="yoil" value="일" />
			<ul>
				<li><label for="1">월</label></li>
				<li><label for="2">화</label></li>
				<li><label for="3">수</label></li>
				<li><label for="4">목</label></li>
				<li><label for="5">금</label></li>
				<li><label for="6">토</label></li>
				<li><label for="7">일</label></li>
			</ul>
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
		<div id="periodDiv">
			<input type="text" id="end_date" name="end_date" placeholder="end_date" />
			<h6>이 일정으로 얼마나 일할 수 있나요?</h6>
			<ul id="periodList">
				<li><label for="p1"><input type="radio" id="p1" name="asdf" />1주일 이상</label></li>
				<li><label for="p2"><input type="radio" id="p2" name="asdf" />1개월 이상</label></li>
				<li><label for="p3"><input type="radio" id="p3" name="asdf" />3개월 이상</label></li>
				<li><label for="p4"><input type="radio" id="p4" name="asdf" />6개월 이상</label></li>
			</ul>
			<input type="submit" value="다음" />
		</div>
		</form>
	</div>
	
</body>
</html>