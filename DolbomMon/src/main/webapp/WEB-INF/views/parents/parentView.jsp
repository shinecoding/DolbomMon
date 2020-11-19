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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.container{width:800px;}
i{color:gray;}
#profimg{
   width:50%;
}
h5{
   padding: 20px 0px 0px 0px;
   font-weight: bold;
}
 .fa-check-circle{
 font-size:60px;
 margin: 8px;
}
</style>
</head>
<body>

<div class="container">
   <div class="badge badge-warning badge-pill float-right mt-3 p-2"><img src="icon/icon-alarm.png" style="width:1em; height:1em"/>신고</div>
   <img class="rounded mx-auto d-block" id="profimg" src="img/profilepic.png"/>
   <ul class="list-group">
         <li class="list-group-item align-middle"><span  style="font-size:1.4em; font-weight:bold">이O준</span><span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2">학부모</span><br/>
         <c:forEach var="s" begin="1" end="5"><i class="fas fa-star"></i></c:forEach> <span class="mx-2"></span> | <span class="ml-2">no.798521</span></li>
   </ul>
   <br/>
   <ul class="list-group list-group-horizontal-sm">
         <li class="list-group-item col-4" style="text-align:center"><i class="fas fa-search mr-2"></i>조회수<br/><div>129</div></li>
         <li class="list-group-item col-4" style="text-align:center"><i class="far fa-clock mr-2"></i>프로필 작성<br/>3일 전</li>
         <li class="list-group-item col-4" style="text-align:center"><i class="fas fa-video mr-2"></i>CCTV<br/>동의함</li>
   </ul>
   <ul class="list-group">
      <li class="list-group-item">
         <div class="row">
            <div class="col-1">
            <span class="fa-stack fa-2x"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-check fa-stack-1x fa-inverse"></i></span>
            </div>
            <div class="col-10 ml-3 mt-1">
            <b style="font-size:1.2em">본인 인증 완료</b><br/>
            돌봄몬 고객안전관리팀에서 실명 / 생년월일 /  연락처를 확인하였습니다.
            </div>
         </div>
      </li>
      </ul>
      
      <h5>간단 자기소개</h5>
      <li class="list-group-item p-5" style="text-align:center">아직 작성하지 않았습니다.</li>
      <h5>선호하는 돌봄유형</h5>
      <li class="list-group-item p-5" style="text-align:center">"저는 <span>놀이/학습</span>실내놀이가 가능한 돌봄몬을 찾습니다."</li>
      <h5>돌봄 기간/시간</h5>
      <li class="list-group-item">스케쥴차트</li>
      <h5>돌봄 아이 연령</h5>
      <li class="list-group-item">
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-new-off.svg" alt="신생아" /><br/>신생아</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-young-off.svg" alt="영아" /><br/>영아</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-child-off.svg" alt="유아" /><br/>유아</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-element-off.svg" alt="초등학생" /><br/>초등학생</li>
      </ul>
   </li>
   <h5>원하는 활동</h5>
   <li class="list-group-item">
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-indoorplay-off.svg" /><br/>실내놀이</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-join-walk-off.svg"/><br/>등하원돕기</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-read-off.svg" /><br/>책읽기</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-outdooractivities-off.svg"/><br/>야외활동</li>
         </ul>
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-korean-off.svg"/><br/>한글놀이</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-english-off.svg"/><br/>영어놀이</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-study-off.svg"/><br/>학습지도</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-pe-off.svg"/><br/>체육놀이</li>
         </ul>
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-cleaning-off.svg"/><br/>간단 청소</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-cook-off.svg"/><br/>밥 챙겨주기</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-washing-off.svg"/><br/>간단 설거지</li>
         
         </ul>
         <ul class="list-group list-group-horizontal-sm" >
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-longterm-off.svg"/><br/>장기입주</li>
            <li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-shortperiod-off.svg"/><br/>단기입주</li>

         </ul>
      </li> 
      <h5>원하는 활동 지역</h5>
      
      <li class="list-group-item p-4"><span class="badge badge-warning">1순위</span> 서울특별시 마포구 마포동</li>
      
         <h5>그 외 요청사항</h5>
         <li class="list-group-item p-4">
            <b>희망 돌봄몬 성별 : 돌봄몬 성별을 선택해주세요.</b><br/>
            
         </li>
   <br/>
</div>

</body>
</html>

