<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
<div>
	<form action='<c:url value='/board/boardInsert'/>' method="post">
	    <div class="form-group">
	        <label for="exampleFormControlInput1">받는이</label>
	        <input type="text" class="form-control" id="exampleFormControlInput1" name="crea_id" placeholder="이름을 적어주세요.">
		</div>
	    <div class="form-group">
	          <label for="exampleFormControlInput1">제목</label>
	        <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요.">
		</div>
		<div class="form-group">
	        <label for="exampleFormControlTextarea1">내용</label>
	        <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10"></textarea>
		</div>
	    <button type="submit" class="btn btn-info">등록하기</button>
	    <button type="button" class="btn btn-secondary">목록으로</button>
	</form>
</div>
</body>
</html>