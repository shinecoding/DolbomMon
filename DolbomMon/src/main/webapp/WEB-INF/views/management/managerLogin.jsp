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
<script>

	$(function(){
		$("#test").click(function(){ /*DB작업 전 임시 로그인버튼*/
			<%
			session.setAttribute("logStatus", "Y");
			%>		
			location.href="/dbmon/management";
			
		});
	});

</script>
<style>
	body{
		margin:0;
		padding:0;
		background : url("/dbmon/resources/managerLoginBackImg.jpg") no-repeat;
		background-size:cover;
	}
	.container{
		width:1300px;
		padding:150px 0px;
	}
	.loginText{
		width:200px;
	}
	#leftDiv, #rightDiv{
		margin:0;
		padding:50px;
		width:550px;
		height:700px;
		float:left;
		color:#A6A6A6;
	}
	#leftDiv{
		background-color:#399190;
		color:#FFFFFF;
	}
	#rightDiv{
		padding:250px 50px;
		border-left:1px solid lightblue;
		background-color:#2D3035;
	}
	
</style>
</head>
<body>
<div class="container">
	<div id="leftDiv" class=jumbotron>
	</div>
	<div id="rightDiv" class=jumbotron>
		<form method="post" id="managerLogin">
			<div class="loginText">ID : </div><input type="text" name="userid" class="input-material"/><br/>
			<div class="loginText">Password : </div><input type="password" name="userpwd"/><br/>
			<input type="submit" value="로그인"/>
			<input type="button" value="임시로그인" id="test"/> <!-- 임시로그인버튼 -->
		</form>
	</div>
</div>
</body>
</html>