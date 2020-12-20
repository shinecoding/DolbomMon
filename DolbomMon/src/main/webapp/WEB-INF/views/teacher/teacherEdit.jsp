<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.container{width:800px;
}
i{color:gray;}

h5{
	padding: 20px 0px 0px 0px;
	font-weight: bold;
}
 .fa-check-circle{
 font-size:60px;
 margin: 8px;
}

#cctvLst>label{
position:relative;
display:inline-block;
width:45%;
height:150px;
border: 1px solid #ddd;
padding:50px 0;
margin:5px;
text-align:center;

}
input[type=submit]{
opacity:0;
width:100%;
height:100%;
left:0;
top:0;
position:absolute;
}

#cctvWarning{
font-size: 0.8em;
color: gray;
text-align:center;
}
#cctvHidden{
overflow:hidden;
height:0px;
}
#cctvCheck1, #cctvCheck2{
font-size: 40px;
float:right;
color:white;
}
#profFrame{
	position: relative;
	width: 500px;
	height: 500px;
	display:block;
	left: calc(50% - 250px);
	overflow:visible;
	margin-top: 50px;
	}
	#profimg{
	position:absolute;
	width:500px;
	height:500px;	
	}
	.fa-pen{
	position: absolute;
	width:50px;
	height:50px;
	right:-10px;
	top:-10px;
	padding-top:17px;
	background-color:orange;
	color:white;
	border-radius:50%;
	text-align:center;
	z-index:100;
	}
	.editBtn{
	opacity:0%;
	position:absolute;
	top:0;
	left:0;
	bottom:0;
	right:0;
	width:100%;
	height:100%
	}
	.list-group-item{
	position:relative;
	padding: 20px;
	}
	
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
	
