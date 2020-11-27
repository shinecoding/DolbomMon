<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정하기</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
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
	#content{
		height: 300px;
	}
	#post{
		width: 80px;
		display: block;
		margin: 0 auto;
	}
</style>
<script>
$(function(){
	CKEDITOR.replace("content");
	
	$("#freeBoardEditFrm").submit(function(){
		if($("#subject").val()==""){
			alert("글제목을 입력하세요.");
			$("#subject").focus();
			return false;
			
		}
		if(CKEDITOR.instances.content.getData()==""){
			alert("글내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		return true;
	});
});

</script>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<div class="container">
<div id="top">
<b>게시판 글 수정하기</b>
</div>
	<form method="post" action="/dbmon/freeBoardEditOk" id="freeBoardEditFrm">
		<input type="hidden" name="no" value="${vo.no}"/>
		<div class="form-group">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary" type="button">말머리</button>
				</div>
				<select class="custom-select" name="head" id="head" aria-label="Example select with button addon">	
					<option selected>부모님 이야기</option>
					<option>선생님 이야기</option>
					<option>아이들 이야기</option>
					<option>사담</option>
				</select>
			</div>
	 		<label for="subject">제목</label>
			<input type="text" maxlength="60" class="form-control" id="subject" name="subject" value="${vo.subject}"><br/>
			<div>
			<label for="content">글내용</label><br/>
				<textarea class="form-control" id="content" name="content">${vo.content}</textarea>
			</div>
			<br/>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary" type="button" id="inputGroupFile">Upload</button>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="inputFile" aria-describedby="inputGroupFileAddon03">
					<label class="custom-file-label" for="inputFile">파일을 선택하세요</label>
				</div>
			</div>			
			<!-- <input type="submit" id="post" class="btn btn-warning" value="등록"/> -->
		 	<input type="submit" class="btn btn-warning btn-lg btn-block" value="등록"/>
		</div>
	</form>
</div>
</body>
</html>