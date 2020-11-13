<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 800px;
		
	}
	#top{
		margin: 20px;
		padding: 20px;
		text-align: center;
		font-size: 30px;
	}
	
	ul, li{
		margin: 0px;
		padding: 0px;
		list-style-type: none;
	}
	li{
		float: left;
		width: 10%;
		height: 40px;
		line-height: 40px;
		border-bottom: 1px solid gray;
		
		
	}
	
	#lst>li:nth-child(5n+2){
		width: 60%;
	}
	.wordCut{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	#board{
		
	}
</style>
</head>
<body>
<div class="container">
<div id="top">
<b>자유게시판</b>
</div>
<div id="board">
	<ul id="lst">
		<li>글번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<c:forEach var="vo" items="">
			<li>글번호</li>
			<li class="wordCut">제목</li>
			<li>작성자</li>
			<li>등록일</li>
			<li>조회수</li>
		</c:forEach>
		
	</ul>
	


</div>






</div>
</body>
</html>