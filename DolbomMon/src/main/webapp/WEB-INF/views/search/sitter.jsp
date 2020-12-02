<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
	.container{width:1100px;}

	img{ height:110px; width:110px;}
	
	<!-- 액션 캡슐 버튼 -->
	.btn1{
	    color: #434343;
	    padding: 10px 14px;
	    border-radius: 16px;
	    border: 1px solid #ddd;
	    margin: 5px 6px 10px 0;
	    display: inline-block;
	    cursor: pointer;
	    font-size: 13px;
	    font-weight: 400;
	    line-height: 12px;
	    text-align: center;
	    width:90px;
	    background-color:white;
	    border-color:orange;
	}
	
	#actBox{
	width: 100%; 
	white-space: nowrap; 
  	display: inline-block; 
  	vertical-align: top;
  	}
  	

	 .list-group-item {
	 	width:1000px;
	 	margin:0 auto;
	 }
	   
	   

 input[type=text]{
  width:100%;
 }
</style>
<script>
	$(function(){
		
	
	    //  $(document).on("click",".wrapper2>ul", function(){
	     //     location.href="teacherView?userid="+$(this).attr('id');   
	    //   });
	    /* 
	    function filterLoc(){
	    	  var value = document.getElementById("locFilter").value.toLowerCase();
	    	  var item = document.getElementbyClassName("wrapper2");
		for(i=0;item)
	      }*/
	    
	    $(document).on("keyup", "#locFilter", function(){
	    	var value = $(this).val().toLowerCase();
	    	$(".wrapper2>ul").filter(function(){
	    		$(this).toggle($(this).text().toLowerCase().indexOf(value)>-1);
	    	});
	    });
	    
	
		
		//========================ajax
		$("#act1").click(function(){
			var url = "/dbmon/searchAct1";
			//var params = "act=실내돕기";
			$.ajax({
				url:url,
				//data:params,
				type:'GET',
				success:function(result){
					var $result = $(result);
					var tag = "";
					
					$result.each(function(idx, tvo){
						tag = "<ul class='list-group'>";
						tag += "<li class='list-group-item'>";
						tag += "<ul class='list-group list-group-horizontal'>";
						tag += "<li class='list-group-item border-0 col-2'>";
						tag += "<img src='img/profilepic.png' class='rounded-circle'/><br/>";
						tag += "<div class='badge badge-warning badge-pill ml-3' ><span>0</span>명 지원</div>";
						tag += "</li>";
						tag += "<li class="list-group-item border-0 col-10">";
						tag += "<h6><b>${vo.username }</b></h6><h7>3분전 작성</h7><br/>";
						tag += "<h6>서울시 강남구</h6>";
						tag += "<h6>20세 | <i class='fas fa-coins mr-1'></i>희망시급 : ${vo.desired_wage} | 협의유무: ${vo.discussion}<br/>";
						tag += "<h7>돌봄가능아이 수 : ${vo.headcount}</h7><br/><br/>";
						tag += "</li>";
						tag += "</ul></li></ul>";
						
					});
					$("").html(tag);
				}, error: function(){
					console.log("리스트 받기 에러");
				}
			})
		})//에이잭스
		
		
	});//제이쿼리
</script>
</head>
<body>
<!-- -------------------상단메뉴------------- -->
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
<!-- --------------------------- -->

<div class="container">


<button type="button" class="btn btn-warning btn-lg btn-block">어떤 돌봄몬을 찾으세요?</button>
<button type="button" class="btn btn-warning btn-lg btn-block"  onclick="location.href='teacherSearchMap?userid=${vo.userid}'">가까운 돌봄몬 찾기</button>

<input type="text" class="form-control border-warning mt-2" id="locFilter" onkeyup="filterLoc()" placeholder="돌봄 지역을 입력해주세요">

<form class="form-inline">
  <label class="mt-2" for="inlineFormCustomSelectPref"></label>
  <select class="custom-select border-warning mt-2 mb-2" id="inlineFormCustomSelectPref" style="width:100%;">
    <option selected>돌봄 유형을 선택하시면, 맞춤시터를 보여드려요</option>
    <option value="1">2~10세 정기 돌봄</option>
    <option value="2">신생아/영아 정기 돌봄</option>
    <option value="3">긴급 돌봄</option>
    <option value="4">모든 돌봄 유형 보기</option>
  </select>
 </form>
 
<!-- ------------------------------- -->
  

   <div id="actBox">
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1">실내놀이</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act2">등하원 돕기</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act3">책 읽기</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act4">야외활동</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act5">한글놀이</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act6">영어놀이</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act7">학습지도</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act8">체육놀이</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act9">간단 청소</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act10">밥 챙겨주기</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act11">간단 설거지</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act12">장기입주</button>
	  <button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" id="act13">단기입주</button>
  </div>
 
<!-- ------------------------------- -->
 
   <div class="row d-inline-block m-2">
	<div class="float-left"> 총 게시물 수 : ${totalRecord} </div>
	<div class="float-right">후기순
		<i class="fas fa-arrow-circle-down"></i>
	</div>
	</div>
	
<!-- ------------------------------- -->
	
	<div class="wrapper2">
	<c:forEach var="vo" items="${list}">
	<ul class="list-group" id="${vo.userid}" onclick="location.href='teacherView?userid=${vo.userid}'">
		<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
				<li class="list-group-item border-0 col-2">
						<img src=<c:if test="${vo.pic==null}">"img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">"upload/${vo.pic}"</c:if> class="rounded-circle"/><br/>
						<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
				</li>
				<li class="list-group-item border-0 col-10">
						<span class="fa-stack fa-2x float-right">
							<i class="far fa-circle fa-stack-2x"></i>
							<i class="far fa-heart fa-stack-1x"></i>
						</span>
						<h6><b>${vo.username.substring(0,1)}O${vo.username.substring(2)} </b><span class="ml-2" style="font-size:0.8em">
							<fmt:parseNumber integerOnly="true" var="edit_year" value="${vo.last_edit/525600}"/>
							<fmt:parseNumber integerOnly="true" var="edit_month" value="${vo.last_edit/43200}"/>
							<fmt:parseNumber integerOnly="true" var="edit_day" value="${vo.last_edit/1440}"/>
							<fmt:parseNumber integerOnly="true" var="edit_hour" value="${vo.last_edit/60}"/>					
						<c:choose>
							<c:when test="${vo.last_edit>525600}">${vo.last_edit/525600}년</c:when>
							<c:when test="${vo.last_edit>43200}">${edit_month}달</c:when>
							<c:when test="${vo.last_edit>1440}">${edit_day}일</c:when>
							<c:when test="${vo.last_edit>60}">${edit_hour}시간</c:when>
							<c:otherwise>${vo.last_edit}분</c:otherwise>
						</c:choose>
			
						
						</span></h6>
						
						<h6 class="loc">${vo.area1}</h6>
						<h6>${vo.birth}세 | <i class="fas fa-coins mr-1"></i>희망시급 : ${vo.desired_wage}원 | 협의유무: ${vo.discussion}</h6>
						<h6>돌봄가능아이 수 : ${vo.headcount}명</h6>
				</li>
				</ul>

			</li>
		</ul>
		<hr/>
		</c:forEach> 
	</div>
	
	


	
	<br/><br/>




 </div>




</div><!-- container -->
<jsp:include page="../footer.jsp"/>
</body>
</html>