<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 800px;	
	}
	#top{
		margin: 20px;
		padding: 20px;
		text-align: center;
		font-size: 30px;
	}

</style>
</head>
<body>
<div class="container">
<div id="top">
<b>자유게시판</b>
</div>
<div>
	<a href="#">글쓰기</a>

</div>

<div id="board">
<br/>

	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td><a href="#">글제목입니다1111111글제목입니다1111111</a></td>
				<td>홍길동</td>
				<td>13:11</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>글제목입니다2222222</td>
				<td>정길동</td>
				<td>11-11 15:11</td>
				<td>2</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>글제목입니다3333333</td>
				<td>정길동</td>
				<td>11-10 13:51</td>
				<td>7</td>
			</tr>
		</tbody>
	</table>

</div>






</div>
</body>
</html>