<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>
	if("${msg}"=="true"){
		alert("성공적으로 관리자가 등록되었습니다.");
        onCloseSendResultToOpener()

	}else{
		alert("관리자 등록에 실패하였습니다. 양식을 확인하세요.");

	}
	
	function onCloseSendResultToOpener(){
		var childWindow = window.parent;
		var parentWindow = childWindow.opener;
		parentWindow.location.href = '/dbmon/management'
		childWindow.close();
	};
</script>
</head>
<body>

</body>
</html>