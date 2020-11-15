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
	.subject{
		width: 400px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	 a:link, a:visited, a:hover{
	 	color: black;
	 }

	
</style>
</head>
<body>
<div class="container">
<div id="top">
<b>자유게시판</b>
</div>
<div>
	<a class="btn btn-warning" href="#" role="button">글쓰기</a>

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
				<td class="subject"><a href="#">글제목입니다1111111글제목입니다1111111</a></td>
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
				<th scope="row">3</th>
				<td>글제목입니다3333333</td>
				<td>정길동</td>
				<td>11-10 13:51</td>
				<td>7</td>
			</tr>
		</tbody>
	</table>
	<!--  
<div class="btn-group">
<button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
선택
</button>
<div class="dropdown-menu">
	<a class="dropdown-item" href="#">글제목</a>
	<a class="dropdown-item" href="#">작성자</a>
	<a class="dropdown-item" href="#">말머리</a>
</div> -->

<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
  <div class="input-group-append">
    <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
  </div>
</div>


	
</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>