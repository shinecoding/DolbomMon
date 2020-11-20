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
	*{margin:0; padding:0;}
	.container{width:600px; padding:0px;}
	/* ================== 상단 =====================*/
	#top{width:100%; overflow:hidden; height:auto; margin-top:30px; text-align:center; font-size:3em;}
	/* ================== 상단 =====================*/
	/* ==================== 라디오 버튼 ====================== */
	#dbmTypeDiv input[type=radio]{display:none;}
	.d1{width:100%; overflow:hidden; height:150px; margin-top:15px; border-top:1px solid black; border-bottom:1px solid black;}
	.d2{width:450px; height:150px; float:right; padding:20px;}
	
	.dbmType{width:100%;font-size:20px;}
	.dt{width:100%; font-size:14px; color:gray;}
	
	#dbmTypeDiv input[type=submit]{width:100%; height:40px; margin-top:20px;}
	
	
	/* ==================== 라디오 버튼 ====================== */
</style>
<script>
	$(function(){
		$(".d1").hover(function(){
			$(this).css("background-color", "lightblue");
			
		}, function(){
			$(this).css("background-color", "white");
		});
		
		$(".d1").click(function(){
			var selectedData = $(this).children("label").attr("for");
			$("input[id="+selectedData+"]").prop("checked", true);
		});
		
		
		
	});
	
</script>
<body>
	<div class="container">
		<div id="top">
			당신은 어떤분 인가요?
		</div>
		<div id="dbmTypeDiv">
			<form action="<%=request.getContextPath()%>/dbm/activityAndAge">
				<input type="radio" name="dbmType" id="dt1" value="선생님" />
				<input type="radio" name="dbmType" id="dt2" value="대학생" />
				<input type="radio" name="dbmType" id="dt3" value="엄마" />
				<input type="radio" name="dbmType" id="dt4" value="일반" />
 				<div class="d1"><label for="dt1"><img src="<%=request.getContextPath()%>/img/chkboxN@#.png" style="width:150px; height:150px;"/></label><div class="d2"><p class="dbmType">선생님</p><p class="dt">보육교사, 유치원정교사, 특수학교(유치원/초등)정교사, 초등학교정교사 자격증을 보유하고 있는 경우</p></div></div>
				<div class="d1"><label for="dt2"><img src="<%=request.getContextPath()%>/img/chkboxN@#.png" style="width:150px; height:150px;"/></label><div class="d2"><p class="dbmType">대학생</p><p class="dt">현재 대학교에서 재학 및 휴학 중인 경우</p></div></div>
				<div class="d1"><label for="dt3"><img src="<%=request.getContextPath()%>/img/chkboxN@#.png" style="width:150px; height:150px;"/></label><div class="d2"><p class="dbmType">엄마</p><p class="dt">본인의 아이를 키우며 육아 경험이 있는 경우</p></div></div>
				<div class="d1"><label for="dt4"><img src="<%=request.getContextPath()%>/img/chkboxN@#.png" style="width:150px; height:150px;"/></label><div class="d2"><p class="dbmType">일반</p><p class="dt">위 3가지 경우에 속하지 않지만 돌봄몬으로 활동하고 싶은 경우</p></div></div>
				<input type="submit" value="다음" />
			</form>
		</div>
	</div>
</body>
</html>