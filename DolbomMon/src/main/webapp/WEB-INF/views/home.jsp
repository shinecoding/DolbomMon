<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dolbommon</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script src="css/jquery.bxslider.js"></script>
<link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css"/>
<link href="<%=request.getContextPath() %>css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>css/demo.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>

<script>

function getCookie(name) {

    var cookies = document.cookie.split(";");

    for(var i=0; i<cookies.length; i++) {

        if(cookies[i].indexOf("=") == -1) {

            if(name == cookies[i])

                return "";

        }

        else {

            var crumb = cookies[i].split("=");

            if(name == crumb[0].trim())

                return unescape(crumb[1].trim());

        }

    }

};

var desktopModeTF = getCookie("DesktopMode")

var Scale = getCookie("DesktopModeScale")

if (desktopModeTF == "true") {

document.write('<meta name="viewport" content="width=1024, user-scalable=yes, initial-scale='+Scale+'">');

} else {

document.write('<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">')

}

</script>

<style type="text/css">

*{
	margin: 0px;
	padding: 0px;
	list-style-type: none;
	cursor:pointer;

       }
   body{
      background-color:white; 
      cursor:pointer;
      font-family:"Noto Sans KR,sans-serif!important;";
      text-decoration:none;
      font-weight:bold;
      text-align: center; 
      margin:0; padding:0;
      }
   html{
       margin:0; padding:0;
       width: 100%;  
   }
        
     
      }
    #list{
       text-align:center;
       margin:0 auto;
       
       }
    #listitem{
       
       width:10%;
       
    }
   
    #list img{
       background-color:rgb(255, 121, 40);
       font-family:"Noto Sans KR,sans-serif!important;";
       
       
       
    }
      li.list-group-item {
          background-color:rgb(255, 121, 40);
          font-size:12px;
          font-weight:bold;
          margin:10px;
          color:white;
    }

	h3{
		margin-top:30px;margin-bottom:30px;
	
	}
	#homeWrap_ALL{width:100%;}
	.lead{font-size:17px; font-family: 'Noto Sans KR', sans-serif; font-weight:bold; color:#6c757d;}

</style>

<body>
<div id="homeWrap_ALL" >

<!-- -------------------상단메뉴------------- -->
<div id="top" style="height:150px;">
<%@include file="/WEB-INF/views/top.jsp"%>
</div>


<!-- -------------------bx슬라이더------------- -->
<div id="slider" >
<%@ include file="/WEB-INF/views/bxslider.jsp" %>
</div>

 <!--================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div id="list" class="block" style="width: 100%; margin:0 auto;">
  <ul id ="listitem" class="list-group list-group-horizontal-sm"  style="width:100%; max-width:1000px; margin:0 auto;">
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter"><img src="img/a.png"  width="56" height="56"/></a><br/>등하원</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter"><img src="img/b.png"  width="56" height="56"/></a><br/>실내놀이</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter"><img src="img/c.png"  width="56" height="56"/></a><br/>야외활동</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter"><img src="img/d.png"  width="56" height="56"/></a><br/>학습지도</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter"><img src="img/f.png"  width="56" height="56"/></a><br/>영어놀이</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter"><img src="img/g.png"  width="56" height="56"/></a><br/>가사돌봄</li>
  </ul>
  <br/><br/><hr class="featurette-divider">
  
<div id="teacher_chart" data-aos="flip-left">
<%@ include file="/WEB-INF/views/teacher_chart.jsp" %> 
</div>

<div id="advertise" >
<%@ include file="/WEB-INF/views/advertiseDolbom.jsp" %>
</div>
    <hr class="featurette-divider">
<div id="mainContents4" >
    <div class="row featurette" style="width:800px; margin:0 auto;"  data-aos="flip-left">
      <div class="col-md-7"><br/><br/>
        <h2 class="featurette-heading" style="color:#ff7928; font-family: 'Nerko One', cursive;"><span style="font-weight:bold; font-size: 50px;font-family: 'Nerko One', cursive;">DOLBOMMON GUIDE</span><br/><br/>Step 01.<br/><br/>
        <span class="text-muted">Join our membership!</span></h2><br/>
        <p class="lead">가장 빨리, 원하는 조건의 <br/>아이 돌보미를 구할 수 있는 <br/>
                 돌봄몬을 이용하기 위해<br/> 빠르고 간편한 회원가입을 진행해주세요.
        </p>
      </div>
      <div class="col-md-5">
        <img src="img/guide1.PNG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500px" height="500px"  focusable="false" role="img" /><rect width="100%" height="100%"/>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" style="width:800px; margin:0 auto;" data-aos="flip-left">
      <div class="col-md-7 order-md-2"><br/><br/>
        <h2 class="featurette-heading" style="color:#ff7928; font-family: 'Nerko One', cursive;">Step 02.<br/><br/>
        <span class="text-muted">Fill out an application form.<br/><br/>
      </span></h2>
         <p class="lead"> 
            부모님과 아이가 누구인지, 어떤 도움을 받고 싶은지, <br/>언제 활동하기 원하는지를 신청서에<br/> 상세하게 알려주세요. <br/>
            신청서 작성이 완료되면 <br/>시터님을 직접 찾을 수 있습니다.<br/>
         Tip.자기소개를 상세할수록, 내 후기가 많을수록, <br/>돌봄 기간이 짧을수록 시터님을 더 빨리 찾을 수 있습니다!
         </p>
     
      </div>
      <div class="col-md-5 order-md-1">
        <img src="img/guide2.PNG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" style="width:800px; margin:0 auto;" data-aos="flip-left">
      <div class="col-md-7">
        <h2 class="featurette-heading" style="color:#ff7928; font-family: 'Nerko One', cursive;"><br/>Step 03.<br/><br/>
        <span class="text-muted">Have an interview</span></h2>
        <p class="lead">
      먼저, 내가 직접 지역, 요일, 시간 등 다양하게 검색해서  <br/>마음에 쏙 드는 시터님을 찾아보세요.<br/>
      연락해보고 싶은 시터님이 있다면, <br/>인터뷰를 신청해보세요.<br/>
      내가 신청한 시터님이 3시간 안에 <br/>수락 또는 조율 응답을 하는 경우, 시터님의 연락처가 부모님에게 공개됩니다. <br/>
      (마이페이지 > 구직현황에서 확인할 수 있습니다.)<br/>
      <span style="color:#ff7942">Tip. 완료된 인증 수, 채용횟수, 후기 수가 많을수록 <br/>성실한 시터님일 확률이 높습니다.</span>
        </p>
      </div>
      <div class="col-md-5">
       <img src="img/guide03.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
      </div>
    </div>
</div> <!-- Maincontents4 -->
    

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
    
</div><!-- </homeWrap_ALL> -->
<script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 2000
    });
 
</script>

</body>

</html>

<!-- ------------------footer------------- -->

<jsp:include page="footer.jsp"/>
