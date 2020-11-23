<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<script>
$(function(){
	
	$(document).ready(function(){
		window.resizeTo(496,668);
	})
	
});
	
</script>
<style>
	body{
		background-color:#F3F3F3;
		overflow-x:hidden;
	}
	#mainPage{
		margin:10px;
		border:1px solid #d3abab;
		background-color: #fff;
		padding:10px;
		padding-top: 15px;
		width:460px;
		overflow-x:hidden;
		max-height:600px;
	}
	#content{
		font-size:14px;
	}
</style>
</head>
<body onload="">
<div id="mainPage">
	<form action="/dbmon/messageWriteOk" method="post">
		<input type="hidden" name="userid_w" value="${userid_w}"/>
	    <div class="form-group">
	        <label for="userid_r">받는이</label>
	        <input type="text" class="form-control" id="userid_r" name="userid_r" placeholder="아이디를 적어주세요." value="${userid_r}">
		</div>
	    <div class="form-group">
	        <label for="subject">제목</label>
	        <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 작성해주세요.">
		</div>
		<div class="form-group">
	        <label for="content">내용</label>
	        <textarea class="form-control" id="content" name="content" rows="10"></textarea>
		</div>
	    <button type="submit" class="btn btn-info">쪽지보내기</button>
	    <a href="/dbmon/back?back=2"><button type="button" class="btn btn-secondary">목록으로</button></a>
	</form>
</div>
</body>
</html>