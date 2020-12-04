<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	*{margin:0; padding:0;}
	.container{width:600px;}
	.container>div{width:100%; height:300px; margin-top:80px; overflow:hidden;}
</style>
<script>
	$(function(){
		$("#parent").click(function(){
			$("#joinTypeFrm").attr("action", "<%=request.getContextPath()%>/parentJoin");
			$("#who").val("P");
			$("#submit").click();
		});	
		
		$("#dbm").click(function(){
			$("#joinTypeFrm").attr("action", "<%=request.getContextPath()%>/dbmJoin");
			$("#who").val("T");
			$("#submit").click();
		});
	});
</script>
</head>
<body>
	<form id="joinTypeFrm" method="post" action="">
	<div class="container" >
		<div>
			<img id="parent" src="<%=request.getContextPath()%>/img/mom.png"/>
		</div>
		<div>
			<img id="dbm" src="<%=request.getContextPath()%>/img/dbm.png"/>
		</div>
	</div>
	<input id="submit" type="submit" />
	<input type="hidden" name="intro"/>
	<input type="hidden" id="who" name="who" value=""/>
	</form>
</body>
</html>