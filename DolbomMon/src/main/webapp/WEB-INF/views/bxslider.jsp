<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

<style>
   *{
   		font-family: 'Nanum Myeongjo', serif;
		font-family: 'Noto Sans KR', sans-serif;
   		font-weight: bold;
        margin:0;
        padding:0;
       }
   #bxslider img{
   	  margin-top:0px;
      height: 550px; 
      width:100%;
      text-align:center;
      -moz-box-shadow: none;
      -webkit-box-shadow: none; 
      box-shadow: none;
      border: 0;
      outline: 0;
      border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
   }
  

 .bx-wrapper {
 	padding: 0; 
 	-webkit-box-shadow: none; 
 	box-shadow: none; 
 	border: none;
 	}
 
.in_box {
    max-width: 1170px;
    width: 100%;
    margin: 0 auto;
    padding: 0 15px;
    position: relative;
    height: 200px;
    line-height: 150%;
    word-break: keep-all;
    text-align: left !important;
    color: #fff;
    -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
    
    
}
 #prevBtn { position: absolute; left: 0; top: 10px; }
 #nextBtn { position: absolute; right: 0; top: 10px; }



</style>
<script>
$(function(){
   $("#bxslider").bxSlider({
      mode :'horizontal'
      ,pager:true	//페이지 탭
      ,speed:1000 // 변환 속도
      ,auto:true // 자동 시작(true,false)
   	  ,moveSliders : 1 // 슬라이더 이동시 개수
      ,randomStart:true //시작슬라이드 랜덤
      ,controls:true
      ,autoControls:false
      ,nextSelector: '#nextBtn'// 다음 버튼 지정 
      ,prevSelector: '#prevBtn' // 이전 버튼 지정
      ,caption:true //title속성의 값을 설명으로 표시한다.(true,false)
      ,infiniteLoop: true//반복여부
      ,hideControlOnEnd: true//처음과 마지막에 컨트롤러 표시 여부 설정(true, false)
   //easing
      ,useCSS: true//easing 사용 여부 설정(true(easing사용안함), false(easing사용));
      ,nextText: 'next' // 다음 버튼 요소에 텍스트 삽입 
      ,prevText: 'prev'// 이전 버튼 요소에 텍스트 삽입

     });
   
  	  $( '#prevBtn' ).on( 'click', function () {
		   bxSlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
		   return false;              //<a>에 링크 차단
	  } );

	    //다음 버튼을 클릭하면 다음 슬라이드로 전환
	  $( '#nextBtn' ).on( 'click', function () {
		   bxSlider.goToNextSlide();  //다음 슬라이드 배너로 이동
		   return false;
	  });
	
});
</script>
</head>
<body>

   <ul id="bxslider">
      <li>
      <div style="position:absolute; margin-left:1000px; margin-top:200px; color:white; font-weight:bold;">
      <h1 class="tit wow fadeIn animated" style="visibility: visible; animation-name: fadeIn;">놀이부터 배움까지<br/> 선생님 매칭 사이트</h1>
      <h2 style="font-weight:bold;">No.1 아이돌봄 웹 서비스</h2></div>
      <img src="img/bx3.png" />
      </li>
      <li>
      	<div class="in_box" style="position:absolute; margin-left:200px; margin-top:200px; ">
            <h1 class="tit wow fadeIn animated" style="visibility: visible; animation-name: fadeIn;">“몇 시간 아이를 맘 편히 <br>맡길 수 있으면 얼마나 좋을까?”</h1>
            <span class="sub_tit wow fadeIn animated" style="visibility: visible; animation-name: fadeIn; font-size:20px;">당신과 같은 마음으로 돌봄몬이 시작됐습니다.</span>
	     <a href="#"></a></div>
	     <img src="img/bx1.png" />
      
      </li>
      <li>
   		<div style="position:absolute; margin-left:200px; margin-top:200px; color:white;">
	       <h1 style="font-weight:bold;">우리의 사명감<br/>
				</h1>
	       <h5>“돌봄몬이 있다는 게 육아하는데 얼마나 든든한지 모른다” <br/>
	       	언제, 어디서나 누군가의 필요가 된다는 것! 돌봄몬의 존재 이유입니다.</h5>
	       <a href="#"></a></div>
  		   <img src="img/141.png" />
      </li>
      <li>
		<div style="position:absolute; margin-left:150px; margin-top:200px;  color:white;">
	       <h1>육아에 도움이 필요하다면,<br/></h1>
	       <h3 style="font-weight:bold;">언제, 어디서나 돌봄몬이 함께하겠습니다.</h3>
	       <a href="#"></a></div>
   		  <img src="img/bx2.png" />
      </li>
      <li>
      	<div style="position:absolute; margin-top:400px;margin-left:450px; color:white;">
	       <h1>믿을 수 있는 돌봄몬을 만나요</h1>
	       <h4 style="font-weight:bold;">신원검증, 범죄경력조회를 통과한 선생님만을 검증하여 추천합니다</h4>
	       <a href="#"></a></div>
   		   <img src="img/242.jpg" />
      </li>
      <li>
      	<div style="position:absolute; margin-top:200px;margin-left:850px;color:white;">
	       <h1>매주 아이가 더 기다리는 아이맞춤 선생님</h1>
	       <h2 style="font-weight:bold;">등하원/이동, 학습, 영어, 창의미술, 놀이돌봄<br/></h2>
			<h6>돌봄몬은 아이들의 보호자이면서
			동시에 놀이부터 배움까지 담당합니다.</h6>
	       <a href="#"></a></div>
      	   <img src="img/243.png" />
      </li>
   </ul>
 	
