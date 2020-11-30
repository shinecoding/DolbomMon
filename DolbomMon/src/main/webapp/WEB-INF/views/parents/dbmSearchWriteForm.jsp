<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dbmSearchWriteForm.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cff2cbe78d63774a9a2e7f0c1abec87&libraries=services"></script>
</head>
<script>
	$(function(){
		/////////////////// 페이지 로딩 시 //////////////////////
		$(document).ready(function(){
			for(var i=1;i<9;i++){
				var nowImg = $("label[for=pa"+i+"]").children("img").attr("src");
				if($("input[id=pa"+i+"]").is(":checked")){
					if(i=="2"){
						var changeImg = nowImg.replace("-n@", "-s@"); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
						$("label[for=pa"+i+"]").css("background-color", "#ff5400");
					}else{
						var changeImg = nowImg.replace("-n.", "-s."); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
						$("label[for=pa"+i+"]").css("background-color", "#ff5400");
					}
				}else{
					if(i=="2") {
						var changeImg = nowImg.replace("-s@", "-n@"); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
						$("label[for=pa"+i+"]").css("background-color", "#EFEFEF");
					}else{
						var changeImg = nowImg.replace("-s.", "-n."); 
						$("label[for=pa"+i+"]").children("img").attr("src", changeImg);
						$("label[for=pa"+i+"]").css("background-color", "#EFEFEF");
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
			
			for(var i=1;i<5;i++){
				if($("#childrenInfo>input[id=childrenCnt"+i+"]").is(":checked")){
					$("label[for=childrenCnt"+i+"]").css("background-color", "#ff5400");
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
			/////////////////// 페이지 로딩 시 //////////////////////
		});
		
		// 돌봄 유형 선택 시 색상 변경
		$("input[name=pw_activity]").change(function(){
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
		
		$("#childrenInfo>input[type=radio]").change(function(){
			for(var i=1;i<5;i++){
				if($("input[id=childrenCnt"+i+"]").is(":checked")){
					$("label[for=childrenCnt"+i+"]").css("background-color", "#ff5400");
					$("#childrenDetail").html("");
					var tag = ""
					tag += "<li><span class='cn'>자녀 이름</span><input class='cntext' type='text' name='child_name' /><br/>";
					tag += "<span class='cb'>자녀 생년월일</span><input class='cbtext' type='date' name='child_birth' /></li>";
					for(var j=0;j<i;j++){
						$("#childrenDetail").append(tag);
					}
				}else{
					$("label[for=childrenCnt"+i+"]").css("background-color", "#EFEFEF");
				}
			}
		});
		
		$("#zipcodeBtn").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	console.log("우편번호 => " + data.zonecode );
		        	console.log("도로명 주소 " + data.address )
		            console.log("시, 도 =>" + data.sido);
		            console.log("시군구 =>" + data.sigungu);
		            console.log("법정동명(동) => " + data.bname);
		            console.log("법정동명(읍, 면, 리) => " + data.bname1);
		            
		            var dongJuso = data.sido + " " + data.sigungu + " " + data.bname + " " + data.bname1;
		            console.log("동주소 =>" + dongJuso);
		            var geocoder = new kakao.maps.services.Geocoder();
		            
		            geocoder.addressSearch(dongJuso, function(result, status) {

		                // 정상적으로 검색이 완료됐으면 
		                 if (status === kakao.maps.services.Status.OK) {
							
							console.log("경도=> " + result[0].x);
							console.log("위도=> " + result[0].y);
		                	$("#lng").val(result[0].x);
		                	$("#lat").val(result[0].y);
		                } 
		            });
		           	window.close();
		        },theme:{
		        	searchBgColor: "#ff5400", //검색창 배경색
		            queryTextColor: "#FFFFFF" //검색창 글자색
		        }
		    }).open();
		});
		
		// 포커스 없애기
		$(":focus").blur();
	});

</script>
<body>
	<div class="container">
		<form method="post" action="<%=request.getContextPath()%>/dbmSearchWriteFormOk">
			<div id="header">
				<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/logo.png"/></a>
			</div>
			<div class="title">어떤 돌봄을 원하세요?</div>
			<input type="checkbox" id="pa1" name="pw_activity" value="실내놀이"/>		
			<input type="checkbox" id="pa2" name="pw_activity" value="등하원돕기"/>		
			<input type="checkbox" id="pa3" name="pw_activity" value="영어놀이"/>	
			<input type="checkbox" id="pa4" name="pw_activity" value="한글놀이"/>		
			<input type="checkbox" id="pa5" name="pw_activity" value="학습지도"/>	
			<input type="checkbox" id="pa6" name="pw_activity" value="야외활동"/>	
			<input type="checkbox" id="pa7" name="pw_activity" value="밥챙겨주기"/>	
			<input type="checkbox" id="pa8" name="pw_activity" value="책읽기"/>
			<div id="activityListDiv">
				<div><label for="pa1" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-indooricon-n.svg"/></label><span>실내놀이</span></div>
				<div><label for="pa2" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-guideicon-n@3x.png" style="width:38px; height:38px;"/></label><span>등하원돕기</span></div>
				<div><label for="pa3" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-englishicon-n.svg"/></label><span>영어놀이</span></div>
				<div><label for="pa4" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-koreanicon-n.svg"/></label><span>한글놀이</span></div>
				<div><label for="pa5" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-koreanicon-n.svg"/></label><span>학습지도</span></div>
				<div><label for="pa6" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-ousideicon-n.svg"/></label><span>야외활동</span></div>
				<div><label for="pa7" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-eaticon-n.svg"/></label><span>밥챙겨주기</span></div>
				<div><label for="pa8" ><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/p-membership-2-readicon-n.svg"/></label><span>책읽기</span></div>
			</div>
			
			<div id="ageDiv">
				<div class="title">	어느 나이대의 돌봄몬을 원하시나요?</div>
				<input type="checkbox" id="20" name="wish_age" value="20대" checked="checked"/>
				<input type="checkbox" id="30" name="wish_age" value="30대" checked="checked"/>
				<input type="checkbox" id="40" name="wish_age" value="40대" checked="checked"/>
				<input type="checkbox" id="50" name="wish_age" value="50대" />
				<input type="checkbox" id="60" name="wish_age" value="60대" />
				<ul>
					<li><label for="20">20</label></li>
					<li><label for="30">30</label></li>
					<li><label for="40">40</label></li>
					<li><label for="50">50</label></li>
					<li><label for="60">60</label></li>
				</ul>
			</div>
			
			<div class="title">자녀의 정보를 입력해주세요</div>
			<div id="childrenInfo">
				<input type="radio" id="childrenCnt1" name="childrenCnt"/>
				<input type="radio" id="childrenCnt2" name="childrenCnt"/>
				<input type="radio" id="childrenCnt3" name="childrenCnt"/>
				<input type="radio" id="childrenCnt4" name="childrenCnt"/>
				<div id=childrenCnt>
					<div><label for="childrenCnt1">1명</label></div>
					<div><label for="childrenCnt2">2명</label></div>
					<div><label for="childrenCnt3">3명</label></div>
					<div><label for="childrenCnt4">4명</label></div>
				</div>
				<div id="childrenDetailDiv">
					<ul id="childrenDetail"></ul>
				</div>
			</div>
			
			<div class="title">
				돌봄 장소를 입력해주세요<br/>
				<span style="color:gray;font-size:14px;">매칭이 되기전까지 자세한 위치는 보여지지 않습니다.</span>
			</div>
			<div>
				
			</div>
			<div id="zidcodeBtnDiv">
				<input type="button" id="zipcodeBtn" value="돌봄 장소를 입력해주세요" />
			</div>
			
			
			<div class="title">언제 돌봐드릴까요?</div>
			<div id="timeTypeDiv">
				<input type="radio" id="timeType1" name="timeType"/>
				<input type="radio" id="timeType2" name="timeType"/>
				<label for="timeType1">정기적으로</label>
				<label for="timeType2">특정날에만</label>
			</div>
			
			<div class="title">돌봄몬이 알아야 할 내용이 있나요?</div>
			<div id="descriptionDiv">
				<textarea name="content" placeholder="아이의  성격, 특이사항 등을 적어주세요."></textarea>
				<div id="warningDiv"><img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/s-membership-09-nono-icon.svg"/><p>자기소개 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</p></div>
			</div>
			
			<div class="title">입력한 정보를 확인 후 등록해주세요</div>
			<div style="text-align:center;"><input type="submit" value="등록하기" /></div>
			
			<div id="footer"></div>
		</form>
	</div>
</body>
</html>