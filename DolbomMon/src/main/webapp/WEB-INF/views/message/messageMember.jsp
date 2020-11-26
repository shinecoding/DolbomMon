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
<script>

	$(function(){
		
		$(document).ready(function() {
			// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
			var strWidth;
			var strHeight;
			
			//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
			if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
			    strWidth = $('.messageMain').outerWidth() + (window.outerWidth - window.innerWidth);
			    strHeight = $('.messageMain').outerHeight() + (window.outerHeight - window.innerHeight);
			}
			else {
			    var strDocumentWidth = $(document).outerWidth();
			    var strDocumentHeight = $(document).outerHeight();
			
			    window.resizeTo ( strDocumentWidth, strDocumentHeight );
			
			    var strMenuWidth = strDocumentWidth - $(window).width();
			    var strMenuHeight = strDocumentHeight - $(window).height();
			
			    strWidth = $('.messageMain').outerWidth() + strMenuWidth;
			    strHeight = $('.messageMain').outerHeight() + strMenuHeight;
			}
			
			//resize 
			window.resizeTo( strWidth, strHeight );
		});

		$(".nav-tabs a").click(function(){
			var result = $(this).parent().attr("id");
		});
		
		$("#allCheck").on('change',function(){
			$(".message_list input").prop("checked", $("#allCheck").prop("checked"));
		});
		
		
	});
	
</script>
<style>
	body{
		font-size:14px;
		overflow-x:hidden; 
		overflow-y:hidden;
		margin:0;
		padding:0;
		background-color:#F3F3F3;
	}

	.messageMain{
		padding:15px 15px;
		width:480px;
		height:600px;
		margin:0 auto;
		background-color:#F3F3F3;
	}
	#message>table{
		background-color:#fff;
		border:1px solid #EBD9D9;
		width:100%;
	}
	#page_list{
		float:right;
	}
	#note_tile{
		width:450px;
	}
	.clearfix:after { clear:both; }
	.list_line>td, #message_list>td{
		line-height:25px;
	}
	tbody p{
		height:10px;
	}
	a:hover, a:link, a:visited{
	    text-decoration:none;
	    color:#000;
	}
	#message tr{
		border-bottom:1px solid #EBD9D9;
	}
	.search_box ul, .search_box li{
		margin:0;
		padding:0;
		list-style-type:none;
		text-align:center;
	}
	
	.wordCut{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#paging ul{
		float:right;
	}
	.imgResize{
		width:15px;
		height:15px;
	}
	#message li{
		
		height:32px;
		line-height:32px;
		float:left;
		border-bottom:1px solid #EBD9D9;
		width:15%;
		list-style-type:none;
		background-color:#fff;
		font-size:12px;
	}
	#message li:nth-child(5n+4){
		width:37%
	}
	#message li:nth-child(5n+1){
		border-left:1px solid #EBD9D9;
		width:18%
	}
	#message li:nth-child(5n+2){
		text-align:center;
	}
	#message li:nth-child(5n+3){
		text-align:center;
	}
	#message li:nth-child(5n+5){
		border-right:1px solid #EBD9D9;
		text-align:center;
	}
	#message ul{ /* ul왼쪽 여백 없애기 */
	 -webkit-padding-start:0px;
	}
	.title{
		text-align:center;
		font-weight:bold;
	}
	.content{
		padding:0px 3px;
	}
</style>
</head>
<body>
	
<div class="messageMain">
	<div id="note_tile" class="clearfix">
		<p class="note_title" style="float:left">
       		<a href="#"><img src="icon/message/message5.gif" width="98px" height="23px" /></a>
    	</p>
	</div>

	<ul class="nav nav-tabs" id="test2">
		<li class="nav-item" id="receive"><a class="nav-link" href="/dbmon/message?tabType=1">받은쪽지</a></li>
		<li class="nav-item" id="send"><a class="nav-link" href="/dbmon/message?tabType=2">보낸쪽지</a></li>
		<li class="nav-item" id="storage"><a class="nav-link" href="/dbmon/message?tabType=3">쪽지보관</a></li>
		<li class="nav-item" id="spam"><a class="nav-link" href="/dbmon/message?tabType=4">스팸쪽지</a></li>
		<li class="nav-item" id="searchTab"><a class="nav-link active" href="/dbmon/messageMemberSearch?tabType=5">회원검색</a></li>
	</ul>
	<div class="tab-content">
		<div id="message">
			<table>
				<tbody>
					<tr class="list_line">
					<!-- 공지사항 반복문 돌리기 -->
						<td class="note_info note_notice" colspan="4">
							<p class="note_new">
								<a href="/dbmon/messageContent&no= " target="_blank" class="btn_show">
									<img src="icon/message/icon_notice_new.png" border="0" alt="notice" class="icon-notice"> <span>돌봄몬 운영자 사칭 쪽지 주의</span> 
								</a>
							</p>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="board-line"></td>
					</tr>
				</tbody>
			</table>
			
			<ul>
				
				<li class="title">아이디</li>
				<li class="title">이름</li>
				<li class="title">가입유형</li>
				<li class="title">활동지역</li>
				<li class="title">프로필</li>
				<% for(int i=0; i<5; i++){ %>
				<li class="content wordCut">test1test2test</li>
				<li class="content wordCut">이O현</li>
				<li class="content wordCut">선생님</li>
				<li class="content wordCut">서울시 서대문구 연희동</li>
				<li class="content wordCut">프로필</li>
				
				<li class="content wordCut">test4</li>
				<li class="content wordCut">류O열</li>
				<li class="content wordCut">부모님</li>
				<li class="content wordCut">서울시 중구 신당동</li>
				<li class="content wordCut">프로필</li>
				<% } %>
			</ul>
		
			
		</div>
	</div>

	

		<!--page-->
		<div id="paging">awdawd
			<ul  class="pagination" >
				<!-- 이전페이지 -->
			
				<li class="page-item">
					<c:if test="${pVo.nowPage>1}"> <!--														여기부터 검색어 있을때 검색어페이지 넘어가게 작성한것. 밑에도 다 있음	  -->
						<a class="page-link"  class="page-link" href="/dbmon/messageMemberSearch?nowPage=${pVo.nowPage-1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>">Prev</a>
					</c:if>
				</li>
				<c:forEach var="p" begin="1" end="2">
					<c:if test="${p<=pVo.totalPage }">
						<li class="page-item">
							<a class="page-link" href="/dbmon/messageMemberSearch?nowPage=${p}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>"><span <c:if test="${p==pVo.nowPage}">style="color:red"</c:if>>1${p}</span></a>
						</li>
					</c:if>
				</c:forEach>
				
				<!-- 다음페이지 -->
				<li class="page-item"> 
					<c:if test="${pVo.nowPage<pVo.totalPage}">
						<a class="page-link" href="/dbmon/messageMemberSearch?nowPage=${pVo.nowPage+1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>">Next</a>
					</c:if>
					
				</li>
				
			</ul>
		</div>
		<!--//page-->
			<!-- 검색창 -->

	<div class="search_box">
		<form name="search_form" method="get" action="/dbmon/messageMemberSearch">
			<ul>
				<li>
				   	<select name="searchKey" id="searchKey" style="height:27px;">
					<option value="userid">아이디</option>
					<option value="jointype">가입유형</option>
					<option value="location">지역</option>
	            	</select>
				<input type="text" name="searchWord" id="searchWord" value=""/>
				<input type="submit" value="검색"/>
				</li>
			</ul>
	</form>
	</div>
 <!-- 검색창 -->  
		
	</div>
	




</body>
</html>