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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	/* =============== 초기화 ============== */
	*{margin:0; padding:0;}
	.container{width:600px; padding:0;}
	/* =============== 초기화 ============== */
	
	/* =============== ㅎㄷ ============== */
	#headerDiv{width:100%; height:auto; margin-top:50px; text-align:center; font-size:25px; font-weight:bold;}
	/* =============== ㅎㄷ ============== */
	
	/* =============== 시간 선택 라디오버튼 ============== */
	.inputRadioDiv{width:100%; height:auto; padding:20px; border-bottom:1px solid gray;}
	.inputRagiodiv:last-child{border:1px solid gray;}
	label{margin:0px; width:100%; }
	input[type=checkbox]{display:none;}
	/* =============== 시간 선택 라디오버튼 ============== */
	/* ================ 시간 ======================*/
	span{margin-left:10px;color:gray;font-size:14px;}	
	
	/* ================ 시간 ======================*/
	input[type=submit]{width:100%; height:50px; margin-top:30px; background-color:orange;}
	
	div{-webkit-transition:background-color 0.5s;
		transition:background-color 0.5s;
		list-style:none;
		}
</style>
<script>
	$(function(){
		
		// 선택된 라디오 버튼에따라 링크 바꾸기
		$("input[type=radio]").change(function(){
			var selectedId = $(this).attr("id");
			console.log("sfs===" + selectedId);
			if(selectedId=="cr7") {
				$("form").attr("action", "<%=request.getContextPath()%>/dbm/schedule/detail");
			}else{
				$("form").attr("action", "<%=request.getContextPath()%>/dbm/wantedPaymentAndCCTV");
			}
			
			var selectedData = $("input[type=radio]:checked").attr("id");
			$("input[type=checkbox]").prop("checked", false);
			$("input[id="+selectedData+"]").prop("checked", true);
			
		});
		
		$("form>div").hover(function(){
			$(this).css("background-color", "#EFEFEF");			
		},function(){
			$(this).css("background-color", "white");			
		});
		
		$("#scheduleFrm").submit(function(){
			var data;
			$("input[name=yoil]").each(function(){
				if(this.checked){
					data += this.value;
				}
			});
			if(data==null||data==""){
				swal({
					title : "활동가능한 시간대를 선택해주세요",
					icon : "info"
				});
				return false;
			}
			return true;
		});
		
		var today = new Date();
		var endday = new Date(today.getFullYear(), today.getMonth()+3, today.getDate());
		console.log(today);
		console.log(endday);
		var ty = today.getFullYear();
		var tm = today.getMonth()+1;
		var td = today.getDate();
		
		var ey = endday.getFullYear();
		var em = endday.getMonth()+1;
		var ed = endday.getDate();
		
		$("#start_date").val(ty+"-"+tm+"-"+td);
		$("#end_date").val(ey+"-"+em+"-"+ed);
	});
</script>
</head>
<body>
	<div class="container">
		<div id="headerDiv">
			언제 활동할 수 있나요?
		</div>
		<form id="scheduleFrm" method="post" action="<%=request.getContextPath()%>/dbm/wantedPaymentAndCCTV">
		
			<input type="hidden" id="start_date" name="start_date" />
			<input type="hidden" id="end_date" name="end_date" />
			<div class="inputRadioDiv">
				<label for="wdAll"><input type="radio" id="wdAll" name="yoil" value="월,화,수,목,금"/>
								   <input type="checkbox" id="wdAll" name="start_time" value="08:00"/>
								   <input type="checkbox" id="wdAll" name="end_time" value="20:00"/>
				월~금 종일<span>오전 8시 - 저녁 8시</span></label>
			</div>
			<div class="inputRadioDiv">
				<label for="wdAM"><input type="radio" id="wdAM" name="yoil" value="월,화,수,목,금"/>
								  <input type="checkbox" id="wdAM" name="start_time" value="07:00"/>
								  <input type="checkbox" id="wdAM" name="end_time" value="14:00"/>
				월~금 오전<span>오전 7시 - 오후 2시</span></label>
			</div>
			<div class="inputRadioDiv">
				<label for="wdPM"><input type="radio" id="wdPM" name="yoil" value="월,화,수,목,금"/>
								  <input type="checkbox" id="wdPM" name="start_time" value="14:00"/>
								  <input type="checkbox" id="wdPM" name="end_time" value="22:00"/>
				월~금 오후<span>오후 2시 - 저녁 10시</span></label>
			</div>
			<div class="inputRadioDiv">
				<label for="weAll"><input type="radio" id="weAll" name="yoil" value="토,일"/>
								  <input type="checkbox" id="weAll" name="start_time" value="08:00"/>
								  <input type="checkbox" id="weAll" name="end_time" value="20:00"/>
				주말 종일<span>오전 8시 - 저녁 8시</span></label>
			</div>
			<div class="inputRadioDiv">
				<label for="cr7"><input type="radio" id="cr7" name="yoil" value="1"/> 내가 원하는 시간 직접 입력하기</label>
			</div>
			<input type="submit" class="btn" value="다음">
		</form>
	</div>
</body>
</html>