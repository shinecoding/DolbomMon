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
	.container>div{width:100%;overflow:hidden;}
	.container>div>div * {float:left;}
	
	div{-webkit-transition:background-color 0.2s;
		transition:background-color 0.2s;
		list-style:none;
		}
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
		
		$("#parent").hover(function(){
			$(this).css("background-color", "#CCC");			
		}, function(){
			$(this).css("background-color", "white");
		});
		
		$("#dbm").hover(function(){
			$(this).css("background-color", "#CCC");			
		}, function(){
			$(this).css("background-color", "white");
		});
	});
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/top.jsp"%>
	<form id="joinTypeFrm" method="post" action="">
	<div class="container" >
		<div id="parent" style="cursor:pointer; margin-top:100px; text-align:center;border-radius:20px;">
			<div style="display:inline-block;width:70%;">
				<img src="<%=request.getContextPath() %>/img/momJoinImg.png" style="width:150px;" />
				<div style="width:200px;font-size:17px;margin-top:10px;padding:10px;">아이를 돌봐줄 돌봄몬이 필요해요</div>
				<div style="width:200px;font-size:23px;padding:10px;color:rgb(104,189,167)">부모회원 가입</div>
			</div>
		</div>
		<div id="dbm" style="cursor:pointer; margin-top:50px; text-align:center;border-radius:20px;">
			<div style="display:inline-block;width:70%;">
				<img src="<%=request.getContextPath() %>/img/dbmJoinImg.png" style="width:150px;" />
				<div style="width:200px;font-size:17px;margin-top:10px;padding:10px;">아이를 돌볼 돌봄몬으로 활동하고 싶어요.</div>
				<div style="width:200px;font-size:23px;padding:10px;color:rgb(243,127,87)">돌봄몬회원 가입</div>
			</div>
		</div>
	</div>
	<input id="submit" type="submit" style="display:none;"/>
	<input type="hidden" id="who" name="who" value=""/>
	</form>
</body>
</html>