<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
.container {
	width: 800px;
	text-align:center;
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
</style>
</head>
<body>

	<div class="container">
		<div id="title">
			<div id="titlefont">원하는 활동 수정</div>
		</div>
		<div class="m-2" id="activityWarning">
			<b>가능한 활동</b><br/>
			현재 놀이/학습 돌봄유형이므로 실내놀이와 책읽기 활동은 필수로 선택되어야 합니다<br/>
		</div>


			<div id="activityHidden">
				<input type="radio" name="tActivity" id="indoor" />
				
			</div>

			<label for="shinsaenga"><img src="icon/sitter-profile-age-new-off.svg" alt="신생아" /><br />신생아</label>
			<label for="younga"><img src="icon/sitter-profile-age-young-on.svg" alt="영아" /><br />영아</label>
			<label for="yua"><img src="icon/sitter-profile-age-child-on.svg" alt="유아" /><br />유아</label>
			<label for="chodeung"><img src="icon/sitter-profile-age-element-on.svg" alt="초등학생" /><br />초등학생</label>




			<input type="submit" class="btn btn-warning" value="저장" />
		</div>
</body>
</html>

