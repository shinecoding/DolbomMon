<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


<style>
	.container{width:800px;
}
	
	#title{
		margin:20px 5px;
		display:block;
	width:100%;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	#teacherWageBox{
	position:relative;
	left: calc(50% - 100px);
	margin-top:30px;
	
	}
	#coinIcon{
	font-size: 50px;
	color:orange;
	display: flex;
	justify-content:center;
	
	}
	#checkDiv{
	position:relative;
	left: calc(50% - 100px);
	}
	
	input[type=number]{
	border-color: orange;
	display:inline-block;
	width:200px;
	text-align:right;
	}
	input[type=submit]{
	position:relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top:30px;
	}
	#wageWarning{
		margin-top:30px;
		color:gray;
		text-align:center;
	}
</style>	
<script>
	
	$(function(){
		//최저시급 보여주기==========
		function minCheck(){
			if( $("#minWageChk").prop("checked") ){
				$("#desired_wage").val("8600");
			}
		}
		 $("#minWageChk").change(function(){
			minCheck();
		});
	

		
	});
</script>
</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
</div>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">희망 시급</div>
	 	</div>
	 	<i id="coinIcon" class="fas fa-coins"></i>
		<form method="POST" action="teacherWageOk">
			<div class="form-group">		
				<div id="teacherWageBox"><input type="number" id="desired_wage" name="desired_wage" class="form-control" />원/1시간
				</div>
				
				<div id="checkDiv"><input type="checkbox" id="minWageChk"/>평균시급 적용</div>
				
				<div class="m-2" id="wageWarning">
				아이 1명을 돌보는 경우,<br/>
				= 최저시급 8,590원 이상 필수<br/><br/>

				아이 2명을 돌보는 경우,<br/>
				= 최저시급 8,590원 X 1.5배 = 12,885원 이상 필수<br/>
				</div>
				<input type="submit" class="btn btn-warning" value="저장" />
			</div>
		</form>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>