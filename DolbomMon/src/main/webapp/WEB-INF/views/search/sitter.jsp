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
<style>
	* {
		margin:0; padding:0; list-style-type:none; box-sizing:border-box; 
		font-family: Noto Sans KR,sans-serif!important;
	}

	#all{
		margin:0 auto;
		
	}
	.all_wrapper{
		margin-top:0;
		width:700px;
		background-color:#f0f0f0;
	}
	img{ height:70px; width:70px;}
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
	    color: #222;
	    font-weight: 100;
	    font-size: 1em;
	    line-height: 1.375;
	    
	}
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
	}
	
	 .list-group-item {
	 	width:600px;
	 }
	   
   /* color: #222;
    font-weight: 100;
    font-size: 1em;
    line-height: 1.375;*/

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
    color: rgb(74, 74, 74);
}
 
</style>

<!-- -------------------상단메뉴------------- -->
<jsp:include page="../top.jsp"/>
<!-- ------------------------------------------ -->
<body>

<div class="all_wrapper">
<div class="listPanel" style="display: block; vertical-align: inherit; background-color:#f0f0f0;"> 
<div id="filterbox" >
<input class="form-control" style="width:100%; type="text" placeholder="돌봄 지역을 선택해주세요" readonly>
<form class="form-inline">
  <label class="my-1 mr-2" for="inlineFormCustomSelectPref"></label>
  <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" style="width:100%;">
    <option selected>돌봄 유형을 선택하시면, 맞춤시터를 보여드려요</option>
    <option value="1">2~10세 정기 돌봄</option>
    <option value="2">신생아/영아 정기 돌봄</option>
    <option value="3">긴급 돌봄</option>
    <option value="4">모든 돌봄 유형 보기</option>
  </select>
  </form>
  </div>
  
  <div style="overflow: scroll hidden; width: 100%; height: 50px; white-space: nowrap; 
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
  <div class="btn1" role="button">밥챙겨주기</div>
  <div class="btn1" role="button">간단설거지</div>
  <div class="btn1" role="button">장기입주</div>
  <div class="btn1" role="button">단기입주</div>
  </div>
 
   
   <div class="wrapper1" style="display:inline">
	<div class="total" style="float:left"> 총 82 명 </div>
	<div class="float-right" style="float:right">후기순
	<svg class="arrow-down-square-fill" width="1em" height="1em" viewBox="0 0 16 16"  fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 	 <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
	</svg>
	</div>
	<br/><br/><br/>
	</div>
<div class="wrapper2"><a href="/parents/parentView"></a>
	<ul class="list-group">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				<h6><b>이ㅇ기</b> | 3분전</h6>
				<h6>서울시 마포구 백범로</h6>
				<h7>21세| 희망시급 100000원</h7>
				<div class="review_rate" style="line-height: 1.375;">후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>
</div>
	<hr/>
	<br/>
<div class="wrapper2"><a href="/parents/parentView"></a>
	<ul class="list-group">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				<h6><b>최ㅇ은</b> | 3분전</h6>
				<h6>서울시 마포구 백범로</h6>
				<h7>21세| 희망시급 100000원</h7>
				<div class="review_rate" style="line-height: 1.375;">후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>
</div>
	<hr/>
	<br/>
<div class="wrapper2">
<a href="/parents/parentView"></a>
	<ul class="list-group">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				<h6><b>이ㅇ준</b> | 3분전</h6>
				<h6>서울시 마포구 백범로</h6>
				<h7>21세| 희망시급 100000원</h7>
				<div class="review_rate" style="line-height: 1.375;">후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>
</div>
	<hr/>
	<br/>
<div class="wrapper2">
	<ul class="list-group">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				<h6><b>이ㅇ기</b> | 3분전</h6>
				<h6>서울시 마포구 백범로</h6>
				<h7>21세| 희망시급 100000원</h7>
				<div class="review_rate" style="line-height: 1.375;">후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>
</div>
	<hr/>
	<br/>
<div class="wrapper2">
	<ul class="list-group">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				<h6><b>이ㅇ현</b> | 3분전</h6>
				<h6>서울시 마포구 백범로</h6>
				<h7>21세| 희망시급 100000원</h7>
				<div class="review_rate" style="line-height: 1.375;">후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>
</div>
	<hr/>
	<br/>
<div class="wrapper2">
	<ul class="list-group">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				<h6><b>고ㅇ연</b> | 3분전</h6>
				<h6>서울시 마포구 백범로</h6>
				<h7>21세| 희망시급 100000원</h7>
				<div class="review_rate" style="line-height: 1.375;">후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>
</div>
	<hr/>
	<br/>




 </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>