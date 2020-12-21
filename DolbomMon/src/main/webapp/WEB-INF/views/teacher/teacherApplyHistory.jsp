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
<style>
	
	.container{
		width:800px;
		min-height: 530px;
	}

	img{ height:110px; width:110px;}
	
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
	    right: -630px;
	}
	
	.msg{
		position: relative;
	    margin: 0 5px;
	    top: -28px;
	    right: -546px;
	}
</style>
<script>
	$(function(){
		var popupWidth = 1060;
		var popupHeight = 596;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		$(document).on("click",".viewContract",function(){
			popupWidth = 1060;
			popupHeight = 1600;
			var origin_no = $(this).attr('id');
			window.open('/dbmon/contractView?origin_no='+origin_no, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		});
	})
			
		var popupWidth = 1060;
		var popupHeight = 596;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		function contractOpen(no, id){
			popupWidth = 1060;
			popupHeight = 1600;
			window.open('/dbmon/contractView?origin_no='+no+'&teacherid='+id, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		}
</script>

</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
</div>
<div class="container">
	<div id="title">
   		<div id="titlefont">내 구직현황</div>
   		<nav>
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item">
				<a class="nav-link active px-5" id="nav-apply-tab" href="#nav-apply" data-toggle="tab" role="tab">
			내가 지원한</a>
			</li>
			<li class="nav-item">
				<a class="nav-link px-5" id="nav-inbox-tab" href="#nav-inbox" data-toggle="tab" role="tab">
				내게 신청한</a>
			</li>
		</ul>
	</nav>	
   		
	</div>

	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-apply" role="tabpanel">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
				<div class="all_wrapper" >
					<div class="row">
						<c:forEach var="list" items="${list}" >
							<div class="col-sm-12" style="padding: 20px;">
								<div class="card">
									<div class="card-body">
										<div id="imgBox"><img <c:if test="${list.pic==null || list.pic=='' }" >src="img/profilepic.png" </c:if><c:if test="${list.pic!=null || list.pic != '' }" >src="upload/${list.pic}"</c:if>class="rounded-circle" style="height:110px; width:110px;"/></div>
										<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 53px;"><span>${list.tcnt }</span>명 지원</div>
										<div id="offerBox" >
											<span class="card-title" id="offerTitle" style="line-height: 2em;"><b>${list.title }</b></span>
											<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. ${list.job_board_no} | ${list.userid }</span>
											<br/><span style="float:left;">자녀 정보 | </span><span id="${list.job_board_no }" ></span> 
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
																$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}else if(child_age2 == "유아"){
																$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}else if(child_age2 == "영아"){
																$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}else if(child_age2 == "신생아"){
																$("#${list.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}
														}
													});
												</script>
											<br/>작성날짜 | <span style="color:orange;">${list.writedate }</span>
											<br/>돌봄 장소 | <span style="color:orange;">${list.care_addr } </span>
											<br/><span style="color: orange;">희망시급 ${list.wish_wage }원</span>
											</p>
										</div>
										<div style="height:1px;">
											<c:if test="${list.cont_no != 0}" ><input class="btn btn-outline-warning viewContract" type="button" value="계약서 확인" id="${list.job_board_no}" style="margin:0 5px;" /></c:if>
											<c:if test="${list.cont_no == 0}" ><span style="float:right;color:orange;">부모님의 답변을 기다리는 중입니다."</span></c:if>
										</div>
										<div style="height:1px;">
											<c:if test="${list.payment != 'Y' }" >
												<input class="btn btn-outline-warning cancel" type="button" value="지원 취소" id="cancel" style="margin:0 5px;" />
											</c:if>
										</div>
									</div>
								<div class="card-footer btn" onclick="location.href='parentView?no=${list.job_board_no}'">자세히 보기</div>
								</div>
							</div>
						</c:forEach>
					</div>
					</div>
			</ul>
		</div>
		<div class="tab-pane fade" id="nav-inbox" role="tabpanel">
		<ul class="list-group list-group-flush">
				<li class="list-group-item">
				<div class="all_wrapper" >
					<div class="row">
						<c:forEach var="list2" items="${list2}">
							<div class="col-sm-12" style="padding: 20px;">
								<div class="card">
									<div class="card-body">
										<div id="imgBox"><img <c:if test="${list2.pic==null || list2.pic=='' }" >src="img/profilepic.png" </c:if><c:if test="${list2.pic!=null || list2.pic != '' }" >src="upload/${list2.pic}"</c:if>class="rounded-circle" style="height:110px; width:110px;"/></div>
										<div id="offerBox" >
											<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. ${list2.job_board_no} | ${list2.userid }</span>
											<br/><span style="float:left;">자녀 정보 | </span><span id="${list2.job_board_no }" ></span> 
												<script>
													$(function(){
														var cb = '${list2.child_birth}';
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
																$("#${list2.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}else if(child_age2 == "유아"){
																$("#${list2.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}else if(child_age2 == "영아"){
																$("#${list2.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}else if(child_age2 == "신생아"){
																$("#${list2.job_board_no}").append('<div style="float:left; margin-right:5px;"><b style="color:orange;"> '+child_age2+"-"+child_age1+" "+'</b></div>');
															}
														}
													});
												</script>
											<br/>돌봄 장소 | <span style="color:orange;">${list2.care_addr } </span>
											<br/>신청날짜 | <span style="color:orange;">${list2.writedate }</span>
											<br/>희망시급 | <span style="color: orange;">${list2.wish_wage }원</span>
										</div>
										<div><input class="btn btn-outline-warning cancel" type="button" value="거절하기" id="cancel" style="margin:0 10px;" /></div>
										<div style="height:1px;">
											<c:if test="${list2.agree=='T'}">
												<span style="color:orange" class="msg" id="msg">제안 수락 대기중입니다.</span>
											</c:if>
											<c:if test="${list2.agree=='Y' }">
												<span style="color:orange" class="msg" id="msg">제안을 수락하였습니다.</span>
											</c:if>
											<c:if test="${list2.agree=='N' }">
												<span style="color:red" class="msg" id="msg">제안을 거절하였습니다.</span>
											</c:if>
											<!-- <input class="btn btn-warning cancel" type="button" value="거절" id="cancel" style="margin:0 5px;" /> -->
										</div>
									</div>
								<c:if test="${list2.agree!='N' }">
								<div class="card-footer btn" onclick="contractOpen('${list2.job_board_no}', '${list2.teacherid }')">제안서 보기</div>
								</c:if>
								<c:if test="${list2.agree=='N' }">
								<div class="card-footer btn" style="">거절한 제안서입니다.</div>
								</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
					</div>
				</li>
			</ul>
		
		
		
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../footer.jsp"/>