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
				location.href="/dbmon/noticeBoardDel?no=${vo.no}";
			}
			return false;
		});
	});
</script>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
	<div class="container">
		<div id="top">
			<b>공지사항 보기</b>
		</div>
		<table class="table" style="table-layout: fixed">
			<tbody>
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
					<td><a href="/dbmon/preNoticeView?no=${vo.no}">${preVo.preSubject}</a></td>	
				</tr>
			</c:if>
			<c:if test="${nextVo.nextSubject!=null}">
				<tr>
					<th scope="col">다음글</th>
					<td><a href="/dbmon/nextNoticeView?no=${vo.no}">${nextVo.nextSubject}</a></td>	
				</tr>
			</c:if>
			</tfoot>
		</table>
		<hr/>
		<br/>
		<div>
		<br/>
			<c:if test="${userid==vo.userid}">
				<a class="btn btn-warning" href="/dbmon/noticeBoardDel?no=${vo.no}" role="button" id="delBtn">삭제</a>
				<a class="btn btn-warning" href="/dbmon/noticeBoardEdit?no=${vo.no}" role="button">수정</a>
			</c:if>
			<a class="btn btn-warning" href="/dbmon/noticeBoard" role="button">목록</a>
		</div>
	</div>
</body>
</html>