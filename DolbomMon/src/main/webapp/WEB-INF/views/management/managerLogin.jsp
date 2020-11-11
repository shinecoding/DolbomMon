<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DolbomMon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<style>
	ul, li{
		width:150px;
	}

</style>
</head>
<body>
<div class="container">
<h1>로그인화면test</h1>
	<form method="post" id="">
		아이디 : <input type="text" name="userid" id="userid"/><br/>
		비밀번호 : <input type="password" name="userpwd" id="userpwd"/><br/>
		<input type="submit" value="로그인"/>
	</form>
</div>
</body>
</html>