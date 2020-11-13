<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<title>Dolbommon</title>

</head>
<style>
   body{
      background-color:white; 
      cursor:pointer;
      font-family:"Noto Sans KR";
      text-decoration:none;
      
      }
   ul{margin:0;padding:0px;list-style-type:none;}

     /*메뉴*/
    #menu>ul, #menu>ul>li{
       
       float:left;
    }
    #menu a:link, #menu a:visited {
       font-size:20px;
       text-decoration:none;
       color:black;
    }
    #menu a:hover{
       text-decoration:none;
       color: blue;
    }

    #menu ul{
       width:100%;
    
       height:72px;
       background-color:white;
       border-bottom : 1px solid gray;
    }
    #menu li{
       height:72px;
       line-height:72px;
       padding: 0 35px 0 40px;
       
    }
    .footer {
         width:100%;
         height:150px;
        
         bottom:0;
         background:#5eaeff;
        text-align: center;
        color: white;
   }
   img{
      width:200px;
      height:72px;
   }
   
</style>

<body>
<nav id="menu" style="background:#fff;overflow:auto;">
   <ul>
      <li><img src="<%=request.getContextPath()%>/img/DOL01.PNG" alt="Logo" margin-right="50px" src="#"><li>
      <li><a href="#">자유게시판</a></li>
      <li><a href="#">공지</a></li>
      <li><a href="#">고객센터</a></li>
      <li><a href="#">돌봄몬찾기</a></li>
      <li><a href="#">일자리찾기</a></li>
      <li><a href="#">My Menu</a></li>
   </ul>
</nav>
<<<<<<< HEAD:DolbomMon/src/main/webapp/WEB-INF/home.jsp
<div id="slider">
<jsp:include page="views/bxslider.jsp"/>
</div>
 <!--  <sitemesh:write property='body'/>-->
=======
  <sitemesh:write property='body'/>
>>>>>>> parent of 6f246ac... 1113:DolbomMon/src/main/webapp/WEB-INF/views/home.jsp
         <footer class="footer">
              <div>돌봄몬</div>
                 <div>
                 @ 2020 Dolbommon
                       
              
                 </div>
              <p>Copyright © 2020 Dolbommon.co.,Ltd. All rights reserved.</p>
             <address>Contact Dolbommon for more information. 02-1234-5678</address>

              
                <i class="fab fa-java fa-2x"></i><i class="fab  fa-html5 fa-2x"></i><i class="fab fa-github-alt fa-2x"></i>
         </footer>

</body>
</html>