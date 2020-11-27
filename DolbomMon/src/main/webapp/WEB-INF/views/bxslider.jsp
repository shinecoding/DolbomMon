<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
   *{
        margin:0;
        padding:0;
       }
   #bxslider img{
      height: 550px; 
      
      max-width:100%;
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
 




</style>
<script>
$(function(){
   $("#bxslider").bxSlider({
      mode :'horizontal'
      ,pager:true	//페이지 탭
      ,speed:1000 // 변환 속도
      ,auto:true // 자동 시작(true,false)
      ,randomStart:true //시작슬라이드 랜덤
      ,caption:true //title속성의 값을 설명으로 표시한다.(true,false)
      ,infiniteLoop: true//반복여부
      ,hideControlOnEnd: false//처음과 마지막에 컨트롤러 표시 여부 설정(true, false)
   //easing
      ,useCSS: true//easing 사용 여부 설정(true(easing사용안함), false(easing사용));
      
   
   });
});
</script>
</head>
<body>

   <ul id="bxslider">
      <li><a href="#"><img src="img/bx4.png" />
      <strong data-v-6f47ee50="">
      등하원 전문
      <br data-v-6f47ee50="">놀이돌봄 서비스
    </strong></a></li>
      <li><a href="#"><img src="img/bx3.png" /></a></li>
      <li><a href="#"><img src="img/bx1.png" /></a></li>
      <li><a href="#"><img src="img/141.png" /></a></li>
      <li><a href="#"><img src="img/bx2.png" /></a></li>
      <li><a href="#"><img src="img/242.jpg" /></a></li>
      <li><a href="#"><img src="img/243.png" /></a></li>
   </ul>

