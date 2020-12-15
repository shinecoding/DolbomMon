<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${result>0}">
	<script>
		alert("계약서를 보냈습니다.");
		window.close();
	</script>
</c:if>
<c:if test="${result<1}">
	<script>
		alert("계약서 보내기 실패");
		history.back();
	</script>
</c:if>
<c:if test="${result2>=1}">
	<script>
		alert("이미 진행중인 계약이 있습니다. 게시글 하나당 하나의 계약만 동시에 진행 가능합니다.");
		window.close();
	</script>
</c:if>
<c:if test="${result3>=1}">
	<script>
		alert("계약서를 수락하였습니다.");
		window.close();
	</script>
</c:if>
<c:if test="${result3==0}">
	<script>
		alert("계약서 수락에 실패하였습니다. 고객센터에 문의하세요.");
		window.close();
	</script>
</c:if>
<c:if test="${result4>=1}">
	<script>
		alert("계약서를 거절하였습니다.");
		window.close();
	</script>
</c:if>
<c:if test="${result4==0}">
	<script>
		alert("계약서 거절에 실패하였습니다. 고객센터에 문의하세요.");
		window.close();
	</script>
</c:if>
<c:if test="${result5>=1}">
	<script>
		alert("계약서가 없습니다.");
		window.close();
	</script>
</c:if>
