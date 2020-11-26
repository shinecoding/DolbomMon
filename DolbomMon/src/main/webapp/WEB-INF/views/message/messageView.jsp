<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script>
	var strWidth;
	var strHeight;
	$(function(){
		
		$(document).ready(function() {
			// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
			
			//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
			if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
			    strWidth = $('#note').outerWidth() + (window.outerWidth - window.innerWidth);
			    strHeight = $('#note').outerHeight() + (window.outerHeight - window.innerHeight);
			}
			else {
			    var strDocumentWidth = $(document).outerWidth();
			    var strDocumentHeight = $(document).outerHeight();
			
			    window.resizeTo ( strDocumentWidth, strDocumentHeight );
			
			    var strMenuWidth = strDocumentWidth - $(window).width();
			    var strMenuHeight = strDocumentHeight - $(window).height();
			
			    strWidth = $('#note').outerWidth() + strMenuWidth;
			    strHeight = $('#note').outerHeight() + strMenuHeight;
			}
			
			//resize 
			window.resizeTo( strWidth+33, strHeight+15 );
		});
	});	
	
	function delBox(){
		window.resizeTo( strWidth+133, strHeight+15 );
		if(confirm("쪽지를 삭제하시겠습니까?")){
			location.href="/dbmon/deleteMessage2?no=${vo.no}"
		}else{
			window.resizeTo( strWidth+33, strHeight+15 );	
		}
	}
	function spamBox(){
		window.resizeTo( strWidth+133, strHeight+15 );
		if(confirm('스팸등록을 하시면 해당 회원이 발송한 쪽지는 스팸쪽지함에서만 확인할 수 있습니다.\n\n스팸 등록하시겠습니까?')){
			location.href="/dbmon/spamUser?spamId=${vo.userid_w}&recieveId=${vo.userid_r}"
		}else{
			window.resizeTo( strWidth+33, strHeight+15 );	
		}
	}
	function saveBox(){
		window.resizeTo( strWidth+133, strHeight+15 );
		if(confirm("쪽지를 보관하시겠습니까?")){
			location.href="/dbmon/saveMessage2?no=${vo.no}&tabType=${tabType}"
		}else{
			window.resizeTo( strWidth+33, strHeight+15 );	
		}
	}
</script>
<style>
	body{
		font-size:14px;
		margin:0;
		padding:0;
		background-color:#F3F3F3;
		overflow-x:hidden; 
	}
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	note2{
		padding:10px;
		background-color:#F3F3F3;
	}
	#note{
		margin:10px;
		border: 1px solid #d3abab;
		background-color: #fff;
		padding:10px;
		padding-top: 15px;
		width:446px;
		overflow-x:hidden;
		max-height:600px;
	}
	ul{
	    border-color: d3abab;
	}
	li{
	    vertical-align: middle;
    	border-color: d3abab;
    	line-height:21px;
	}
	#content{
		min-height:200px;
	}
	#note li{
		background-color:#fff;
		border-bottom:1px dashed #EBD9D9;
		width:100%;
	}
	a:hover, a:link, a:visited{
	    text-decoration:none;
	    color:#000;
	}
	.wordCut{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
</head>
<body>
	<!--받은쪽지내용-->
	<div id="note">
		<div id="note2">
			<ul>
				<li>보낸이 : ${vo.userid_w} &nbsp; =>&nbsp; 받은이 : ${vo.userid_r} &nbsp;
					<div style="float:right; line-height:5px;">
					<a href="javascript:spamBox()">
						<img src="icon/message/btn_spam1.gif" width="58px" height="18px" boarder="0"></a>&nbsp; 
					<a href="javascript:void(window.open('?type=memo&memo_id=inbox&memo_no=100701821','claim_memo','width=470,height=580,toolbar=no,scrollbars=no'));">
						<img src="icon/message/claim.gif" board="0" /></a>
					</div>				
				</li>
				<li>날 짜 : ${vo.writedate}</li>
				<li class="wordCut"><b>제 목 : ${vo.subject}</b></li>
				<li id="content">${vo.content}</li>
			</ul>
			
			<div style="float:right" class="alertBox">
				<a href="/dbmon/messageWrite?receiveId=${vo.userid_w }">
					<img src="icon/message/reply_icon.gif" /></a> 
				<c:if test="${tabType!='3'}">
				<a href="javascript:saveBox();">
					<img src="icon/message/keep_icon.gif" /></a>
				</c:if> 
				<a href="javascript:delBox()">
					<img src="icon/message/delete_icon.gif" /></a> 
				<a href="/dbmon/message?tabType=${tabType}&nowPage=${nowPage}">
					<img src="icon/message/list_icon.gif" /></a>
			</div>
		</div>	
	</div>

</body>
</html>