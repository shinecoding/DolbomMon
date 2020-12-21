<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.footer123123 {
	     width:100%;
	     height:200px;
	     font-size:.85em;
	     margin-bottom:0px;
	     background: #555;
	     color: #C2C2C2;
	     padding: 18px 0;
	}
	#footer_TEXTarea{
		float: right;
		text-align: left;
		width: 600px;
	}

</style>

<footer class="footer123123" style="margin-top:100px;">
<br/>	
	<div id="footer_textarea123" style=" width: 800px; margin: auto;">
	<div style="float:left; margin: 0px; margin-top:27px; margin-left:50px;">
	<img src="<%=request.getContextPath()%>/img/mylogogray.png" 
	         class="logo147" alt="Logo" src="home" style=" width:150px; height: 70px;" 
	         Onclick="location.href='/dbmon'"/></div>
	   <div id="footer_TEXTarea" style="position: relative;">
		<a style="margin-left:100px;">돌봄몬<br/></a>
		<a style="margin-left:100px!important;">@ 2020 Dolbommon 대표 : 이승현 <br/></a>
		<a style="margin-left:100px!important;">소재지 : 서울시 마포구 백범로 비트캠프 3층 | 사업자 등록번호 : 11111222000<br/></a>
		<a style="margin-left:100px!important;">Copyright © 2020 Dolbommon.co.,Ltd. All rights reserved.<br/></a>
		<a style="margin-left:100px!important;">Contact Dolbommon for more information.<br/></a>
		<a style="margin-left:100px!important;">02-1234-5678 | dolbommon00@gmail.com<br/></a>
		</div>
	</div>		
</footer>
</body>
</html>