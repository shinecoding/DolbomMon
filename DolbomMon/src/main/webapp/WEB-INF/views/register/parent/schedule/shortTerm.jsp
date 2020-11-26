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
	
	.container{width:200px; padding:0px; text-align:center;}
	h4{margin:40px 0;}
	
	/* ============================  달력 출력  ===============================*/
	#calendarDiv{display:inline-block; width:100%; overflow:hidden; height:auto; text-align:center;}
	
	#calHeader{background-color:#ff5400; color:white; }
	
	#calYM{display:inline-block; width:100%; overflow:hidden; height:30px; margin:0; padding:0;}
	#calYM li:first-child{width:20%; float:left; list-style:none; text-align:right;}
	#calYM li:nth-of-type(2){width:60%; height:30px; line-height:30px; font-size:20px; float:left; list-style:none; margin:0;}
	#calYM li:last-child{width:20%; float:left; list-style:none; text-align:left;}
	#calYM img{width:30px; height:30px;}
	
	#calList input[name=cr7]{display:none;}
	#calList{display:inline-block; width:100%; overflow:hidden; height:auto; margin:0; padding:0;}
	#calList li{width:12%; float:left; list-style:none; margin:1.5% 1%;}	
	#calList label{width:100%; height:100%; margin:0; border-radius:50%;}
	
	#calendarDiv input[type=button]{width:20%; float:right; margin-right:3%; border:none; background-color:white; color:#ff5400;}
	
	
	/* ============================  달력 출력  ===============================*/
	
</style>
<script>

    var today = new Date();
    var date = new Date(today.getFullYear(), today.getMonth(), today.getDate()); // 지금날짜로부터 5일 후
 	var firstDate = date;
    function prevMonth() {  //이전 달을 today에 값을 저장
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        getCalendar(); 
        selectedDate()
    }
    
    function nextMonth() { //다음 달을 today에 저장
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        getCalendar();
        selectedDate()
    }
    
    function getCalendar() {	
        var getFirstDay = new Date(today.getFullYear(), today.getMonth(), 1); 
        var getLastDay = new Date(today.getFullYear(), today.getMonth() + 1, 0); 
        var calHeader = document.getElementById("calHeader"); // 현재 년 월 일을 찍을 Div객체
        var calList = document.getElementById("calList"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  바뀐 년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(firstDate.getMonth()==today.getMonth()){
        	//
        }
        
        if(today.getMonth()+1==12) {// 달력 넘기기 버튼
            prev.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        } else if(today.getMonth()+1==1) {//  1월 일 때
	        prev.innerHTML="12월";
	        next.innerHTML=(today.getMonth()+2)+"월";
	    } else if(today.getMonth()+1==12){//   12월 일 때
            prev.innerHTML=(today.getMonth())+"월"; //-1
            next.innerHTML=(today.getMonth()+2)+"월";
        } else if(today.getMonth()==date.getMonth()){
        	prev.innerHTML=(today.getMonth()+1)+"월";
        	next.innerHTML=(today.getMonth()+2)+"월";
        }
        console.log("today.getMonth()+1 =>" + (today.getMonth()+1));
        console.log("today.getFullYear => " + today.getFullYear());
        console.log("today.getDate => " + today.getDate());
        
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
		/* for(i = 1; i <= getLastDay.getDate(); i++) {// 1일부터 마지막 일까지
           	cnt = cnt + 1;
           	if(cnt % 7 == 1) {
            	calTag += "<li style='color:pink'><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();' ><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";//일요일
           	} else if(cnt % 7 == 0) { 
           		calTag += "<li style='color:lightblue'><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";//토요일 
          	} else if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) {
                calTag += "<li><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input name='cr7' type='radio' checked='checked' id='d"+i+"' >"+i+"</label></li>"; //오늘날짜
                nowDay = i;
            } else {
	            calTag += "<li><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";
            }
       	} */
       	var nowDay = 0;
		for(i = 1; i <= getLastDay.getDate(); i++) {
			cnt = cnt + 1;
			if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i<date.getDate()){
	       		calTag += "<li style='color:#ccc'><label for='d"+i+"' ><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";
	       	}else{
	       		if(cnt % 7 == 1) {
	            	calTag += "<li style='color:pink'><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();' ><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";//일요일
	           	} else if(cnt % 7 == 0) { 
	           		calTag += "<li style='color:lightblue'><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";//토요일 
	          	} else if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) {
	                calTag += "<li><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input name='cr7' type='radio' checked='checked' id='d"+i+"' >"+i+"</label></li>"; //오늘날짜
	                nowDay = i;
	            } else {
		            calTag += "<li><label for='d"+i+"' style='cursor:pointer;' onclick='selectedDate();'><input name='cr7' type='radio' id='d"+i+"' >"+i+"</label></li>";
	            }
	       	}
		}
       	
    	calList.innerHTML = calTag;
    	
    	
    	
    	var tag = today.getFullYear()+"년, "+(today.getMonth()+1)+"월 "+nowDay+"일";
    	calHeader.innerHTML = tag;
    } // getCalendar
    
	$(document).ready(function(){
		getCalendar();
		selectedDate();
		
	});
	$(function(){
		
	});
	
	function selectedDate(){
		
		// 체크되어있는 버튼의 라벨 색상 변경
		for(var i=1; i<=31; i++){
			var fontColor = $("label[for=d"+i+"]").parent().css("color");
			if($("input[id=d"+i+"]").is(":checked")){
				$("label[for=d"+i+"]").css("background-color", "#ff5400").css("color", "white");
				var tag = today.getFullYear()+"년, "+(today.getMonth()+1)+"월 "+i+"일";
		    	calHeader.innerHTML = tag;
			}else{
				$("label[for=d"+i+"]").css("background-color", "white").css("color", fontColor);
			}
		}
	}
	
</script>
<body >
	<div class="container">
		
		<div id="calendarDiv">
			<div id="calHeader">
				
			</div>
	        <ul id="calYM">
	            <li><img src="<%=request.getContextPath()%>/icon/leftBtn.png" onclick="prevMonth()" id="prev" style="cursor:pointer;"/></li>
	            <li id="yearmonth"></li>
	            <li><img src="<%=request.getContextPath()%>/icon/rightBtn.png" onclick="nextMonth()" id="next" style="cursor:pointer;"/></li>
	        </ul>
	        <ul id="calList">
	        </ul>
	        <input type="button" id="okBtn" value="확인"/>
	        <input type="button" id="cancleBtn" value="취소"/>
	    </div>
	</div>
</body>
</html>