<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
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
<script>
	$(function(){
		$("#delBtn").click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				location.href="/dbmon/freeBoardDel?no=${vo.no}";
			}
			return false;
		});
		
		//댓글 쓰기
		$("#replyForm").submit(function(){
			if($("#content").val()==""){
				alert("댓글을 입력후 등록하세요.");
				return false;
			}
			
			var url = "/dbmon/replyWrite";
			var params = $("#replyForm").serialize();
			
			$.ajax({
				url: url,
				data: params,
				success: function(result){
					replyListSelect();
					replyCount();
					$("#content").val("");
				}, error: function(){
					console.log("댓글 쓰기 에러 발생");			
				}			
			});		
			return false;
		});
		
		//댓글 수정 버튼 클릭시 수정폼 보여주기
		$(document).on('click', '.edit', function(){
			$(this).parent().css("display", "none");
			$(this).parent().next().css("display", "block");	
		});
		
		//edit 버튼 클릭시
		$(document).on('submit', '#replyList form', function(){
			var url = '/dbmon/replyEdit';
			var params = $(this).serialize();	
			
			$.ajax({
				url: url,
				data: params,
				success: function(result){
					replyListSelect();
				}, error: function(){
					console.log("댓글 수정 에러 발생");
				}		
			});
			return false;
		});
		
		$(document).on('click', '.del', function(){		
			if(confirm("댓글을 삭제하시겠습니까?")){
				var url = "/dbmon/replyDel";
				var params = "re_no="+$(this).attr("title");
				
				$.ajax({
					url: url,
					data: params,
					success: function(result){
						replyCount();
						replyListSelect();
					}, error: function(){
						console.log("댓글 삭제 에러 발생");
					}				
				});
			}		
		});	
	});
	
	function replyListSelect(){	
		var url = "/dbmon/replyList";
		var data = "no=${vo.no}";
		
		$.ajax({
			url: url,
			data: data,
			success: function(result){
				var $result = $(result);
				var tag = "";
				$result.each(function(i, v){
					tag += "<li class='list-group-item'><div><b>" + v.userid + "</b> ("+v.writedate+") ";
					if(v.userid=='${userid}'){
						tag += "&nbsp;&nbsp;&nbsp;<input type='button' class='edit btn btn-outline-warning btn-sm' value='수정'/>&nbsp;&nbsp;&nbsp;";
						tag += "<input type='button' class='del btn btn-outline-warning btn-sm' value='삭제' title='"+v.re_no+"'/>";
					}
					tag += "<br/>" + v.content + "</div>";
					//로그인 한 아이디와 현재 댓글의 아이디가 같으면 수정폼을 생성
					if(v.userid=='${userid}'){
						tag += "<div style='display: none;'><form>";
						tag += "<input type='hidden' name='re_no' value='" + v.re_no + "'/>";
						tag += "<textarea name='content' style='width: 500px; height: 100px;'>"+v.content+"</textarea>&nbsp;&nbsp;&nbsp;"
						tag += "<input type='submit' class='btn btn-outline-warning btn-sm' value='수정하기'/></form></div>";		
					}
					tag += "</li>";
				});
				$("#replyList").html(tag);
			}, error: function(){
				console.log("댓글 선택 에러 발생");
			}		
		});
	}
	
	function replyCount(){
		var url = "/dbmon/replyCount";
		var data = "no=${vo.no}";
		
		$.ajax({
			url: url,
			data: data,
			success: function(result){
				var $result = $(result);
				var tag = "";;
				$result.each(function(i, r){
					if(r>0){
						tag += "댓글 수 <b>"+r+"개</b>";	
					}
				});
				$("#replyCount").html(tag);
			}, error: function(){
				console.log("댓글 수 선택 에러 발생");
			}		
		});
	}
	
	//글내용보기 댓글 표시
	replyCount();
	replyListSelect();
	
</script>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
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
				<c:if test="${vo.filename1!=null}">
					<tr>
						<th scope="col">첨부파일</th>
						<td>
							<c:if test="${vo.filename1!=null}">
								<c:forEach var="f1" items="${vo.filename1}">
									<a href="<%=request.getContextPath()%>/upload/${f1}" download><img src="<%=request.getContextPath()%>/img/disk.png" title="${f1}" alt="${vo.no}"/></a>		
								</c:forEach>				
							</c:if>
							<c:if test="${vo.filename2!=null}">
								<c:forEach var="f2" items="${vo.filename2}">						
									<a href="<%=request.getContextPath()%>/upload/${f2}" download><img src="<%=request.getContextPath()%>/img/disk.png" title="${f2}" alt="${vo.no}"/></a>							
								</c:forEach>
							</c:if>	
						</td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
			<c:if test="${preVo.preSubject!=null}">
				<tr>
					<th scope="col">이전글</th>
					<td><a href="/dbmon/preContentView?no=${vo.no}">${preVo.preSubject}</a></td>	
				</tr>
			</c:if>
			<c:if test="${nextVo.nextSubject!=null}">
				<tr>
					<th scope="col">다음글</th>
					<td><a href="/dbmon/nextContentView?no=${vo.no}">${nextVo.nextSubject}</a></td>	
				</tr>
			</c:if>
			</tfoot>
		</table>
		<hr/>
		
		<br/><div id="replyCount"></div><br/>
		
		<!-- 댓글 쓰기 -->
		<div id="reply">
			<form method="post" id="replyForm">
				<input type="hidden" name="no" value="${vo.no}"/>	<!-- 원글번호 -->
				<textarea name="content" class="form-control" id="content" style="width: 720px; height: 60px;"></textarea>
				<input type="submit" id="replyBtn" class="btn btn-outline-warning" value="등록"/>
			</form>
		</div>
			<br/>
			<ul id="replyList" class="list-group">
			</ul>
		<div>
		<br/>
			<c:if test="${userid==vo.userid}">
				<a class="btn btn-warning" href="/dbmon/freeBoardDel?no=${vo.no}" role="button" id="delBtn">삭제</a>
				<a class="btn btn-warning" href="/dbmon/freeBoardEdit?no=${vo.no}" role="button">수정</a>
			</c:if>
			<a class="btn btn-warning" href="/dbmon/freeBoardReplyForm?no=${vo.no}" role="button">답변</a>
			<a class="btn btn-warning" href="/dbmon/freeBoard" role="button">목록</a>
		</div>
	</div>
</body>
</html>
<jsp:include page="../footer.jsp"/>