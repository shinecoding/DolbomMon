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
	#paymentDiv img{width:30%; height:104px; margin:15px 0;}
	#paymentDiv div:nth-of-type(1){width:100%; overflow:hidden; height:auto; text-align:center; background-color:orange; border-radius:10px;}
	#paymentDiv input[type=number]{width:20%; font-size:20px; text-align:right; padding:5px 10px; margin:1% 0; background-color:orange; border-radius:10px;border:none;}
	#paymentDiv span{margin-left:1%; font-size:14px;}
	#paymentDiv label{margin:2% 0;}
	#paymentDiv p{display:inline-block; width:70%; margin-bottom:30px; font-size:14px; font-weight:bold; color:gray;}
	#paymentDiv input[type="number"]::-webkit-inner-spin-button { -webkit-appearance: none; -moz-appearance: none; appearance: none; }
	/* ========================= 희망시급 ============================*/
	
	hr{height:3px; background-color:#CCC; margin:30px 0;}
	
	/* ========================= cctv동의여부 ============================*/
	#cctvDiv{display:inline-block; width:90%; height:auto; text-align:center;}
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
	$(function(){
		$(document).on('keyup','input[inputmode=numeric]',function(event){
			this.value = this.value.replace(/[^0-9]/g,'');  
			this.value = this.value.replace(/,/g,'');  
			$("#avg_wage").prop("checked", false);
			if(this.value<8590){
				$(this).css("color", "gray");
				$("#minWage").html("최저시급(8590원)이상의 시급을 입력해주세요");
			}else {
				$(this).css("color", "white");
				$("#minWage").html("")
			}
		}); 
		
		$("input[id=avg_wage]").change(function(){
			if(this.checked){
				$("#desired_wage").val("8600");
			}else{
				
			}
		});
		
		$("#wpacFrm").submit(function(){
			
			var wage = $("#desired_wage").val();
			if(wage==null || wage==""){
				alert("시급을 입력해주세요");
				return false;
			}else if(wage<8590){
				alert("시급은 최소 8590원 이상이어야합니다.");
				return false;
			}
			return true;
			
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<form id="wpacFrm" method="post" action="<%=request.getContextPath()%>/dbm/profileImage">
		
			<div id="paymentDiv">
				<h4>희망시급을 입력해주세요</h4>
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/s-membership-07-mainimage.svg" />
				<div>
					<input type="number" inputmode="numeric" id="desired_wage" name="desired_wage" maxlength="6" value="8590" style="color:white;"/><span>원/1시간</span>
				</div>
				<span id="minWage" style="color:orange">
					
				</span>
				<div class="custom-control custom-switch" style="margin:15px 0; text-align:center;">
    					<input type="checkbox" class="custom-control-input" id="avg_wage" >
    					<label class="custom-control-label" for="avg_wage">평균시급 적용</label>
				</div>
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
			<input type="submit" class="btn" style="background-color:orange;"value="다음"/>
		</form>
	</div>
</body>
</html>