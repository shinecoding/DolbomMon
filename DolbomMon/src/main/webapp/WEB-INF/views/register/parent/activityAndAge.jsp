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
	/* ============= 초기화 ==============  */
	*{margin:0; padding:0; list-style:none; text-decoration:none;}
	.container{width:600px; margin-top:100px;}
	/* ============= 초기화 ==============  */
	
	/* ============= 헤더 =============== */
	#header{ padding:10px;}
	#header img{width:50%; height:130px; display:block; margin:0 auto;}
	#header>div{text-align:center; font-size:2em; }
	/* ============= 헤더 =============== */
	
	/* ============= 돌봄 유형 목록 ============== */
	#activityListDiv{overflow:hidden; height:auto;}
	#activityListDiv div{overflow:hidden; width:25%; height:105px; text-align:center; float:left; padding:23px 40px;}
	#activityListDiv img{margin-top:10px;}
	#activityListDiv label{width:100%; height:100%; margin:0; text-align:center; background-color:#EFEFEF; border-radius:50%;}
	#activityListDiv>div span{font-size:12px;}
	/* ============= 돌봄 유형 목록 ============== */
	
	/* ============= 원하는 선생님 나이 선택 ================ */
	#ageDiv{overflow:hidden; height:auto; margin-top:40px;}
	#ageDivTitle{text-align:center; font-size:2em;}
	#ageDiv ul{overflow:hidden; width:65%; margin:0 auto;}
	#ageDiv li{width:20%; height:50px; line-height:50px; float:left; margin:10px 0; border:1px solid black; border-radius:20px; background-color:#EFEFEF; color:black; font-weight:bold; }
	#ageDiv label{width:100%; height:100%; text-align:center; }
	#ageDiv>input[type=submit]{width:100%; height:40px; margin-top:30px;}
	/* ============= 원하는 선생님 나이 선택 ================ */
	
</style>
<script>
	$(function(){
		$(document).ready(function(){
			for(var i=1;i<9;i++){
				var nowImg = $("label[for="+i+"]").children("img").attr("src");
				if($("input[id="+i+"]").is(":checked")){
					if(i=="2"){
						var changeImg = nowImg.replace("-n@", "-s@"); 
						$("label[for="+i+"]").children("img").attr("src", changeImg);
						$("label[for="+i+"]").css("background-color", "#ff5400");
					}else{
						var changeImg = nowImg.replace("-n.", "-s."); 
						$("label[for="+i+"]").children("img").attr("src", changeImg);
						$("label[for="+i+"]").css("background-color", "#ff5400");
					}
				}else{
					if(i=="2") {
						var changeImg = nowImg.replace("-s@", "-n@"); 
						$("label[for="+i+"]").children("img").attr("src", changeImg);
						$("label[for="+i+"]").css("background-color", "#EFEFEF");
					}else{
						var changeImg = nowImg.replace("-s.", "-n."); 
						$("label[for="+i+"]").children("img").attr("src", changeImg);
						$("label[for="+i+"]").css("background-color", "#EFEFEF");
					}
				}
			}
			
			for(var i=2;i<7;i++){
				if($("input[id="+i+"0]").is(":checked")){
					$("label[for="+i+"0]").parent().css("background-color", "#ff5400").css("color", "white");
				}else{
					$("label[for="+i+"0]").parent().css("background-color", "#EFEFEF").css("color", "black");
				}
			}
		});
		
		// 돌봄 유형 선택 시 색상 변경
		$("input[name=activity]").change(function(){
			var selectedData = $(this).attr("id");
			var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
			if($(this).is(":checked")){
				if(selectedData=="2"){
					var changeImg = nowImg.replace("-n@", "-s@"); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					$("label[for="+selectedData+"]").css("background-color", "#ff5400");
				}else{
					var changeImg = nowImg.replace("-n.", "-s."); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					$("label[for="+selectedData+"]").css("background-color", "#ff5400");
				}
			}else{
				if(selectedData=="2") {
					var changeImg = nowImg.replace("-s@", "-n@"); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					$("label[for="+selectedData+"]").css("background-color", "#EFEFEF");
				}else{
					var changeImg = nowImg.replace("-s.", "-n."); 
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
					$("label[for="+selectedData+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		
		$("input[name=wish_age]").change(function(){
			
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				
				$("label[for="+selectedData+"]").parent().css("background-color", "#ff5400").css("color", "white");
			}else{
				
				$("label[for="+selectedData+"]").parent().css("background-color", "#EFEFEF").css("color", "black");
			}
			
		});
		
		
		// 포커스 없애기
		$(":focus").blur();
	});

</script>
</head>
<body>
	<div class="container">
		<form method="get" action="<%=request.getContextPath()%>/parent/children">
			<div id="header">
				<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/logo.png"/></a>
				<div id="headerTxt">어떤 돌봄을 원하세요?</div>
			</div>
				<input type="checkbox" id="1" name="activity" value="실내놀이"/>		
				<input type="checkbox" id="2" name="activity" value="등하원돕기"/>		
				<input type="checkbox" id="3" name="activity" value="영어놀이"/>	
				<input type="checkbox" id="4" name="activity" value="한글놀이"/>		
				<input type="checkbox" id="5" name="activity" value="학습지도"/>	
				<input type="checkbox" id="6" name="activity" value="야외활동"/>	
				<input type="checkbox" id="7" name="activity" value="밥챙겨주기"/>	
				<input type="checkbox" id="8" name="activity" value="책읽기"/>
			<div id="activityListDiv">
				<div><label for="1" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-indooricon-n.svg"/></label><span>실내놀이</span></div>
				<div><label for="2" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-guideicon-n@3x.png" style="width:38px; height:38px;"/></label><span>등하원돕기</span></div>
				<div><label for="3" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-englishicon-n.svg"/></label><span>영어놀이</span></div>
				<div><label for="4" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-koreanicon-n.svg"/></label><span>한글놀이</span></div>
				<div><label for="5" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-koreanicon-n.svg"/></label><span>학습지도</span></div>
				<div><label for="6" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-ousideicon-n.svg"/></label><span>야외활동</span></div>
				<div><label for="7" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-eaticon-n.svg"/></label><span>밥챙겨주기</span></div>
				<div><label for="8" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-readicon-n.svg"/></label><span>책읽기</span></div>
			</div>
			<div id="ageDiv">
				<div id="ageDivTitle">
					어느 나이대의 돌봄몬을 원하시나요?
				</div>
				<input type="checkbox" id="20" name="wish_age" value="20" checked="checked"/>
				<input type="checkbox" id="30" name="wish_age" value="30" checked="checked"/>
				<input type="checkbox" id="40" name="wish_age" value="40" checked="checked"/>
				<input type="checkbox" id="50" name="wish_age" value="50" />
				<input type="checkbox" id="60" name="wish_age" value="60" />
				<ul>
					<li><label for="20">20</label></li>
					<li><label for="30">30</label></li>
					<li><label for="40">40</label></li>
					<li><label for="50">50</label></li>
					<li><label for="60">60</label></li>
				</ul>
				<input type="submit" value="다음" />
			</div>
		</form>
	</div>
</body>
</html>