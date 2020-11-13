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
<style>
</style>
</head>
<body>
<div class="container"></div>
	<h4>내 인증 관리</h4>
	<ul class="list-group">
		<li class="list-group-item">
			<span class="fa-stack fa-2x">
				<i class="fas fa-circle fa-stack-2x"></i>
				<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
			</span>
		<b>등초본인증</b>
		
		
		<button>인증받기</button>
		</li>
	</ul>
</body>
</html>