img{

width:50%;

}
.boldFont{
color:orange;
font-weight:bold;
}
</style>
<script>
	$(function(){
		$("#cctvLst>label").click(function(){
			$(this).css("background-color", "orange").css("font-weight", "bold");
			$(this).siblings().css("background-color", "white").css("font-weight", "normal");
	
		});
		$(document).on("click", "#cctvLst>label", function(){
			console.log($(this).attr("for"));
			var cctv = $(this).attr("for");
			var url = "/dbmon/cctvOk";
			var params = "cctv="+cctv;
			
			$.ajax({
				url:url,
				data:params,
				type:'GET',
				success:function(result){
					if(result=="1"){
						console.log("성공");
												
					}else if(result="0"){
						console.log("실패");
					}
				}, error:function(){
					console.log("AJAX 받기 에러");
				}//error
				
			});//ajax
			
			
			
		});//cctv클릭
		
		
		
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
		var timebar = "";
		
		for(var j=0;j<edll;j++){ // j 값에 몇 주치 데이터를 넣을지 정함
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
		
		
		
	});//제이쿼리
</script>
</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
</div>
<div class="container">
	<h5>내 사진</h5>

	   	<div id="profFrame">
				<img class="rounded mx-auto d-block" id="profimg" <c:if test="${vo.pic==null}">src="img/profilepic.png"</c:if>
				<c:if test="${vo.pic!=null}">src="upload/${vo.pic}"</c:if>/>
				<i class="fas fa-pen"><a class="editBtn" href="teacherPicture"></a></i>	
			</div>	
   

   	<h5>간단 자기소개</h5>
   	<li class="list-group-item" style="text-align:center">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherIntro"></a></i>
	   <c:if test="${vo.intro!=null }">	${vo.intro }</c:if>
	   <c:if test="${vo.intro==null }">작성 시 부모로부터<br/>
			<span class="boldFont">4배 더 많은 선택<span>을 받게 됩니다!</c:if>
   	</li>
   	<h5>선호하는 돌봄유형</h5>
   	<li class="list-group-item" style="text-align:center">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherType"></a></i>
	   	"저는 <span class="boldFont">${vo.care_type}</span> 돌봄을 가장 선호해요"
   	</li>
   	<h5>희망 시급</h5>
   	<li class="list-group-item" style="text-align:center">
   		<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
   		<c:if test="${vo.desired_wage!=null }"> ₩${vo.desired_wage }<br/></c:if>
   		<span class="boldFont"> 원하는 시급을 자유롭게 입력해주세요</span>
   	</li>
   	<h5>관련 경험</h5>
   	<li class="list-group-item" style="text-align:center">
   		<i class="fas fa-pen"><a class="editBtn" href="teacherExp"></a></i>
   		<c:if test="${hash!=null}">
   		<c:forEach var="evo" items="${hash}">
   			<b>${evo.exp_content}</b><br/>
   			${evo.exp_start} ~ ${evo.exp_end}<br/><br/>
   		</c:forEach>	
   		</c:if>
   		<c:if test="${hash==null}">
   		작성 시 부모로부터<br/>3배 더 많은 선택을 받게 됩니다!
   		</c:if>
   	</li>
   	<h5>활동 가능 시간</h5>
   	<li class="list-group-item">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherSchedule"></a></i>
	   	<div>
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
	   	</div>
	   	</li>
   	<h5>돌봄 가능 연령</h5>
   	 <c:set var = "str" value = "${vo.child_age}"/>
   	<li class="list-group-item">
   	 	<i class="fas fa-pen"><a class="editBtn" href="teacherAge"></a></i>
	   	<ul class="list-group list-group-horizontal-sm" >
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '신생아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '신생아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-s.svg"</c:if> 
			alt="신생아" /><br/>신생아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '영아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '영아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-s.svg"</c:if>
			 alt="영아" /><br/>영아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '유아')}">
			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '유아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-s.svg"</c:if>
			 alt="유아" /><br/>유아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${!fn:contains(str, '초등학생')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-n.svg"</c:if> 
			<c:if test = "${fn:contains(str, '초등학생')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-s.svg"</c:if> 
			 alt="초등학생" /><br/>초등학생</li>
	   </ul>
   </li>
   <h5>가능한 활동</h5>
   <c:set var = "str" value = "${vo.activity_type}"/>
   <li class="list-group-item">
   	<i class="fas fa-pen"><a class="editBtn" href="teacherActivity"></a></i>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-s.svg" </c:if> 
	   			/><br/>실내놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-s.svg" </c:if>
	   			/><br/>등하원돕기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-n@2x.png" </c:if>
	   			<c:if test = "${fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-s@2x.png" </c:if>
	   			 /><br/>책읽기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-s.svg" </c:if> 
	   			/><br/>야외활동</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-s-2.svg" </c:if>
	   			 /><br/>한글놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				 <c:if test = "${!fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg" </c:if> 
				<c:if test = "${fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-s.svg" </c:if> 
				/><br/>영어놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-s.svg" </c:if>
				/><br/>학습지도</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-s.svg" </c:if>		
				/><br/>체육놀이</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '간단청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '간단청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-s.svg"</c:if>
				/><br/>간단청소</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '밥챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '밥챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-s.svg"</c:if>
				/><br/>밥 챙겨주기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '간단설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '간단설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-s.svg" </c:if>						
				/><br/>간단설거지</li>
   		
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-s.svg"</c:if>
				/><br/>장기입주</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"</c:if> 
				<c:if test = "${fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-s.svg"</c:if> 			
				/><br/>단기입주</li>

   		</ul>
   	</li>	
		<h5>활동 가능 지역</h5>
		
		<li class="list-group-item">
			<i class="fas fa-pen"><a class="editBtn" href="teacherMap"></a></i>
			<ul class="list-group" >
			<li class="list-group-item" style="border:none">
				<span class="badge badge-warning">1순위</span> ${vo.area1}
			</li>
			</ul>
		</li>
		
		<h5>CCTV동의 여부</h5>
		<form method="post" action="cctvOk">
		
			<li id="cctvLst" class="list-group-item" >
				<div id="cctvHidden">
					<input type="radio" name="cctv" id="cctvDisagree" <c:if test="${vo.cctv=='N'}"> checked</c:if> value="N"/>
				    <input type="radio" name="cctv" id="cctvAgree" <c:if test="${vo.cctv=='Y'}"> checked</c:if> value="Y"/>	    
			    </div>
					 <label for="cctvDisagree" class="rounded"  <c:if test="${vo.cctv=='N'}"> style="background-color:orange; font-weight:bold;" </c:if>>   
				    CCTV촬영을<br/> 원치 않습니다.<br/>
				    	<i id="cctvCheck1" class="fas fa-check-circle"></i>
				    </label>
				    <label for="cctvAgree" class="rounded" <c:if test="${vo.cctv=='Y'}"> style="background-color:orange; font-weight:bold;" </c:if>>
				    CCTV가 있어도<br/>당당히 일할 수 있습니다.<br/>
				    	<i id="cctvCheck2" class="fas fa-check-circle"></i>
					</label>
			
				<p id="cctvWarning">단, 녹화된 영상을 유출 배포하지 않는 전제</p>		
			
		</li>
   	</form>	
   <br/>
</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>

