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
	.container{width:600px; text-align:center;}
	
	/* ========================= 희망시급 ============================*/
	#paymentDiv{display:inline-block; width:90%; overflow:hidden; height:auto; text-align:center; margin-top:50px;}
	#paymentDiv img{width:157px; height:104px; margin:15px 0;}
	#paymentDiv div{width:100%; overflow:hidden; height:auto; text-align:center; background-color:#ff5400;}
	#paymentDiv input{width:100px; font-size:20px; text-align:right; padding:5px 10px; margin:5px 0; background-color:#ff5400; border:none;}
	#paymentDiv span{margin-left:5px; font-size:14px;}
	#paymentDiv label{margin:10px 0;}
	#paymentDiv p{display:inline-block; width:70%; margin-bottom:30px; font-size:14px; font-weight:bold; color:gray;}
	/* ========================= 희망시급 ============================*/
	
	hr{height:3px; background-color:#CCC; margin:30px 0;}
	
	/* ========================= cctv동의여부 ============================*/
	#cctvDiv{display:inline-block; width:90%; height:auto; text-align:center; }
	#cctvDiv label{width:100%;margin:0;padding:5px; text-align:left;}
	#cctvDiv>span{color:gray; font-size:14px;} 
	#cctvDiv input[type=radio]{margin:0 5px; line-height:58px;}
	label[for=Y]{}
	label[for=Y] span:nth-of-type(2){color:gray; font-size:14px; margin-left:26px; }
	label[for=N] span{}
	/* ========================= cctv동의여부 ============================*/
	
	input[type=submit]{width:90%; height:50px; margin-top:30px;}
	
</style>
<script>
	
</script>
</head>
<body>
	<div class="container">
		<form method="post" action="<%=request.getContextPath()%>/dbm/profileImage">
			<input type="text" name="dbm_type" value="${dbm_type }" />
			<input type="text" name="child_age" value="${child_age }" />
			<input type="text" name="care_type" value="${care_type }" />
			<input type="text" name="yoil" value="${yoil }" />
			<input type="text" name="start_time" value="${start_time }" />
			<input type="text" name="end_time" value="${end_time }" />
			<input type="text" name="start_date" value="${start_date }" />
			<input type="text" name="end_date" value="${end_date }" />
		
			<div id="paymentDiv">
				<h4>희망시급을 입력해주세요</h4>
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/s-membership-07-mainimage.svg" />
				<div>
					<input type="text" name="desired_wage" value="8,600" /><span>원/1시간</span>
				</div>
				<label for="avgWage"><input type="checkbox" id="avgWage"/>평균시급 적용</label>
				<p>
					아이 1명을 돌보는 경우 - 최저시급 8590원 이상 필수<br/>
					아이 2명을 돌보는 경우 - 희망시급의 1.5배 수준으로 합의
				</p>
			</div>
			<hr/>
			<div id="cctvDiv">
				<h5>CCTV 촬영 동의여부</h5>
				<span>동의할 경우 부모에게 더 많은 선택을 받게 됩니다.</span>
				<label for="Y"><input type="radio" id="Y" name="cctv" value="Y" checked="checked" /><span>CCTV가 있어도 당당히 일할 수 있습니다</span><br/><span>(단, 녹화된 영상을 유출 배포하지 않는 전제)</span></label>			
				<label for="N"><input type="radio" id="N" name="cctv" value="N" /><span>CCTV촬영을 원하지 않습니다.</span></label>			
			</div>
			<input type="submit" value="다음"/>
		</form>
	</div>
</body>
</html>