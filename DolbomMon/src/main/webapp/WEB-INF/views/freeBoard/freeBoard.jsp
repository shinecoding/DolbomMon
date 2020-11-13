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
	ul, li{
		margin: 0px;
		padding: 0px;
		list-style-type: none;
	}
	li{
		float: left;
		width: 10%;
		height: 40px;
		line-height: 40px;
		border-bottom: 1px solid gray;	
	}
	#lst>li:nth-child(5n+2){
		width: 55%;
	}
	#lst>tr:nth-child(5n+4){
		width: 15%;
	}
	.wordCut{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	#board{
		
	}
</style>
</head>
<body>
<div class="container">
<div id="top">
<b>자유게시판</b>
</div>
<div id="board">
<!--	<ul id="lst">
		<li>글번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<c:forEach var="vo" items="">
			<li>글번호</li>
			<li class="wordCut">제목</li>
			<li>작성자</li>
			<li>등록일</li>
			<li>조회수</li>
		</c:forEach> 
		
		<li>1</li>
		<li class="wordCut">제목제목제목</li>
		<li>홍길동</li>
		<li class="wordCut">16:15</li>
		<li>2</li>
		<li>2</li>
		<li class="wordCut">제목제목제목제목</li>
		<li>김길동</li>
		<li class="wordCut">11-12 12:15</li>
		<li>5</li>

	</ul> -->
	
<!-- <table class="table">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1<td/>
				<td class="wordCut">제목제목제목<td/>
				<td>홍길동<td/>
				<td>11-12 12:15<td/>
				<td>5<td/>
			</tr>
			<tr>
				<td>1<td/>
				<td class="wordCut">제목제목제목<td/>
				<td>홍길동<td/>
				<td>11-12 12:15<td/>
				<td>5<td/>
			</tr>
			<tr>
				<td>1<td/>
				<td class="wordCut">제목제목제목<td/>
				<td>홍길동<td/>
				<td>11-12 12:15<td/>
				<td>5<td/>
			</tr>
		</tbody>
	</table> -->
	
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
      <td><a href="#">글제목입니다111111</a></td>
      <td>홍길동</td>
      <td>13:11</td>
      <td>1</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>글제목입니다2222222</td>
      <td>Thornton</td>
      <td>11-11 15:11</td>
      <td>2</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">글제목입니다3333333</td>
      <td>11-10 22:10</td>
      <td>5</td>
    </tr>
  </tbody>
</table>

</div>






</div>
</body>
</html>