<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<style>
	body, html{
		margin:0;
		padding:0;
		background:lightgray;
	}
	div{
		margin:0;
		padding:0;
	}
	
</style>
<script>
$(function(){
	
	$(document).ready(function() {
		// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
		var strWidth;
		var strHeight;
		
		//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
		if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
		    strWidth = $('.mainP').outerWidth() + (window.outerWidth - window.innerWidth);
		    strHeight = $('.mainP').outerHeight() + (window.outerHeight - window.innerHeight);
		}
		else {
		    var strDocumentWidth = $(document).outerWidth();
		    var strDocumentHeight = $(document).outerHeight();
		
		    window.resizeTo ( strDocumentWidth, strDocumentHeight );
		
		    var strMenuWidth = strDocumentWidth - $(window).width();
		    var strMenuHeight = strDocumentHeight - $(window).height();
		
		    strWidth = $('.mainP').outerWidth() + strMenuWidth;
		    strHeight = $('.mainP').outerHeight() + strMenuHeight;
		}
		
		//resize 
		window.resizeTo( strWidth-110, strHeight-20 );
	});
	//$('#sub').click(function() { $('#memoFrom').submit(); });

	
	$('#sub').click(function(){
		self.close();
	});
		
});
</script>
</head>
<body>
	<div class="mainP" style="width:450px; margin:0 auto;">
		<textarea name="memo" class="form-control" style="width:100%; height:300px;" placeholder="탈퇴 신청 사유입니다.">${reason}</textarea>
		<input type="button" id="sub" value="확인" class="btn btn-info" style="width:100%">
	</div>
</body>
</html>