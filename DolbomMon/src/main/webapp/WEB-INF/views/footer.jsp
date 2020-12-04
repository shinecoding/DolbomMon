<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
 .footer {
     width:100%;
     height:250px;
     text-align:left;
     font-size:.85em;
     margin-bottom:0px;
     background: #555;
     color: #fff;
     padding: 10px 0;
}

</style>
<footer class="footer">
<hr/>
<br/>	
	<div id="footer_textarea" style="margin-left:200px;">
	<img src="<%=request.getContextPath()%>/img/mylogogray.png" 
	         class="logo" alt="Logo" src="home" style="float:left;" 
	         Onclick="location.href='/dbmon'"/>
		<a style="margin-left:100px;">돌봄몬<br/></a>
		
		<a style="margin-left:100px;">@ 2020 Dolbommon 대표 : 이승현 <br/></a>
		<a style="margin-left:100px;">소재지 : 서울시 마포구 백범로 비트캠프 3층 | 사업자 등록번호 : 11111222000<br/></a>
		<a style="margin-left:100px;">Copyright © 2020 Dolbommon.co.,Ltd. All rights reserved.<br/></a>
		<a style="margin-left:200px;">Contact Dolbommon for more information.<br/></a>
		<a style="margin-left:200px;">02-1234-5678 | dolbommon00@gmail.com</a>
		
	
	</div>
	
		
</footer>
</body>
</html>