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
	.container{width:800px;}
	
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
	border-color: orange;
	display: flex;
	justify-content:center;
	width:200px;
	}
	.fa-coins{
	font-size: 50px;
	color:orange;
	display: flex;
	justify-content:center;
	
	}
	input[type="submit"]{
	display: flex;
	justify-content:center;
	
	}
	#wageWarning{
		color:gray;
		text-align:center;
	}
</style>	
</head>
<body>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">희망 시급</div>
	 	</div>
	 	<i id="coinIcon" class="fas fa-coins"></i>
		<form method="get" action="">
			<div class="form-group">
				<div class="row">
				<input type="tel" class="form-control d-flex justify-content-center" id="teacherWageBox" />
				<span>원/1시간</span>
				</div>
				<input type="checkbox"/>평균시급 적용
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

</body>
</html>