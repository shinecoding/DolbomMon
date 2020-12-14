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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	
	.container{width:800px;
	font-family: 'Jua', sans-serif;}
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
</script>

</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
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
						<c:forEach var="vo" items="${list2}">
							<div class="col-sm-12" style="padding: 20px;">
								<div class="card">
									<div class="card-body">
										<div id="imgBox"><img src="img/ch1.PNG" class="rounded-circle"></div>
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
											<input class="btn btn-warning viewContract" type="button" value="계약서 확인" id="${vo.job_board_no}" style="margin:0 5px;" />
										</div>
										<div style="height:1px;">
											<input class="btn btn-warning cancel" type="button" value="지원 취소" id="cancel" style="margin:0 5px;" />
										</div>
									</div>
								<div class="card-footer btn" onclick="location.href='parentView?no=${vo.job_board_no}'">자세히 보기</div>
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
						<c:forEach var="vo" items="${list3}">
							<div class="col-sm-12" style="padding: 20px;">
								<div class="card">
									<div class="card-body">
										<div id="imgBox"><img src="img/ch1.PNG" class="rounded-circle"></div>
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
											<input class="btn btn-warning cancel" type="button" value="거절" id="cancel" style="margin:0 5px;" />
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
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>