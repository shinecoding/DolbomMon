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
</head>
<style>
	.container{width:600px; text-align:center; padding:0;}
	#scheduleHeader{ margin-top:50px; text-align:center;}
	.d1{width:300px; height:auto; display:inline-block; text-align:center; margin-top:20px;}
	.d1 span{display:inline-block; width:100%; font-size:20px; padding:10px 20px; border-radius:20px; background-color:#EFEFEF;}
</style>
<script>
	$(function(){
		
		$(".d1").click(function(){
			var selectedId = $(this).children().attr("id");
			if(selectedId=="1") {
				location.href="<%=request.getContextPath()%>/parent/scheduleType/regular";
			}else if(selectedId=="2") {
				location.href="<%=request.getContextPath()%>/parent/scheduleType/shortTerm";
			}else if(selectedId=="3") {
				location.href="<%=request.getContextPath()%>/parent/scheduleType/noPlan";
			}
		});
		
		
	});
</script>
<body>
	<div class="container">
		<div id="scheduleHeader">
			언제 돌봐드릴까요?
		</div>
		<div class="d1">
			<span id="1">정기적으로</span>
		</div>
		<div class="d1">
			<span id="2">특정날에만</span>
		</div>
		<div class="d1">
			<span id="3">아직 정확한 계획은 없어요</span>
		</div>
	</div>
</body>
</html>