<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	* {
		padding:0; list-style-type:none; box-sizing:border-box; 
		font-family: Noto Sans KR,sans-serif!important;
	}	
	#all{
		margin:0 auto; background-color:white;	
	}
	.all_wrapper{
		margin-top:70px;
		width:1100px;
		background-color:white;
		margin:0 auto;
	}
	img{ height:110px; width:110px;}
	
	.list
	
    div{
        margin:0 auto;
        width:600px;
    }
    .form-control{
    	margin:0 auto;
    	background-color:white;
    }
    html {
	    color: white;
	    font-weight: 100;
	    font-size: 1em;
	    line-height: 1.375;   
	}
	.btn1{
	    color: #434343;
	    padding: 10px 14px;
	    border-radius: 16px;
	    border: 1px solid gold;
	    margin: 5px 6px 10px 0;
	    display: inline-block;
	    cursor: pointer;
	    font-size: 13px;
	    font-weight: 400;
	    line-height: 12px;
	    text-align: center;
	    width:90px;
	}
	
	 .list-group-item {
	 	width:1000px;
	 
	 }

	.listPanel{
		color: #222;
	    font-weight: 100;
	    font-size: 1em;
	    line-height: 1.375;
	}
	.review_rate {
	    display: flex;
	    font-size: 12px;
	    font-weight: 500;
	    text-align: left;
	    color: white;
}
	<!-- -->
	.imgBox{
		float:left;
		padding: 15px;
		height: 150px;
		position: absolute;
		top: 20px;
	}
	.offerBox{
		float:right;
		width: 310px;
		padding: 3px;
	}
	.offerTitle{
		font-size: 1.1em;
	}
	.card-body{
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#btnBox{
		margin-top: 10px;
		margin-bottom: -10px;
		width: 100%;
		height: 50px;
		white-space: nowrap;
		display: inline-block;
		vertical-align: top;
	}
</style>
<script>
	$(function(){
		$(document).on("click", "#btnBox>button", function(){
	    	var activity_type = $(this).text();
	    	console.log(activity_type);
	    	var url = "/dbmon/careAct";
			var params = "activity_type="+activity_type;
			console.log("파람="+params);
			$.ajax({
				url:url,
				data:params,
				type:'GET',
				success:function(result){
					console.log("갯수="+result.length);
					$("#Tcnt").text(result.length);
					var $result = $(result);
					var tag = "";
					
					$result.each(function(idx, vo){
						tag += '<div class="col-sm-6" style="padding: 20px;">';
						tag += '<div class="card">';
						tag += '<div class="card-body">';
						tag += '<div class="imgBox"><img src=';
						
						tag +='"img/ch1.PNG" class="rounded-circle"></div>';
					
						tag += '<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 53px;"><span>';
						
						tag += ' 명 지원</div>';
						tag += '<div class="offerBox" style="width: 310px";>';
						tag += '<span class="card-title" class="offerTitle" style="line-height: 2em;"><b>'+vo.title+'</b></span>';
						tag += '<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. '+vo.job_board_no +' | '+ vo.userid+'</span>';
						tag += '<br/><span><b>신생아 1명, 유아 1명</b> | '+vo.writedate+'</span>';
						tag += '<br/><span>'+vo.care_addr+'</span>';
						tag += '<br/><span>12/12 시작</span>';
						tag += '<br/><span style="color: orange;">희망시급 '+vo.wish_wage+'원';
						if(vo.consultation=="Y"){
							tag += ' | <b>협의가능</b></span></p>';
						}else{
							tag += '</span></p>';
						}
							tag += '</div></div>';
							tag += '<div class="card-footer btn" onclick="location.href=parentView?no='+vo.job_board_no+'">자세히 보기</div>';	
							tag += '</div>';
							tag += '</div>';
							tag += '</div>';
					});
					tag += "";
					
					$("#cardBox").html(tag);
					
				}, error: function(){
					console.log("리스트 받기 에러");
					}

				});
				
	    });//ajax
		
		
		
		
		
		
		
		
		
		
		
		
	});





</script>






<body>
<!-- -------------------상단메뉴------------- -->
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
<!-- ------------------------------------------ -->
<div class="all_wrapper" >
<div>
<button type="button" class="btn btn-warning btn-lg btn-block" style="width: 100%; margin-bottom: -20px;">가까운 일자리 찾기</button><br/>
</div>
<div class="listPanel" style="display: block; vertical-align: inherit; background-color:white; "> 
<div id="filterbox" >
	<input type="text" class="form-control border-warning mt-2" id="locFilter" placeholder="#돌봄 지역을 입력해주세요">
	<form class="form-inline">
	<label class="my-1 mr-2" for="inlineFormCustomSelectPref"></label>
	<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" style="width:100%;">
	<option selected>돌봄 유형을 선택하시면, 맞춤 일자리를 보여드려요</option>
	<option value="1">2~10세 정기 돌봄</option>
	<option value="2">신생아/영아 정기 돌봄</option>
	<option value="3">긴급 돌봄</option>
	<option value="4">모든 돌봄 유형 보기</option>
	</select>
	</form>
</div>
	<div id="btnBox">
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act1" >실내놀이</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act2">등하원 돕기</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act3">책 읽기</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act4">야외활동</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act5">한글놀이</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act6">영어놀이</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act7">학습지도</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act8">체육놀이</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act9">간단 청소</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act10">밥 챙겨주기</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act11">간단 설거지</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act12">장기입주</button>
		<button class="btn btn-outline-warning btn-sm rounded-pill pt-1 pb-1 px-2" id="act13">단기입주</button>
	</div>
 
	<div class="total" style="float: left; margin: 0px; margin-top: -5px; margin-left: 5px;"><br/>총 <b><span id="Tcnt">${totalRecords}</span></b>건의 일자리 찾기가 있습니다</div>
	<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" style="width:20%; float: right; margin: 0px;">
	    <option selected>최신순</option>
	    <option value="1">후기순</option>
	    <option value="2">높은 시급순</option>
	    <option value="3">낮은 시급순</option>
	</select>
	
	</div>
	<br/>
	<br/>
	<div class="row" id="cardBox">
		<c:forEach var="vo" items="${list2}">
			<div class="col-sm-6" style="padding: 20px;">
				<div class="card">
					<div class="card-body">
						<div class="imgBox"><img src="img/ch1.PNG" class="rounded-circle"></div>
						<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 53px;"><span>0</span>명 지원</div>
						<div class="offerBox" >
							<span class="card-title" class="offerTitle" style="line-height: 2em;"><b>충북에서 돌봄몬을 찾습니다</b></span>
							<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. ${vo.job_board_no} | ${vo.userid }</span>
							<br/><span><b>신생아 1명, 유아 1명</b> | ${vo.writedate }</span>
							<br/><span>${vo.care_addr } </span>
							<br/><span>12/12 시작</span>
							<br/><span style="color: orange;">희망시급 ${vo.wish_wage }원
							
							
							<c:if test="${vo.consultation=='Y'}"> | <b>협의가능</b></c:if></span>
							
							</p>
						</div>
					</div>
				<div class="card-footer btn" onclick="location.href='parentView?no=${vo.job_board_no}'">자세히 보기</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>
<hr/>
<jsp:include page="../footer.jsp"/>
</body>
</html>