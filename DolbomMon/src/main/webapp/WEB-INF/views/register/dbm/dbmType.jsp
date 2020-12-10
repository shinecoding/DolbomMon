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
	.d1{width:100%; overflow:hidden; height:150px; margin-top:15px; border-top:1px solid black; border-bottom:1px solid black; cursor:pointer;}
	.d2{width:450px; height:150px; float:right; padding:20px;}
	label{cursor:pointer;}
	.dbmType{width:100%;font-size:20px;}
	.dt{width:100%; font-size:14px; color:gray;}
	
	#dbmTypeDiv input[type=submit]{width:100%; height:40px; margin-top:20px;}
	label{-webkit-transition:background-color 1s;
		transition:background-color 1s;}
	li{-webkit-transition:background-color 1s;
		transition:background-color 1s;}
	
	/* ==================== 라디오 버튼 ====================== */
</style>
<script>
	$(function(){
		// 페이지 로딩 시
		$(document).ready(function(){
			imgChange();
		});
		
		// 마우스오버 시
		$(".d1").hover(function(){
			$(this).css("background-color", "lightblue");
			
		}, function(){
			$(this).css("background-color", "white");
		});
		
		// 항목 클릭 시
		$(".d1").click(function(){
			var selectedData = $(this).children("label").attr("for");
			var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
			if(!$("input[id="+selectedData+"]").is(":checked")){
				$("input[id="+selectedData+"]").prop("checked", true);
				var changedImg = nowImg.replace("N.cr7", "Y.cr7");
				$("label[for="+selectedData+"]").children("img").attr("src", changedImg);
			}
			
			imgChange();
		});
		
		$("input[name=dbm_type]").change(function(){
			
			imgChange();
		});
		
		$("#dbmTypeFrm").submit(function(){
			var data = $("input[name=care_type]").val();
			if(data == null || data == ""){
				alert("유형을 선택해주세요");				
				return false;
			}
			return true;
		});
	});
	
	
	// 라디오버튼 상태에따라 이미지 변경해주는 함수
	function imgChange(){
		for(var i=1;i<5;i++){
			var nowImg = $("label[for=dt"+i+"]").children("img").attr("src");
			if($("input[id=dt"+i+"]").is(":checked")){
				// 체크 되어있는 경우
				var changedImg = nowImg.replace("N.cr7", "Y.cr7");
				$("label[for=dt"+i+"]").children("img").attr("src", changedImg);
			}else{
				// 체크 안 되어있는 경우
				var changedImg = nowImg.replace("Y.cr7", "N.cr7");
				$("label[for=dt"+i+"]").children("img").attr("src", changedImg);
			}
		}
	}
	
</script>
<body>
	<div class="container">
		<div id="top">
			당신은 어떤분 인가요?
		</div>
		<div id="dbmTypeDiv">
			<form id="dbmTypeFrm" method="post" action="<%=request.getContextPath()%>/dbm/activityAndAge">
				<input type="radio" name="teacher_type" id="dt1" value="선생님" />
				<input type="radio" name="teacher_type" id="dt2" value="대학생" />
				<input type="radio" name="teacher_type" id="dt3" value="엄마" />
				<input type="radio" name="teacher_type" id="dt4" value="일반" checked="checked" />
 				<div class="d1"><label for="dt1"><img src="<%=request.getContextPath()%>/icon/chkboxN.cr7.png" style="width:148px; height:148px;"/></label><div class="d2"><p class="dbmType">선생님</p><p class="dt">보육교사, 유치원정교사, 특수학교(유치원/초등)정교사, 초등학교정교사 자격증을 보유하고 있는 경우</p></div></div>
				<div class="d1"><label for="dt2"><img src="<%=request.getContextPath()%>/icon/chkboxN.cr7.png" style="width:148px; height:148px;"/></label><div class="d2"><p class="dbmType">대학생</p><p class="dt">현재 대학교에서 재학 및 휴학 중인 경우</p></div></div>
				<div class="d1"><label for="dt3"><img src="<%=request.getContextPath()%>/icon/chkboxN.cr7.png" style="width:148px; height:148px;"/></label><div class="d2"><p class="dbmType">엄마</p><p class="dt">본인의 아이를 키우며 육아 경험이 있는 경우</p></div></div>
				<div class="d1"><label for="dt4"><img src="<%=request.getContextPath()%>/icon/chkboxN.cr7.png" style="width:148px; height:148px;"/></label><div class="d2"><p class="dbmType">일반</p><p class="dt">위 3가지 경우에 속하지 않지만 돌봄몬으로 활동하고 싶은 경우</p></div></div>
				<input type="submit" class="btn" style="background-color:orange;margin-bottom:100px;" value="다음" />
			</form>
		</div>
	</div>
</body>
</html>