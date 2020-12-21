<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시글 보기</title>
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
	
	#reply{
		position: relative;
		width: 900px;
	}
	#replyBtn{
		float: rigth;
		position: absolute;
		left: 760px;
		top: 10px;
	}
	#replyListDiv{
		width: 850px;
	}
</style>

</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
	<div class="container">
		<div id="top">
			<b>Q&A 게시글 보기</b>
		</div>
		<table class="table" style="table-layout: fixed">
		
			<tbody>
				<tr>
					<th scope="col" width="130px">글 번호</th>
					<td>${qna_vo.seq}</td>
				</tr>
				<tr>
					<th scope="col" width="130px">자주 묻는 질문</th>
					<td>${qna_vo.subject}</td>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td>${qna_vo.userid}</td>
				</tr>
				<tr>
					<th scope="col">등록일</th>
					
					<td>${qna_vo.writedate}</td>
				</tr>
				<tr>
					<th scope="col">답변 내용</th>
					<td>
					<br/>${qna_vo.content}<br/>
					</td>
				</tr>
			</tbody>
			
		</table>
		<hr/>
		<br/>
		<div>
		<br/>
			
			
		</div>
	</div>
</body>
</html>
<jsp:include page="../footer.jsp"/>
