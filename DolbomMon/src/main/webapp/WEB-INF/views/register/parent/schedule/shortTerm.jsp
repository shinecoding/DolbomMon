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
</head>
<style>
	
	.container{width:700px; padding:0px; text-align:center;}
	h4{margin:40px 0;}
	
	/* ============================  달력 출력  ===============================*/
	#calendarDiv{display:inline-block; width:50%; overflow:hidden; height:auto; text-align:center;}
	
	#calHeader{display:inline-block; width:100%; overflow:hidden; height:30px; margin:0; padding:0;}
	#calHeader li:first-child{width:20%; float:left; list-style:none; text-align:right;}
	#calHeader li{width:60%; height:100%; float:left; list-style:none; margin:0;}
	#calHeader li:last-child{width:20%; float:left; list-style:none; text-align:left;}
	#calHeader img{width:30px; height:30px;}
	
	#calList input[type=checkbox]{display:none;}
	#calList{display:inline-block; width:100%; overflow:hidden; height:auto; margin:0; padding:0;}
	#calList li{width:12%; float:left; list-style:none; margin:1.5% 1%;}	
	#calList label{width:100%; height:100%; margin:0; border-radius:50%;}
	/* ============================  달력 출력  ===============================*/
	
</style>
<script>

    var today = new Date(); // 오늘 날짜
    var date = new Date();
 
    function prevMonth() {  //이전 달을 today에 값을 저장
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        getCalendar(); 
        console.log("왼쪽");
    }
    
    function nextMonth() { //다음 달을 today에 저장
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        getCalendar();
        console.log("오른쪽");
    }
    
    function getCalendar()
	{	
        var getFirstDay = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var getLastDay = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var calList = document.getElementById("calList"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) {// 달력 넘기기 버튼
            prev.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        } else if(today.getMonth()+1==1) {//  1월 일 때
	        prev.innerHTML="12월";
	        next.innerHTML=(today.getMonth()+2)+"월";
	    } else {//   12월 일 때
            prev.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
        // 달력찍기 시작
       	var calTag = "";
       	calTag += "<li>일</li>";
       	calTag += "<li>월</li>";
       	calTag += "<li>화</li>";
       	calTag += "<li>수</li>";
       	calTag += "<li>목</li>";
       	calTag += "<li>금</li>";
      	calTag += "<li>토</li>";
       	var cnt = 0;
       
  		// 1일 시작칸 찾기, 공백찍기
 		for(i = 0; i < getFirstDay.getDay(); i++) {
   		    calTag += "<li>&nbsp</li>";
      		cnt = cnt + 1;
   		}
        
       	// 달력 출력
		for(i = 1; i <= getLastDay.getDate(); i++) {// 1일부터 마지막 일까지
           	cnt = cnt + 1;
           	if(cnt % 7 == 1) {
            	calTag += "<li style='color:pink'><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();' ><input type='checkbox' id='d"+i+"' >"+i+"</label></li>";//일요일에 색
           	} else if(cnt % 7 == 0) { 
           		calTag += "<li style='color:lightblue'><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input type='checkbox' id='d"+i+"' >"+i+"</label></li>";//토요일에 색
          	} else if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) {
                calTag += "<li><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input type='checkbox' checked='checked' id='d"+i+"' >"+i+"</label></li>"; //오늘날짜색
            } else {
	            calTag += "<li><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input type='checkbox' id='d"+i+"' >"+i+"</label></li>";
            }
       	}
    	calList.innerHTML = calTag;
    }
    
	$(document).ready(function(){
		getCalendar();
		selectedDate();
	});
	
	$(function(){
		
		
		
	});
	
	function selectedDate(){
		console.log("들어옴");
		for(var i=1; i<=31; i++){
			if($("input[id=d"+i+"]").is(":checked")){
				$("label[for=d"+i+"]").css("background-color", "#ff5400");
			}else{
				$("label[for=d"+i+"]").css("background-color", "white");
			}
		}
	}
	
</script>
<body >
	<div class="container">
		<div id="calendarDiv">
	        <ul id="calHeader">
	            <li><img src="<%=request.getContextPath()%>/icon/leftBtn.png" onclick="prevMonth()" id="prev" style="cursor:pointer;"/></li>
	            <li id="yearmonth"></li>
	            <li><img src="<%=request.getContextPath()%>/icon/rightBtn.png" onclick="nextMonth()" id="next" style="cursor:pointer;"/></li>
	        </ul>
	        <ul id="calList">
	        </ul>
	    </div>
	</div>
</body>
</html>