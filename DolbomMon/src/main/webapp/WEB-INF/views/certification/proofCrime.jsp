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
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

<style>
	.container{width:800px;
	font-family: 'Poor Story', cursive;
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
	#profBox{
	
	}
	#profIcon{
	width:120px;
	height:120px;
	position:absolute;
	}
	#profPlus{
	position: absolute;
	width:40px;
	height:40px;
	right:0;
	bottom:0;
	white-space:nowrap;
	vertical-align: middle;
	}
	#proofFile{
	opacity:0%;
	position:absolute;
	top:0;
	left:0;
	bottom:0;
	right:0;
	width:100%;
	height:100%
	}
	#teacherPicRed{
	text-decoration: underline;
	color:red;
	font-weight:bold;
	}
	input[type=submit]{
	position:relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top:30px;
	}
	.warning {
	color: gray;
	text-align: center;
	margin:5px;
}
	label{
	position: relative;
	background-color: orange;
	width:100%;
	height:50px;
	text-align:center;
	color:white;
	border-radius:10px;
	line-height:50px;
	}
	img{
	width:100%;
	display:block;
	}
	.certTime{
	position:relative;
	display:block;
	text-align:center;
	margin:10px;
	}
	select{
	padding:3px;
	border-radius:3px;
	border-color: gray;
	}
</style>	
</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">성범죄 경력 조회 인증</div>
	 	</div>
		<form method="post" action="/dbmon/proofCrimeOk" enctype="multipart/form-data">
			<div id="profBox">
				<div class="badge badge-warning">1번째</div>
				<div>성범죄 경력 조회 동의서를 사진으로 찍어서 올려주세요.<br/></div>
				<div class="warning">
				<i class="fas fa-exclamation-circle"></i>최근 6개월 이내에 발급된 경우만 인정됩니다.<br/>
				회원님의 개인정보 보호를 위해 주민등록번호 뒷자리를 꼭 가리고 보내주세요.<br/>
				(주민등록뒷자리 ‘미포함’ 선택 후 발급, 또는 해당부분 가린 후 촬영)<br/>
				<br/>
				
				<i class="fas fa-exclamation-circle"></i>사진첨부는 최대 5장까지 가능합니다.<br/>
				</div>
				
				
				<label for="proofFile">
					<i class="fas fa-upload"></i>사진 추가하기
					<input type="file" name="filename" id="proofFile" accept="image/*,application/pdf">
				</label>
				<img src="img/ex-cert-sexcrime.jpg" />
				
				<div class="badge badge-warning">2번째</div>
				<div>올리신 증명서에 적혀있는<br/>
					발급일자를 아래 입력칸에<br/>
					똑같이 입력해 주세요.<br/></div>
				
				<div class="certTime">
					<select name="crime_year">
					<% for(int i=2020; i>1900; i--){ %>
					<option><%=i%></option>
					<% }; %>
					</select>년
					<select name="crime_month">
					<c:forEach var="i" begin="1" end="12" >
						<option>${i}</option>
					</c:forEach>
					</select>월
					<select name="crime_day">
					<c:forEach var="i" begin="1" end="31" >
						<option>${i}</option>
					</c:forEach>
					</select>일
				</div>
					
				</div>		
				<input type="submit" class="btn btn-warning" value="신청" />
				
		</form>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>