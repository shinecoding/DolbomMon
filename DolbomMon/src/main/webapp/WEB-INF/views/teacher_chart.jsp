<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
@media (max-width:700px){
	.dbmon_info_review1{
		display:none;
	}
}
.dbmon_info_review1{
		margin-left:30px;
	 	float:left;
		padding:0; margin:0;
		display:block;
		width:20%;
		font-family:'Nanum Gothic', sans-serif;
		font-size:15px;
}
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
 a{color:black; font-weight: normal;}

.product-info__artist-name{
	font-weight:bold;
	
}
.product-info__price{
	color:#ff7942;
	font-size:13px;
}
.product-info__name{
	color:gray;
	font-size:14px;
}

.review-comment__contents{
	font-weight:normal;
	color:gray;
}
.half-highlight {
  background: linear-gradient(180deg,rgba(255,255,255,0) 50%, #FFD0AE 50%);
}
</style>



<div class="container">

<div class="gridStyleAllWrapper" style="margin-top:0px; height:600px;">
<h3 style="margin-top:70px;"><img class="_3v9X3" src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/index/icon-onair.svg" alt="실시간 맘시터 후기">
<div style="margin:10px;">  </div>
<strong class="half-highlight">실시간</strong>&nbsp;돌봄몬 후기</h3>
<br/><br/>


  <div class="row" style="margin-top:30px; margin-left:70px;">
    <div class="col-3" style="padding:0px">
      <div class="dbmon_info_review1"> <!-- 김태희꺼리뷰 -->
		<a class="dbmonImgTeacher"><img src="img/tea1.PNG" style="width:150px; height:150px; border-radius:50%;margin-bottom:30px;"></img></a><br/>
		<div style="width:150px;">
		<a class="product-info__artist-name">서울특별시 동작구</a><br/>
		<a class="product-info__name">[돌봄몬 후기1위👍]<br/> 김O희</a><br/>
		<a class="product-info__price">희망시급 : 10,000<span style="font-size: 14px;">원</span></a>
			<div class="product-info__badge-group" style="margin-top: 12px;">
			<div class="badge badge-activity1">영어놀이, 실내놀이</div>
			<div class="product-info__review"><div class="review-rating"><span data-value="5" class="ui_rating fr" >
				<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
				<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
				<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
				<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
				<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
			<span class="review-count"> (131) </span></div> 
			<div class="review-comment"><div class="review-comment__badge"></div> 
			<div class="review-comment__contents">시간약속도 잘 지켜주시고 장난감도 가져와주셔서 좋았어요!</div>
			</div>
			</div></div>
	</div>
		</div>
    </div>
    <div class="col-3" style="padding:0px">
      <div class="dbmon_info_review1"> <!-- 김태희꺼리뷰 -->
	<a class="dbmonImgTeacher"><img src="img/stu2.jpg" style="width:150px; height:150px; border-radius:50%; margin-bottom:30px;"></img></a><br/>
	<div style="width:150px;">
	<a class="product-info__artist-name">서울특별시 마포구</a><br/>
	<a class="product-info__name">[돌봄몬 후기1위👍]<br/> 남O혁</a><br/>
	<a class="product-info__price">희망시급 : 20,000<span style="font-size: 14px;">원</span></a>
		<div class="product-info__badge-group" style="margin-top: 12px;">
		<div class="badge badge-activity1">등하원, 실내놀이</div>
		<div class="product-info__review"><div class="review-rating"><span data-value="5" class="ui_rating fr" >
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<span class="review-count"> (232) </span></div> 
		<div class="review-comment"><div class="review-comment__badge"></div> 
		<div class="review-comment__contents">아이들이 낯설지 않게 다정하고 친근하게 다가와주셔서 감사했어요~!</div>
		</div>
		</div></div>
		</div>
		</div>

    </div>
    <div class="col-3" style="padding:0px">
      <div class="dbmon_info_review1"> <!-- 김태희꺼리뷰 -->
	<a class="dbmonImgTeacher"><img src="img/ch1.PNG" style="width:150px; height:150px; border-radius:50%; margin-bottom:30px;"></img></a><br/>
	<div style="width:150px;">
	<a class="product-info__artist-name">인천광역시 서구</a><br/>
	<a class="product-info__name">[돌봄몬 후기1위👍]<br/> 전O현</a><br/>
	<a class="product-info__price">희망시급 : 30,000<span style="font-size: 14px;">원</span></a>
		<div class="product-info__badge-group" style="margin-top: 12px;">
		<div class="badge badge-activity1">영어놀이, 실내놀이</div>
		<div class="product-info__review"><div class="review-rating"><span data-value="5" class="ui_rating fr" >
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<span class="review-count"> (330) </span></div> 
		<div class="review-comment"><div class="review-comment__badge"></div> 
		<div class="review-comment__contents">아이성향을 잘 파악해주시고 눈높이에 맞춰 가르쳐주셔서 좋았습니다.</div>
		</div></div>
		</div>
		</div>
		</div>

    </div>
    
    
    
  
      <div class="col-3" style="padding:0px">
      <div class="dbmon_info_review1"> <!-- 김태희꺼리뷰 -->
	<a class="dbmonImgTeacher"><img src="img/ch2.PNG" style="width:150px; height:150px; border-radius:50%; margin-bottom:30px;"></img></a><br/>
	<div style="width:150px;">
	<a class="product-info__artist-name">서울특별시 동작구</a><br/>
	<a class="product-info__name">[돌봄몬 후기1위👍]<br/> 차O우</a><br/>
	<a class="product-info__price">희망시급 : 10,000<span style="font-size: 14px;">원</span></a>
		<div class="product-info__badge-group" style="margin-top: 12px;">
		<div class="badge badge-activity1">영어놀이, 실내놀이</div>
		<div class="product-info__review"><div class="review-rating"><span data-value="5" class="ui_rating fr" >
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<i data-state="active" class="fas fa-star" style="font-size: 11px; color:orange;"></i>
		<span class="review-count"> (30) </span></div> 
		<div class="review-comment"><div class="review-comment__badge"></div> 
		<div class="review-comment__contents">애기도 잘 봐주고 너무너무 좋아요!!</div>
		</div></div>
		</div>
		</div>
		</div>

    </div>
    
    
    </div>
  </div>


</div>
<br/><br/>













 <c:forEach var="vo" items="${list }">
	<div class="wrapper2" Onclick="location.href='teacherView'">
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