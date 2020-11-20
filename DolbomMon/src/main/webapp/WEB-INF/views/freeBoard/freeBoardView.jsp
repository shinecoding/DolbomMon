<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 	보기</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 900px;	
	}
	#top{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}	
</style>
<script>
	$(function(){
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="/dbmon/freeBoardDel?no=${vo.no}";
			}
			return false;
		});
	});
	
</script>
</head>
<body>
	<div class="container">
		<div id="top">
			<b>게시글 보기</b>
		</div>
		<table class="table" style="table-layout: fixed">
			<tbody>
				<tr>
					<th scope="col" width="130px">말머리</th>
					<td>${vo.head}</td>
				</tr>
				<tr>
					<th scope="col" width="130px">글제목</th>
					<td>${vo.subject}</td>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td>${vo.userid}</td>
				</tr>
				<tr>
					<th scope="col">등록일</th>
					<td>${vo.writedate}</td>
				</tr>
				<tr>
					<th scope="col">조회수</th>
					<td>${vo.hit}</td>
				</tr>
				<tr>
					<th scope="col">글내용</th>
					<td>
					<br/>${vo.content}<br/>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th scope="col">이전글</th>
					<td><a href="#">이전글 이전글 이전글</a></td>	
				</tr>
				<tr>
					<th scope="col">다음글</th>
					<td><a href="#">다음글 다음글 다음글</a></td>	
				</tr>
			</tfoot>
		</table>
		<div>
			<a class="btn btn-warning" href="/dbmon/freeBoardDel?no=${vo.no}" role="button" id="delBtn">삭제</a>
			<a class="btn btn-warning" href="/dbmon/freeBoardEdit?no=${vo.no}" role="button">수정</a>
			<a class="btn btn-warning" href="#" role="button">답변</a>
			<a class="btn btn-warning" href="/dbmon/freeBoard" role="button">목록</a>
		</div>
	</div>
</body>
</html>