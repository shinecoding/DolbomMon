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
		width:1000px;
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
	#imgBox{
		float:left;
		padding: 5px;
		height: 150px;
		position: absolute;
		top: 30px;
	}
	#offerBox{
		float:right;
		width: 290px;
	}
	#offerTitle{
		font-size: 1.1em;
	}
	.card-body{
		white-space: nowrap;
	
	}
</style>
<body>
<!-- -------------------상단메뉴------------- -->
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
<!-- ------------------------------------------ -->
<div class="all_wrapper" >
<div>
<button type="button" class="btn btn-warning btn-lg btn-block">어떤 일자리를 찾으세요?</button>
<button type="button" class="btn btn-light btn-lg" style="width:100%">가까운 일자리 찾기</button><br/><br/>
</div>
<div class="listPanel" style="display: block; vertical-align: inherit; background-color:white; "> 
<div id="filterbox" >
<input class="form-control" style="width:100%; type="text" placeholder="돌봄 지역을 선택해주세요" readonly>

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
  
  <div style="/* overflow: scroll hidden; */ width: 100%; height: 100px; white-space: nowrap; 
  display: inline-block; vertical-align: top;">
  <div class="btn1" role="button">실내놀이</div>
  <div class="btn1" role="button">등하원 돕기</div>
  <div class="btn1" role="button">책 읽기</div>
  <div class="btn1" role="button">야외활동</div>
  <div class="btn1" role="button">한글놀이</div>
  <div class="btn1" role="button">영어놀이</div>
  <div class="btn1" role="button">학습지도</div>
  <div class="btn1" role="button">체육놀이</div>
  <div class="btn1" role="button">간단청소</div>
  <div class="btn1" role="button">밥챙겨주기</div><br/>
  <div class="btn1" role="button">간단설거지</div>
  <div class="btn1" role="button">장기입주</div>
  <div class="btn1" role="button">단기입주</div>
  </div>
 
   <div class="wrapper1" style="display:inline">
	<div class="total" style="float:left"><br/>총 ${totalRecords}건의 일자리 찾기가 있습니다</div>
	<!-- <div class="float-right" style="float:right">후기순 -->
	<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" style="width:20%; float: right;">
	    <option selected>최신순</option>
	    <option value="1">후기순</option>
	    <option value="2">높은 시급순</option>
	    <option value="3">낮은 시급순</option>
	</select>
	<br/>

	</div>
	<br/><br/><br/>
	
	</div>
	
	<div class="row">
		<c:forEach var="vo" items="${list2}">
			<div class="col-sm-6" style="padding: 20px;">
				<div class="card">
					<div class="card-body">
						<div id="imgBox"><img src="img/ch1.PNG" class="rounded-circle"></div>
						<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 45px;"><span>0</span>명 지원</div>
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