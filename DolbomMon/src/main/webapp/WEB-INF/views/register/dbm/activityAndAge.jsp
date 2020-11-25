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
	/* ================== 초기화 ==================*/
	*{margin:0; padding:0; text-decoration:none; list-style:none;}
	.container{width:600px; padding:0px;}
	/* ================== 초기화 ==================*/
	
	/* ================== 돌볼 수 있는 아이의 나이 ================== */
	#childrenAgeHeader{width:100%; overflow:hidden; height:auto; margin-top:40px; text-align:center; font-size:2em;}
	#childrenAgeDiv{width:100%; overflow:hidden; height:auto; margin-top:30px; }	
	#childrenAgeDiv input[type=checkbox]{display:none;}
	#childrenAgeDiv div{width:25%; overflow:hidden; height:auto; padding:10px; float:left; text-align:center;}
	#childrenAgeDiv div>label{display:inline-block; width:auto; height:auto;}
	/* ================== 돌볼 수 있는 아이의 나이 ================== */
	
	/* ================== 가능한 돌봄유형 ====================*/
	#careTypeHeader{width:100%; overflow:hidden; height:auto; margin-top:30px; text-align:center; font-size:2em;}
	#careTypeDiv{width:100%; overflow:hidden; height:auto; margin-top:30px;}
	#careTypeDiv input[type=checkbox]{display:none;}
	#careTypeDiv div{width:25%; height:120px; padding:10px; float:left; text-align:center;}
	#careTypeDiv div:nth-of-type(12){clear:left;}
	/* ================== 가능한 돌봄유형 ====================*/
	label{margin:0; color:black;}
	/* ============= */
	form{text-align:center;}
	input[type=submit]{width:80%; height:40px; margin-top:15px;}
</style>
<script>
	$(function(){
		$(document).ready(function() {
			
			for(var i=1;i<14;i++){
				var selectedData = $("input[id="+i+"]").attr("id");
				
				if($("input[id="+selectedData+"]").is(":checked")){
					var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
					if(selectedData=="2"){
						var changeImg = nowImg.replace("-n@","-s@");
						$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					}else if(selectedData=="5"){
						var changeImg = nowImg.replace("-n-","-s-");
						$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					}else{
						var changeImg = nowImg.replace("-n.","-s.");
						$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					}
				}else{
					var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
					if(selectedData=="2"){
						var changeImg = nowImg.replace("-s@","-n@");
						$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					}else if(selectedData=="5"){
						var changeImg = nowImg.replace("-s-","-n-");
						$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					}else{
						var changeImg = nowImg.replace("-s.","-n.");
						$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					}
				}
			}
			
			for(var i=1;i<5;i++){
				var selectedData = $("input[id=age"+i+"]").attr("id");
				
				if($("input[id="+selectedData+"]").is(":checked")){
					var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
					var changeImg = nowImg.replace("-n.","-s.");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else{
					var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
					var changeImg = nowImg.replace("-s.","-n.");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}
			}
		});
		
		// 돌봄몬 - 돌볼 수 있는 아이의 연령대
		$("input[name=child_age]").change(function(){
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
				var changeImg = nowImg.replace("-n.","-s.");
				$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
			}else{
				var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
				var changeImg = nowImg.replace("-s.","-n.");
				$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
			}
		});
		
		// 돌봄몬 - 가능한 활동
		$("input[name=activity_type]").change(function(){
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
				if(selectedData=="2"){
					var changeImg = nowImg.replace("-n@","-s@");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else if(selectedData=="5"){
					var changeImg = nowImg.replace("-n-","-s-");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else{
					var changeImg = nowImg.replace("-n.","-s.");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}
			}else{
				var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
				if(selectedData=="2"){
					var changeImg = nowImg.replace("-s@","-n@");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else if(selectedData=="5"){
					var changeImg = nowImg.replace("-s-","-n-");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else{
					var changeImg = nowImg.replace("-s.","-n.");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}
			}
		});
		
		
		
	});
</script>
<body>
	<div class="container">
		<form method="post" action="<%=request.getContextPath()%>/dbm/location">
			<div id="childrenAgeHeader">어떤 아이를 돌볼 수 있나요?</div>
			<div id="childrenAgeDiv">
				<input type="checkbox" id="age1" value="신생아" name="child_age" />
				<input type="checkbox" id="age2" value="영아" name="child_age" checked="checked"/>
				<input type="checkbox" id="age3" value="유아" name="child_age" checked="checked"/>
				<input type="checkbox" id="age4" value="초등학생" name="child_age" />
				<div><label for="age1"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-n.svg"/><br/><span>신생아</span></label></div>
				<div><label for="age2"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-n.svg"/><br/><span>영아</span></label></div>
				<div><label for="age3"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-n.svg"/><br/><span>유아</span></label></div>
				<div><label for="age4"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-n.svg"/><br/><span>초등학생</span></label></div>
			</div>
			<div id="careTypeHeader">어떤 활동을 할 수 있나요?</div>
			<div id="careTypeDiv">
				<input type="checkbox" id="1" value="실내놀이" name="activity_type" checked="checked"/>
				<input type="checkbox" id="2" value="등하원돕기" name="activity_type" checked="checked"/>
				<input type="checkbox" id="3" value="책읽기" name="activity_type" checked="checked"/>
				<input type="checkbox" id="4" value="야외활동" name="activity_type" />
				<input type="checkbox" id="5" value="한글놀이" name="activity_type" />
				<input type="checkbox" id="6" value="영어놀이" name="activity_type" />
				<input type="checkbox" id="7" value="학습지도" name="activity_type" />
				<input type="checkbox" id="8" value="체육놀이" name="activity_type" />
				<input type="checkbox" id="9" value="간단청소" name="activity_type" />
				<input type="checkbox" id="10" value="밥챙겨주기" name="activity_type" />
				<input type="checkbox" id="11" value="간단설거지" name="activity_type" />
				<input type="checkbox" id="12" value="장기입주" name="activity_type" />
				<input type="checkbox" id="13" value="단기입주" name="activity_type" />
				<div><label for="1"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg"/><br/><span>실내놀이</span></label></div>
				<div><label for="2"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-n@2x.png" style="width:56px; height:56px;"/><br/><span>등하원돕기</span></label></div>
				<div><label for="3"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg"/><br/><span>책읽기</span></label></div>
				<div><label for="4"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg"/><br/><span>야외활동</span></label></div>
				<div><label for="5"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg"/><br/><span>한글놀이</span></label></div>
				<div><label for="6"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg"/><br/><span>영어놀이</span></label></div>
				<div><label for="7"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg"/><br/><span>학습지도</span></label></div>
				<div><label for="8"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg"/><br/><span>체육놀이</span></label></div>
				<div><label for="9"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"/><br/><span>간단 청소</span></label></div>
				<div><label for="10"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"/><br/><span>밥 챙겨주기</span></label></div>
				<div><label for="11"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg"/><br/><span>간단 설거지</span></label></div>
				<div><label for="12"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"/><br/><span>장기입주</span></label></div>
				<div><label for="13"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"/><br/><span>단기입주</span></label></div>
			</div>
			<input type="submit" value="다음" />
		</form>
	</div>
</body>
</html>