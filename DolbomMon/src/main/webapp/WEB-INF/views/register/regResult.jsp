<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${result>0 }">
	<script>
		alert("회원가입 성공");
		location.href = "<%=request.getContextPath()%>/";
	</script>
</c:if>
<c:if test="${result<=0 }">
	<script>
		alert("회원가입 실패");
		history.back();
	</script>
</c:if>

<c:if test="${imgresult>0 }">
	<script>
		alert("이미지 업로드 성공");
		location.href = "<%=request.getContextPath()%>/";
	</script>
</c:if>
<c:if test="${imgresult<=0 }">
	<script>
		alert("이미지 업로드 실패");
		history.back();
	</script>
</c:if>