<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.cotainer{width:600px; text-align:center;}
	textarea{display:inline-block; width:90%; overflow:hidden; height:200px; resize:none;}
</style>
<script>
	
</script>
</head>
<body>
	<div class="container">
		<h3>간단 자기소개<span>(선택사항)</span></h3>
		<textarea placeholder="간단한 자기소개 작성 시 부모님에게 2배 더 많은 신청을 받게 됩니다."></textarea>
		<p></p>
		<input type="submit" value="다음"/>
	</div>
</body>
</html>