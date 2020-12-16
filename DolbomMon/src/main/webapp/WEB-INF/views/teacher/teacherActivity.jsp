<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
.container {
	width: 800px;
	text-align:center;
	font-family: 'Jua', sans-serif;
}

#title {
	margin: 20px 5px;
	display: block;
	width: 100%;
}

#titlefont {
	font-size: 25px;
	font-weight: 700;
	vertical-align: bottom;
	text-align: center;
}

#activityWarning {
	color: gray;
	text-align: center;
}

#activityHidden {
	overflow: hidden;
	height: 0px;
}

#shinsaenga, #yua, #younga, #chodeung {
	font-size: 40px;
	float: right;
	color: white;
}

input[type=submit] {
	position: relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top: 30px;
}
label{
width:24%;

}
img{
width:55px;
}

</style>

<script>
	$(function(){
	
		$("input[name=activity_type]").change(function(){
			var selectedData = $(this).attr("id");
			
			if($("input[id="+selectedData+"]").is(":checked")){
				var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
				if(selectedData=="act2"){
					var changeImg = nowImg.replace("-n@","-s@");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else if(selectedData=="act5"){
					var changeImg = nowImg.replace("-n-","-s-");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else{
					var changeImg = nowImg.replace("-n.","-s.");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}
			}else{
				var nowImg = $("label[for="+selectedData+"]").children("img").attr("src");
				if(selectedData=="act2"){
					var changeImg = nowImg.replace("-s@","-n@");
					$("label[for="+selectedData+"]").children("img").attr("src", changeImg);
				}else if(selectedData=="act5"){
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
</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
	<div class="container">
		<div id="title">
			<div id="titlefont">원하는 활동 수정</div>
		</div>
		<div class="m-2" id="activityWarning">
			<b>가능한 활동</b><br/>
			현재 놀이/학습 돌봄유형이므로 실내놀이와 책읽기 활동은 필수로 선택되어야 합니다<br/>
		</div>

		<form method="post" action="/dbmon/teacherActivityOk">
		<c:set var = "str" value = "${vo.activity_type}"/>
			<div id="activityHidden">
				<input type="checkbox" name="activity_type" value="등하원돕기" id="act1" alt="1" <c:if test = "${fn:contains(str, '등하원돕기')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="책읽기" id="act2" alt="1" <c:if test = "${fn:contains(str, '책읽기')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="실내놀이" id="act3" alt="1" <c:if test = "${fn:contains(str, '실내놀이')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="야외활동" id="act4" alt="1" <c:if test = "${fn:contains(str, '야외활동')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="한글놀이" id="act5" alt="1" <c:if test = "${fn:contains(str, '한글놀이')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="영어놀이" id="act6" alt="1" <c:if test = "${fn:contains(str, '영어놀이')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="학습지도" id="act7" alt="1" <c:if test = "${fn:contains(str, '학습지도')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="체육놀이" id="act8" alt="1" <c:if test = "${fn:contains(str, '체육놀이')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="간단 청소" id="act9" alt="1" <c:if test = "${fn:contains(str, '간단 청소')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="밥 챙겨주기" id="act10" alt="1" <c:if test = "${fn:contains(str, '밥 챙겨주기')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="간단 설거지" id="act11" alt="1" <c:if test = "${fn:contains(str, '간단 설거지')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="장기입주" id="act12" alt="1" <c:if test = "${fn:contains(str, '장기입주')}" > checked </c:if>/>
				<input type="checkbox" name="activity_type" value="단기입주" id="act13" alt="1" <c:if test = "${fn:contains(str, '단기입주')}" > checked </c:if>/>
			</div>

			<div id="actBox">
				<div class="row">
	   			<label for="act1"  ><img src=
	   			<c:if test = "${!fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-s.svg" </c:if>
	   			/><br/>등하원돕기</label>
	   			
	   			<label for="act2"><img src=
	   			<c:if test = "${!fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-n@2x.png" </c:if>
	   			<c:if test = "${fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-s@2x.png" </c:if>
	   			 /><br/>책읽기</label>
	   			 
	   			<label for="act3"><img src=
	   			<c:if test = "${!fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-s.svg" </c:if> 
	   			/><br/>실내놀이</label>
	   			
	   			<label for="act4" ><img src=
	   			<c:if test = "${!fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-s.svg" </c:if> 
	   			/><br/>야외활동</label>
	   			</div>
	   			
	   			<div class="row">
	   			<label for="act5"><img src=
	   			<c:if test = "${!fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-s-2.svg" </c:if>
	   			 /><br/>한글놀이</label>
				<label for="act6"><img src=
				 <c:if test = "${!fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg" </c:if> 
				<c:if test = "${fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-s.svg" </c:if> 
				/><br/>영어놀이</label>
				<label for="act7" ><img src=
				<c:if test = "${!fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-s.svg" </c:if>
				/><br/>학습지도</label>
				<label for="act8" ><img src=
				<c:if test = "${!fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-s.svg" </c:if>		
				/><br/>체육놀이</label>
	   			</div>
	   			
				<div class="row">   		
				<label for="act9"><img src=
				<c:if test = "${!fn:contains(str, '간단 청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '간단 청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-s.svg"</c:if>
				/><br/>간단 청소</label>
				<label for="act10" ><img src=
				<c:if test = "${!fn:contains(str, '밥 챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '밥 챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-s.svg"</c:if>
				/><br/>밥 챙겨주기</label>
				<label for="act11" ><img src=
				<c:if test = "${!fn:contains(str, '간단 설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '간단 설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-s.svg" </c:if>						
				/><br/>간단 설거지</label><br/>
				<label></label>
				</div>  
				
				<div class="row">   		
				<label for="act12"><img src=
				<c:if test = "${!fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-s.svg"</c:if>
				/><br/>장기입주</label>
				<label for="act13" ><img src=
				<c:if test = "${!fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"</c:if> 
				<c:if test = "${fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-s.svg"</c:if> 			
				/><br/>단기입주</label><br/>
				<label></label>
				<label></label>
	   			</div>
			</div>
			
			<input type="submit" class="btn btn-warning" value="저장" />
			</form>
		</div>

</body>
</html>
<jsp:include page="../footer.jsp"/>
