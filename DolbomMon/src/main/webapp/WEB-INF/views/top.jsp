<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

   <script type="text/javascript">
   
         $(function(){

	        $("ul.subMain").hide();
	        $("ul.mainTopmenu li").hover(function(){
	        	$("ul:not(:animated)",this).slideDown("fast");
	         },
	         function(){
	            $("ul",this).slideUp("fast");
	         });

	      });   

   </script>

   
   <style type="text/css">
HTML CSSResult
EDIT ON
/* 폰트적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);



     #menu-button{
     	-webkit-padding-start:0px;
     	
     }

     #topmenu-button{
     	-webkit-padding-start:0px;

     	-webkit-tap-highlight-color: rgba(255, 255, 255, 0);

     }
   
     #topmenu-button{
        -webkit-padding-start:0px;
     }
   

      #container {

        width: 100%;
      }

      ul.mainTopmenu li{ 
	     float: left;
	     width:100%;
		 width: 263px;
		 height: 48px;
		 text-align:center;
		 background-color: white;
		 position: relative;
		 z-index:1000;
		 list-style-type: none;
		 -webkit-padding-start:0px;
		
		 }
      ul.mainTopmenu li a{
	     display: block;
		 width: 100%;
		 height: 100%;
		 line-height: 48px;
		 font-weight:bold;
		 overflow:hidden;
		 color:gray;
		 text-decoration: none;
		 font-family:"Noto Sans KR";
		 text-align:center;
		 list-style-type: none;
		 
		 margin-left:0px;
		 }
	  ul.mainTopmenu li {
		width: calc(100%/6);
		height:50px;
		
		}
	  ul.mainTopmenu ul.subMain li {
	    width: 100%;
	    -webkit-padding-start:0px;
	    height:50px;
	    }
	  
	  
      ul.mainTopmenu li a:hover{
      	 color:orange;
	     opacity:50;
		 }

      ul.mainTopmenu li ul.subMain{
        position: absolute;
       }
      ul.mainTopmenu{
	     zoom: 1;
	     margin-bottom:0;
	     height:60px;
		 }
      ul.mainTopmenu:after{
	     height: 0;
		 visibility: hidden;
		 content: ".";
		 display: block;
		 clear: both;
		 }
		
	  .logo{
	      width:100px;
	      height:50px;
	      margin-top:30px; 
	   }
	   
	   header#topHeader{
	   		margin-left:50px;
	   		
	   		
	   }
	   a.ppp{
	   		float:right;
	   		margin-right:180px;
	   		
	   }
	   #fixtopLogo:after { clear:both; } 
	   .mainTopmenu>li *{
	   -webkit-padding-start:0px;
	   width:100%;
	   
	   }
	   

   </style>
</head>
<body>
 <div id="containertoptoptop" >

 <div class="clearfix">
    <header id="topHeader">
    <img src="<%=request.getContextPath()%>/img/mylogo.png" 
           class="logo" alt="Logo" src="home" style="margin-left:10px; float:left;" 
           Onclick="location.href='/dbmon'"/>


           <span style="float:right">
           <a href="javascript:void(window.open('/dbmon/chat','message','width=1200,height=1000,status=no,toolbar=no,resizable=yes,scrollbars=no, left=500, top=120'))">
           <button class="btn btn-primary ppp">채팅</button></a>
           <a href="javascript:void(window.open('/dbmon/message','message','width=482,height=600,status=no,toolbar=no,resizable=yes,scrollbars=no, left=500, top=120'))">
           <button class="btn btn-primary ppp">쪽지</button></a>
           <a href="/dbmon/temporaryLogin">
           <button class="btn btn-info ppp">임시로그인</button></a>
           </span>
           
           
          <a class="btn" style="float:right">   
         <input type="button" value="가입하기" class="btn btn-outline-warning ppp" style="color:ff6400" Onclick="location.href='/dbmon/join'"/>
         <c:if test="${logStatus == null || logStatus=='N'}">
          <input type="button" value="로그인" class="btn btn-outline-warning ppp" style="color:ff6400" Onclick="location.href='/dbmon/login'"/> 
          </c:if>
    
    
         <c:if test="${logStatus != null || logStatus=='Y'}">
         ${userid } <input type="button" value="로그아웃" class="btn btn-outline-warning ppp" style="color:ff6400" Onclick="location.href='/dbmon/logout'"/>           
         </c:if>

   </a>             
   </header>


</div> 

   <ul class="mainTopmenu" id="topmenu-button">
       
       <li><a href="#">고객센터</a>

        <ul class="subMain">
          <li><a href="/dbmon/brandIntro">회사소개</a></li>
         <li><a href="#">신고하기</a></li>         
       </ul>
       </li>
       <li><a href="/dbmon/noticeBoard">공지사항</a>
       <ul class="subMain">    
       
      </ul>
      </li>
      <li><a href="/dbmon/freeBoard">자유게시판</a>


      </li>
      <li><a href="/dbmon/parent_list">일자리찾기</a> <!-- 돌봄몬이 학부모구하는것 -->
      </li>
      <li><a href="/dbmon/sitter_list">돌봄몬찾기</a> <!-- 학부모가 돌봄몬구하는것 --> 
       
      </li>
      <li><a href="#">My Menu</a>
       <ul class="subMain">
         <li><a href="teacherList">선생님페이지</a></li>
         <li><a href="mypage">부모님페이지</a></li>
      </ul>
 </ul>


 </div>

