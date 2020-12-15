<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:if test="${result>0}">
	<script>
		alert("글이 등록되었습니다.");
		location.href = "<%=request.getContextPath()%>/";
	</script>
</c:if>
<c:if test="${result<1}">
	<script>
		alert("글 등록 실패");
		history.back();
	</script>
</c:if>
<c:if test="${editResult>0 }">
	<script>
		alert("글이 수정되었습니다.");
		location.href = "<%=request.getContextPath()%>/parentView?no=${no}";
	</script>
</c:if>
<c:if test="${editResult<1 }">
	<script>
		alert("글이 수정실패.");
		location.href = "<%=request.getContextPath()%>/parentView?no=${no}";
	</script>
</c:if>