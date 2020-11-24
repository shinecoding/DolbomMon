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

#ageBox{height:auto;}

#ageWarning {
	color: gray;
	text-align: center;
}

#ageHidden {
	overflow: hidden;
	height: 0px;
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
cursor:pointer;
border-radius:5px;
}
</style>
<script>
$(function(){
	
	$("#ageBox label").click(function(){
		var selectedAge = $(this).attr("for");
		var alt = $("input[id='"+selectedAge+"']" ).attr("alt");

		if(alt=="1"){
			$(this).css("background-color", "orange");
			$("input[id='"+ selectedAge+"']").attr("alt", "2");
		}else if(alt=="2"){
			$(this).css("background-color", "white");
			$("input[id='"+ selectedAge +"']").attr("alt", "1");
		}
		
	});
	/*
	var age_list = [];
	$("input:submit").click(function(){
		
		$("input:checkbox[name='child_age']:checked").each(functioin(){
			age_list.push($(this).val());
		});
	});
	*/
});

</script>
</head>
<body>

	<div class="container">
		<form method="post" action="<%=request.getContextPath()%>/teacherAgeOk">
		<div id="title">
			<div id="titlefont">돌봄 가능 연령</div>
		</div>
		<div class="m-2" id="ageWarning">
			<b>돌봄 가능 연령</b><br /> 현재 놀이/학습 돌봄유형이므로 영아/유아/초등 중 1개 아이 연령은 필수로 선택되어야
			합니다<br />
		</div>
		
	
		 <c:set var = "str" value = "${vo.child_age}"/>
     	
		<div id="ageBox">
			<div id="ageHidden">
				<input type="checkbox" name="child_age" id="age1" value="신생아" alt="1"  />
				<input type="checkbox" name="child_age" id="age2" value="영아" alt="1" />
				<input type="checkbox" name="child_age" id="age3" value="유아" alt="1" />
				<input type="checkbox" name="child_age" id="age4" value="초등학생" alt="1"  />
			</div>

			<label for="age1" <c:if test = "${fn:contains(str, '신생아')}">style="background-color:orange"</c:if>><img src="icon/sitter-profile-age-new-off.svg" alt="신생아" /><br />신생아</label>
			<label for="age2" <c:if test = "${fn:contains(str, '영아')}">style="background-color:orange"</c:if>><img src="icon/sitter-profile-age-young-off.svg" alt="영아" /><br />영아</label>
			<label for="age3" <c:if test = "${fn:contains(str, '유아')}">style="background-color:orange"</c:if>><img src="icon/sitter-profile-age-child-off.svg" alt="유아" /><br />유아</label>
			<label for="age4" <c:if test = "${fn:contains(str, '초등학생')}">style="background-color:orange"</c:if>><img src="icon/sitter-profile-age-element-off.svg" alt="초등학생" /><br />초등학생</label>
		</div>



			<input type="submit" class="btn btn-warning" value="저장" />
		
		</form>
	</div>
		
</body>
</html>

