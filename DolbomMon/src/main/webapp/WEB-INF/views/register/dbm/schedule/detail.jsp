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
	#endDiv *{margin-bottom:10px;}
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
			
			for(var i=1;i<5;i++){
				if($("input[id=p"+i+"]").is(":checked")){
					
					$("label[for=p"+i+"]").css("background-color", "#ff5400").css("color", "white");
				}else{
					$("label[for=p"+i+"]").css("background-color", "#EFEFEF").css("color", "black");
				}
			}
			
			
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<form action="<%=request.getContextPath()%>/dbm/wantedPaymentAndCCTV">
		<div id="headerDiv"><h2>원하는 시간 직접 입력하기</h2></div>
		<div id="startDateDiv">
			<span>활동 시작일</span><br/>
			<input type="date" id="time" name="" />
		</div>
		<div id="selectDayDiv">
			<input type="checkbox" id="1" name="yoil" value="mon" />
			<input type="checkbox" id="2" name="yoil" value="tue" />
			<input type="checkbox" id="3" name="yoil" value="wed" />
			<input type="checkbox" id="4" name="yoil" value="thu" />
			<input type="checkbox" id="5" name="yoil" value="fri" />
			<input type="checkbox" id="6" name="yoil" value="sat" />
			<input type="checkbox" id="7" name="yoil" value="sun" />
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
				<input type="date" id="" name="" />
			</div>
			<div id="endDiv">
				<span>종료 시간</span><br/>
				<input type="date" id="" name="" />
			</div>
		</div>
		<div id="periodDiv">
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