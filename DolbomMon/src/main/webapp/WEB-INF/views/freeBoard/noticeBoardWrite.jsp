<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
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
	//ckeditor를 textarea와 연결하기
	CKEDITOR.replace("content",{filebrowserUploadUrl:'/dbmon/imageUpload.do'});
	//데이터 입력유무 확인
	$("#noticeBoardFrm").submit(function(){
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
<br/>
<div class="container">
<div id="top">
<b>게시판 글쓰기</b>
</div>
	<form method="post" action="/dbmon/noticeBoardWriteOk" id="noticeBoardFrm" enctype="multipart/form-data">
		<div style="float: right; margin: 10px;">
			<div class="form-check">
				<input class="form-check-input" type="radio" value="Y" id="expose1" name="expose">
				<label class="form-check-label" for="expose">
					공지사항 등록하기
				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" value="N" id="expose2" name="expose" checked>
				<label class="form-check-label" for="expose">
					공지사항 숨기기
				</label>
			</div>
			</div>
			<br/>
			<br/>
			<br/>
		<div class="form-group">
	 		<label for="subject">제목</label>
			<input type="text" maxlength="60" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요"><br/>
			<div>
				<label for="content">글내용</label><br/>
				<textarea class="form-control" id="content" name="content" placeholder="글내용을 입력하세요"></textarea>
			</div>
			<br/>
			<div>
				<input type="file" id="filename" name="filename">
				<input type="file" id="filename" name="filename">
			</div>
			<br/>
		 	<input type="submit" class="btn btn-warning btn-lg btn-block" value="등록"/>
		</div>
	</form>
</div>
</body>
</html>