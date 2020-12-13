<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%@ include file="/WEB-INF/views/top.jsp" %>
<style>
	.container{width:800px;}
	img { width: 50px; height:50px;}
	
	#title{
		margin:20px 5px;
		display:block;
		width:800px;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	.nav-item>a {
	color:black;
	}
	.fa-check-circle, .fa-times-circle{
		font-size: 50px;
		margin: 10px;
		color:orange;
	}
	.card-body{
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#imgBox{
		float:left;
		padding: 15px;
		height: 150px;
		position: absolute;
		top: 20px;
	}
	#offerBox{
	    position: relative;
	    width: 310px;
	    padding: 3px;
	    left: 180px;
	}
	#offerTitle{
		font-size: 1.1em;
	}
	.all_wrapper{
		margin-top:70px;
		width:770px;
		background-color:white;
		margin:0 auto;
	}
	.viewContract{
		position: relative;
	    margin: 0 5px;
	    top: -40px;
	    right: -510px;
	}
	.cancel{
		position: relative;
	    margin: 0 5px;
	    top: -41px;
	    right: -620px;
	}
</style>
</head>
<body>
<div class="container">
	<div id="title">
   		<div id="titlefont">내 구인현황</div>
	</div>
	<nav>
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item">
				<a class="nav-link active px-5" id="nav-apply-tab" href="#nav-apply" data-toggle="tab" role="tab">
			내가 지원한</a>
			</li>
			<li class="nav-item">
				<a class="nav-link px-5" id="nav-inbox-tab" href="#nav-inbox" data-toggle="tab" role="tab">
				내가 작성한 글 보기</a>
			</li>
		</ul>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-apply" role="tabpanel">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<div class="all_wrapper" >
					<div class="row">
						<c:forEach var="vo" items="${list3}">
							<div style="padding:0px 10px; width:765px">
								<div class="card">
									<div class="card-body">
										<div id="imgBox"><img src="img/ch1.PNG" class="rounded-circle" style="height:110px; width:110px;"></div>
										<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 53px;"><span>0</span>명 지원</div>
										<div id="offerBox" >
											<span class="card-title" id="offerTitle" style="line-height: 2em;"><b>충북에서 돌봄몬을 찾습니다</b></span>
											<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. ${vo.job_board_no} | ${vo.userid }</span>
											<br/><span><b>신생아 1명, 유아 1명</b> | ${vo.writedate }</span>
											<br/><span>${vo.care_addr } </span>
											<br/><span>12/12 시작</span>
											<br/><span style="color: orange;">희망시급 ${vo.wish_wage }원
											<c:if test="${vo.consultation=='Y'}"> | <b>협의가능</b></c:if></span>
											</p>
										</div>
										<div style="height:1px;">
											<input class="btn btn-warning cancel" type="button" value="취소하기" id="cancel" style="margin:0 5px;" />
										</div>
									</div>
								<div class="card-footer btn" onclick="location.href='parentView?no=${vo.job_board_no}'">자세히 보기</div>
								</div>
							</div>
						</c:forEach>
					</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="tab-pane fade" id="nav-inbox" role="tabpanel">
			<ul class="list-group list-group-flush">
				<c:forEach var="list" items="${list }">
					<li class="list-group-item">
						<div class="row">
							<div class="col-1">
									<img <c:if test="${list.pic==null || list.pic=='' }" >src="img/profilepic.png" </c:if><c:if test="${list.pic!=null || list.pic != '' }" >src="upload/${list.pic}"</c:if>class="rounded-circle"/>
								</div>	
							<div class="col-6" onclick="location.href='parentView?no=${list.job_board_no}'" style="cursor:pointer;">
									<b>글 번호 ${list.job_board_no }</b><i class="fas fa-search ml-1"></i><br/>
									희망시급: ${list.wish_wage }원<br/>
									신청시간: ${list.writedate }<br/>
									돌봄장소: ${list.care_addr }<br/>
									자녀정보
									<div id="${list.job_board_no }" ></div>
									<script>
										
										$(function(){
											var cb = '${list.child_birth}';
											var child_age1;
											var child_age2;
											
											function getAge(a){
												var today = new Date();
												var birthDay = new Date(a);
												
												var time = Math.floor((today - birthDay) / 86400000);
												var year = Math.floor(time/365)+1;
												var month = Math.ceil(time/30);
												if(month >= 96 && year < 14){
													console.log("초딩"+year+"세");
													child_age2 = "초등학생";
													child_age1 = year+"세";
												}else if(month<96 && month>=37){
													console.log("유아"+year+"세");
													child_age2 = "유아";
													child_age1 = year+"세";
												}else if(month<=36 && month>=7){
													console.log("영아"+month+"개월");
													child_age2 = "영아";
													child_age1 = month + "개월";
												}else{
													console.log("신생아"+month+"개월");
													child_age2 = "신생아";
													child_age1 = month + "개월";
												}
											}
											////////////////////자녀 정보 /////////////////////
											var cbArr = cb.split(",");
											for(var i=0; i<cbArr.length;i++){
												console.log("cbArr => " + cbArr[i]);
												var childYMD = cbArr[i].split("-");
												var child_birth = childYMD[0] + "," + childYMD[1] + "," +childYMD[2];
												console.log("child_birth => " + child_birth);
												getAge(child_birth);
												
												if(child_age2 == "초등학생"){
													$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><img src="icon/profile-child.png" style="width:40px; height:40px;"/>'+child_age1+'</div>');
												}else if(child_age2 == "유아"){
													$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><img src="icon/profile-elementary.png" style="width:40px; height:40px;"/>'+child_age1+'</div>');
												}else if(child_age2 == "영아"){
													$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><img src="icon/profile-infant.png" style="width:40px; height:40px; "/>'+child_age1+'</div>');
												}else if(child_age2 == "신생아"){
													$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><img src="icon/profile-newborn.png" style="width:40px; height:40px;"/>'+child_age1+'</div>');
												}
											}
										});
									</script>
							</div>
							<c:if test="${list.tcnt > 0}">
							<div class="col-5" style="background-color:orange; opacity:0.5; cursor:pointer;" onclick="location.href='parentView?no=${list.job_board_no}'" >
									${list.tcnt }명의 선생님이 답변을 기다리고 있습니다.
							</div>	
							</c:if>
							<c:if test="${list.tcnt == 0}">
								<div class="col-5">아직 지원한 선생님이 없습니다.
									<input type="button" class="btn btn-warning" value="삭제하기"/>
									<input type="button" class="btn btn-warning" value="수정하기"/>
								</div>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div style="margin-bottom:200px;"></div>
	</div>
</div>
</body>
</html>