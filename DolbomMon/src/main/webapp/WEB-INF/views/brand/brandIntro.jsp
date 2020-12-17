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
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>

   body,ul,li{margin:0; padding:0; text-align:center;}

   #upper{
      text-align:center;
      color:black;
      
   }
   .jb-text { 
		position: absolute; 
		top: 50%; width: 100%; 
   	}
   .jb-text p { 
		margin-top: -24px; 
		text-align: center; 
		font-size: 48px; color: #ffffff; 
   }

</style>
<script>

</script>
</head>
<jsp:include page="../top.jsp"/>
<body>

<div id="upper">

   
   <video class="redution" src='img/video.mp4' width='100%' autoplay muted loop>
</video>
 <div class="jb-text">
        <p>사업소개</p>
        <h5 style="color:white;">Services</h5>
        <br/><br/><br/><br/>
	   <h2 style="color:white">놀이부터 배움까지 선생님 매칭 웹</h2>
	   <h2 style="font-weight:bold; color:white;">아이돌봄 웹 서비스</h2>
      </div>
      <br/><br/><br/><br/>
    <h1 style="color:gray">Q. 왜 돌봄몬인가요?</h1><br/><br/>
	<h4 style="font-weight:bold; color:gray;">누구보다 절실하고, 필요한 걸 아는<br/>
	엄마들을 위해 <br/>놀이 돌봄 서비스 
	'돌봄몬'을 시작했습니다.<br/> </h4>
   <br/><br/><br/><br/><br/>
   <img src="img/pic2.png" data-aos="fade-up"/>
   <img src="img/intro1.png" data-aos="fade-up" style="margin-top: 4rem;max-width: 786px;padding: 0 15px; margin: 50 auto;"/>
</div>
<script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 2000
    });
 
</script>
</body>

<!-- ------------------footer------------- -->
<hr/>
<jsp:include page="../footer.jsp"/>
</html>