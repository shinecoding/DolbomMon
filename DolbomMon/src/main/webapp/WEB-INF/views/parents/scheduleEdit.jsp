스케줄에딧 
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
	*{ margin:0px; padding:0px; list-style:none; }
	.container{width:700px;padding:0px; }
	label{cursor:pointer;}
	/*========================= 헤더 ============================*/
	#headerDiv{width:100%; overflow:hidden; height:35px; margin:35px 0; }
	#headerDiv>label{float:left; }
	#headerDiv>div{
		width:85%; height:100%; 
		line-height:35px; 
		font-size:20px; font-weight:bold; text-align:center; 
		float:left; 
		padding-left:35px;
	}
	#headerDiv>div>span{display:inline-block;}
	#headerDiv>input{width:10%; height:35px;}
	/*========================= 헤더 ============================*/
	
	/*============================ 라디오 버튼 ============================== */
	#btnDiv{width:100%; overflow:hidden; height:auto;}
	#btnDiv input[type=radio]{display:none;}
	#btnDiv>label{
		width:45%; height:50px; line-height:50px; 
		float:left; 
		text-align:center; 
		margin:30px 0;
		background-color:#EFEFEF;
	}
	#btnDiv>label:first-child{margin-right:5%;}
	#btnDiv>label:last-child{margin-left:5%;}
	/*============================ 라디오 버튼 ============================== */
	
	/*============================ 정기적 으로 ============================== */
	#regularDiv #startDateDiv{border-bottom:1px solid gray; overflow:hidden; height:auto; padding:15px 0;}
	#regularDiv #startDateDiv span{float:left; font-weight:bold; color:gray; line-height:30px;}
	#regularDiv #startDateDiv input[type=date]{float:right; background-color:rgb(255, 222, 89);}
	
	#regularDiv{width:100%; overflow:hidden; height:auto;}
	#regularDiv #selectDayDiv{width:100%; overflow:hidden; height:auto;}
	#regularDiv #selectDayDiv li>label{
		width:100%; height:100%; 
		border-radius:50%; 
		background-color:#EFEFEF; 
		margin:0;
	}
	#regularDiv input[type=checkbox]{display:none;}
	#regualrDiv ul{display:inline-block; width:100px; overflow:hidden; height:auto;}
	#regularDiv #selectDayDiv li{
		width:100px; 
		height:100px; 
		line-height:60px; 
		border-radius:50%; 
		text-align:center; 
		font-weight:bold;
		float:left;  
		padding:20px;
	}	
	
	#selectTimeDiv{margin:30px 0;}
	#selectTimeDiv>ul{width:100%; overflow:hidden; height:auto;}
	#selectTimeDiv li>input[type=date]{background-color:rgb(255, 222, 89); } /* 시작종료시간 색상*/ 
	#selectTimeDiv li:nth-of-type(1){float:left;}
	#selectTimeDiv li:nth-of-type(2){float:right;}
	
	
	#startTimeDiv{width:100%;}
	#startendDiv>div{width:45%; float:left; text-align:center;}
	#startTimeDiv{margin-right:5%;}
	#endTimeDiv{margin-left:5%;}
	
	/*============================ 정기적 으로 ============================== */
	
</style>
<script>

	//페이지 로드 시 라디오 버튼 체크 확인
	$(document).ready(function(){
		console.log("페이지 로드");
		if($("input[id=tt1]").is(":checked")){ // 정기적으로가 선택되어있는 경우
			console.log("들어옴");
			$("#regularDiv").attr("style", "display:block;");
		
		}else{ // 특정날짜가 선택되어있는 경우
			 
		}
	});

	$(function(){
		
		// x버튼
		$("label[for=xBtn]").click(function(){
			history.back();
		});
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</head>
<body>
	<div class="container">
		<div id="headerDiv">
			<label for="xBtn" style="cursor:pointer;"><img src="<%=request.getContextPath()%>/icon/cancleBtn.png" style="width:35px; height:35px"/></label><input type="submit" id="xBtn" value="X" style="display:none" />
			<div>
				<span>돌봄 기간 / 시간 변경</span>
			</div>
			<input type="submit" id="" value="저장" style="height:30px;"/>
		</div>
		<div id="btnDiv">
			<label for="tt1" ><input type="radio" id="tt1" name="time_type">정기적으로</label>
			<label for="tt2" ><input type="radio" id="tt2" name="time_type">특정날에만</label>
		</div>
		
		
		
	
		<div id="regularDiv" style="display:none;">
		
			<div id="startDateDiv"><span>돌봄시작일</span><input type="date" name="start_date"/></div>
			<div id="selectDayDiv">
				<input type="checkbox" id="y1" name="yoil" value="mon" />
				<input type="checkbox" id="y2" name="yoil" value="tue" />
				<input type="checkbox" id="y3" name="yoil" value="wed" />
				<input type="checkbox" id="y4" name="yoil" value="thu" />
				<input type="checkbox" id="y5" name="yoil" value="fri" />
				<input type="checkbox" id="y6" name="yoil" value="sat" />
				<input type="checkbox" id="y7" name="yoil" value="sun" />
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
			<div id="selectTimeDiv" style="display:none;">
				<div id="startendDiv">
					<div id="startTimeDiv">
						<span>시작시간</span><br/>
						<input type="date" />
					</div>			
					<div id="endTimeDiv">
						<span>종료시간</span><br/>
						<input type="date" />
					</div>
					<ul id="setTimeList">
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>