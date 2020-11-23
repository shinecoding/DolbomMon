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
</head>
<body>
	
	<div>

		<form method="post" action="<%=request.getContextPath()%>/dbm/schedule">
		
			<input type="text" name="dbm_type" value="${dbm_type }" />
			<input type="text" name="child_age" value="${child_age }" />
			<input type="text" name="care_type" value="${care_type }" />
			
			<!-- 돌봄몬은 지역 3개 선택 (학부모는 1개) -->
			<h1>활동하고 싶은 지역을 선택해주세요</h1>
			<input type="submit" value="다음"/>
		</form>
	</div>
</body>
</html>