<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
@media (max-width:700px){
	.dbmon_info_review1{
		display:none;
		font-family:'Poor Story', cursive;
		
	}}


.dbmon_info_review1{
		margin-left:30px;
	 	float:left;
		padding:0; margin:0;
		display:block;
		width:20%;
		font-family:'Nanum Gothic', sans-serif;
		font-size:15px;
		font-weight:bold;

	  
	}

 a:link { color: black; text-decoration: none; }
 a:visited { color: black; text-decoration: none; font-weight:bold;}
 a:hover { color: black; text-decoration: none;}
 a{color:black; font-weight: normal;}

.product-info__artist-name{
	font-weight:bold;
	
}
.product-info__price{
	color:#ff7942;
	font-size:15px;
}
.product-info__name{
	color:gray;
	font-size:15px;
}

.review-comment__contents{
	font-weight:normal;
	color:gray;
}
.half-highlight {
  background: linear-gradient(180deg,rgba(255,255,255,0) 50%, #FFD0AE 50%);
}



.about-woori {
    position: relative;
    padding-top: 55px;
    background-color:white;
}
p{
	color:#ff7942;
}
@media (min-width: 1000px){
.second-row{
    padding-top: 92px;
    padding-bottom: 63px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    background-color:white;
}
  .img1{
    width:70%;
    height:250px;
	 }
}
.card-text{
		display: inline-block;
		height: 7.5em;
		white-space: normal;
		word-wrap: break-word;
		line-height: 1.5;
		-webkit-line-clamp: 5;
     	-webkit-box-orient: vertical;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
</style>

<div class="about-woori" data-aos="fade-up">
<section class="about-inner">
<div class="first-row"><h2 style="font-weight:bold;">돌봄몬 서비스란?</h2> 
	<p>
          돌봄몬 선생님이 가정으로 방문해
    <br>등하원 및 놀이돌봄을 진행하는 서비스 입니다.</p>
</div> 
    
<div class="second-row">
<article><img src="img/y1.png" alt="pic_1" style="background-color:white;"> 
<h3 >
	원하는 시간대에
	<br>안정적인 정기 등하원
	</h3><p>우리 돌봄몬은 부모님이 원하시는
	<br/>요일과 시간대에, 마음 편히 일하실 수 있도록
	<br>정기 등하원 서비스를 제공합니다.
</p></article> 
<article><img src="img/y2.png" alt="pic_2" style="background-color:white;"> 
<h3>
 사랑과 정성으로
<br>아이를 기다려주는 선생님
</h3> 
<p>
 우리 돌봄몬은 자녀를 키워본 양육경험,
<br>삶의 연륜에서 나오는 여유와 인내심으로
<br>아이를 기다려주고, 지지해 줍니다.
<br></p></article> 
            
<article><img src="img/y3.png" alt="pic_3" style="background-color:white;"> <h3>
아이 성장의 원동력,
<br>놀이 기반 돌봄
</h3><p>
아이는 놀이를 통해 성장하고 발달하며
<br>생각과 감정을 표현하고, 행복을 경험합니다.
</p></article></div>
</section></div>


<hr/>






<div class="container" data-aos="fade-up" id="target2" style="margin: 0 auto;">

<div class="gridStyleAllWrapper" style="margin-top:0px; height:600px;">
<h3 style="margin-top:70px;"><img class="_3v9X3" src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/index/icon-onair.svg" alt="실시간 돌봄몬 후기"  style="background-color:white;">
<strong class="half-highlight">실시간</strong>&nbsp;돌봄몬 후기</h3>
<br/>


<div class="row" style="margin-top:30px;">
	<div class="row">
	<c:forEach var="cList" items="${cList}">
	<div class="col-sm">
		<div class="card" style="width: 22.4rem;  margin-bottom: 20px;">
		<div class="card-body" style="height: 230px;">
		<div style="float:left; width: 60px; height: 60px;"><img src=<c:if test="${vo.pic==null}">"img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">"upload/${vo.pic}"</c:if> class="rounded-circle" style="width:55px;"></div>
		<div style="font-size:1.1em; position: relative; text-align: left; float: right; width: 250px; overflow: hidden; text-overflow: ellipsis; margin: 3px;"><b>&nbsp;${cList.addr}</b><br/>
		<c:if test="${cList.review_star==1}">
		<img src="img/star.jpg" style="width:30px;"></c:if>
		<c:if test="${cList.review_star==2}">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;"></c:if>
		<c:if test="${cList.review_star==3}">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;"></c:if>
		<c:if test="${cList.review_star==4}">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;"></c:if>
		<c:if test="${cList.review_star==5}">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;">
			<img src="img/star.jpg" style="width:30px;"></c:if> 
			<span class="badge bg-danger" style="position: absolute; top: 33px; right: 10px; color: white;">New</span> 
		</div>
		<div class="card-text" style="color: black; float:left; width: 305px; position: absolute; top: 95px; left: 30px;">
		${cList.review_content}
		</div>
		</div>
	    </div>
	</div>
	</c:forEach>
	</div>
</div>
</div>
</div>
<br/>
<br/>











 <c:forEach var="vo" items="${list }">
	<div class="wrapper2" onclick="location.href='teacherView'">
	<ul class="list-group" style="font-size:.85em; font-weight: 500;">
	<li class="list-group-item">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item border-0 col-2">
				<img src="img/profilepic.png" class="rounded-circle"/><br/>
				<div class="badge badge-warning badge-pill ml-3" ><span>0</span>명 지원</div>
			</li>
			<li class="list-group-item border-0 col-10">
				
				<h6><b>${vo.username }<b/></h6></a><a style="color:orange;">
				<b>돌봄가능아이 수 : ${vo.headcount}</b> | 3분전 ${vo.situation } |  ${vo.no }</a> <br/><br/>
				<a style="color: #3b3b3b; font-size: 1em; font-weight: 500;"><b>${vo.content}</a></b><br/>
				<a>${vo.age}세  | 희망시급 : ${vo.wage } | 협의유무: ${vo.discussion }</a><br/>
				
				<div class="review_rate" style="line-height: 1.375;">등록일 : ${vo.t_date} | 후기수 : 100개</div>
			</li>
		</ul>
	</li>
	</ul>

</div>

</c:forEach> 










</body>
</html>
<hr/>