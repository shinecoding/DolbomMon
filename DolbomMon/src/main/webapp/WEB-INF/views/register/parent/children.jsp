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
	*{margin:0; padding:0; text-decoration:none; list-style:none;}
	.container{width:600px; padding:0px;}
	#header{width:100%; height:60px; margin-top:50px; text-align:center;}
	/* ====================== 자녀 수 ========================= */
	#childrenInfo{width:100%; overflow:hidden; height:auto; }
	#childrenCnt label{
		width:130px; 
		height:70px; 
		line-height:70px; 
		text-align:center; 
		background-color:#EFEFEF;
		border:1px solid gray;
		border-radius:10px;
		margin:10px; 
		float:left; 
	}
	
	/* ===================== 자녀 세부정보 ==================== */
	#childrenDetailDiv{width:100%; overflow:hidden; height:auto;}
	#childrenDetail{width:100%; overflow:hidden; height:auto;}
	#childrenDetail li{width:100%; overflow:hidden; height:auto; padding:10px; margin:10px 0; border:1px solid black; }
	.cn{width:20%; float:left;}
	.cntext{width:80%; padding:0 10px;}
	.cb{width:20%; float:left; margin-top:5px;}
	.cbtext{width:80%;margin-top:5px; padding:0 10px;}
	/* ===================== 자녀 세부정보 ==================== */
	
	/* =================== 희망급여 ==================== */
	#wageDiv{width:100%; overflow:hidden; height:auto;}
	
	#childrenInfo input[type=submit]{width:100%; height:50px; margin-top:30px;}
	
</style>

<script>
	$(function(){
		
		$(document).ready(function(){
			for(var i=1;i<5;i++){
				if($("#childrenInfo>input[id="+i+"]").is(":checked")){
					$("label[for="+i+"]").css("background-color", "#ff5400");
					$("#childrenDetail").html("");
					var tag = ""
					tag += "<li><span class='cn'>자녀 이름</span><input class='cntext' type='text' name='child_name' /><br/>";
					tag += "<span class='cb'>자녀 생년월일</span><input class='cbtext' type='date' name='child_birth' /></li>";
					for(var j=0;j<i;j++){
						$("#childrenDetail").append(tag);
					}
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		
		// 자녀 수 선택버튼 클릭
		$("#childrenInfo>input[type=radio]").change(function(){
			// 
			var childrenCnt = $(this).attr("id");
			childrenCnt = Number(childrenCnt);
			
			for(var i=1;i<5;i++){
				if($("input[id="+i+"]").is(":checked")){
					$("label[for="+i+"]").css("background-color", "#ff5400");
					$("#childrenDetail").html("");
					var tag = ""
					tag += "<li><span class='cn'>자녀 이름</span><input class='cntext' type='text' name='child_name' /><br/>";
					tag += "<span class='cb'>자녀 생년월일</span><input class='cbtext' type='date' name='child_birth' /></li>";
					for(var j=0;j<i;j++){
						$("#childrenDetail").append(tag);
					}
				}else{
					$("label[for="+i+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		$(":focus").blur();
	});
</script>
</head>
<body>
	<div class="container">
		<div id="header">몇 명의 아이를 돌봐드릴까요?</div>
		<div id="childrenInfo">
			<input type="radio" id="1" name="childrenCnt" />
			<input type="radio" id="2" name="childrenCnt" />
			<input type="radio" id="3" name="childrenCnt" />
			<input type="radio" id="4" name="childrenCnt" />
			<div id=childrenCnt>
				<div><label for="1">1명</label></div>
				<div><label for="2">2명</label></div>
				<div><label for="3">3명</label></div>
				<div><label for="4">4명</label></div>
			</div>
			<form action="<%=request.getContextPath()%>/parent/location">
				<div id="childrenDetailDiv">
					<ul id="childrenDetail"></ul>
				</div>
				<div id="wageDiv">
					<span>돌봄몬에게 지급할 희망시급을 적어주세요.</span>
					<input type="text" value="13000" name="wish_wage"/><span id="won">원</span>
				</div>
				<input type="submit" value="다음"/>
			</form>
		</div>
	</div>	
</body>
</html>