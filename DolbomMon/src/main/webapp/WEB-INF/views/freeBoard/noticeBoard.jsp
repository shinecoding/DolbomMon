<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 900px;	
	}

	#top_noticeboard{

		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
		position: relative;
	}
	#head{
		text-align: center;
	}
	.subject{
		width: 400px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		
	}
	a:link, a:visited, a:hover{
	 	color: black;
	 }
	/* body{
	 	font-size: 0.9em;

	 }	 */
	 
	 }
	 ul, li{
		margin: 0px;
		padding: 0px;
		list-style-type: none;
	}
	#searchDiv{
		width: 180px;
	}
	<!--
	#paging ul{
		width: 100%;
		height: 40px;
		overflow: auto;
	}
	#paging li{
		float: left;
		width: 60px;
		height: 40px;
		text-align: center;
		font-size: 1.3em;
	}	-->

</style>
</head>

<body>

<%@include file="/WEB-INF/views/top.jsp"%>


<hr/><br/>


<div class="container">

<div id="top_noticeboard">

<b>공지사항</b>
</div>
<div style="float: right;">
	<a id="writeBtn" class="btn btn-warning" href="noticeBoardWrite" role="button">글쓰기</a>
</div>
<div style="font-size: 0.9em;"><br/>총 게시물 수 : ${totalRecord}</div>
<div id="board" style="font-size: 0.9em;">
<br/>
	<table class="table table-hover">
		<thead>
			<tr id="head">
				<th width="90">글번호</th>
				<th width="300">글제목</th>
				<th width="90">작성자</th>
				<th width="100">등록일</th>
				<th width="80">조회수</th>
				<th width="100">첨부파일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td scope="row" align="center">${vo.no}</td>		
					<td scope="row" class="subject">
						<a href="/dbmon/noticeBoardView?no=${vo.no}">${vo.subject}</a></td>
					<td scope="row" align="center">${vo.userid}</td>
					<td scope="row" align="center">${vo.writedate}</td>
					<td scope="row" align="center">${vo.hit}</td>
					<td scope="row" align="center">
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
			</c:forEach>
		</tbody>
	</table>
	<br/>
	
	<!-- paging -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				
				<!-- 이전 페이지 -->
				<li class="page-item">
					<c:if test="${pVo.nowPage>1}">
						<a class="page-link" tabindex="-1" aria-disabled="true" href="/dbmon/noticeBoard?nowPage=${pVo.nowPage-1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">Previous</a>
					</c:if>	
				</li>
				
				<c:forEach var="p" begin="${pVo.startPageNum}" end="${pVo.startPageNum+pVo.onePageNumCount-1}">
					<c:if test="${p<=pVo.totalPage}">
						<li class="page-item">
						<a class="page-link" href="/dbmon/noticeBoard?nowPage=${p}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>"><span <c:if test="${p==pVo.nowPage}">style="color:red"</c:if>>${p}</span></a>
					</c:if>
				</c:forEach>
				
				<!-- 다음페이지 -->
				<li class="page-item">
					<c:if test="${pVo.nowPage<pVo.totalPage}">
						<a class="page-link" href="/dbmon/noticeBoard?nowPage=${pVo.nowPage+1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">Next</a>
					</c:if>
				</li>
			</ul>
		</nav>
	<br/>
	<form method="get" action="/dbmon/noticeBoard" id="searchFrm">
		<div class="input-group mb-3">
			<div id="searchDiv">
				<select class="custom-select" name="searchKey" id="searchKey">
					<option value="subject">제목</option>
					<option value="content">글내용</option>
					<option value="userid">작성자</option>
				</select>
				</div>
				<input type="text" class="form-control" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요"/>
				<div class="input-group-append">
					<input type="submit" class="btn btn-warning" value="검색"/>
			</div>
		</div>
	</form>
</div>
</div>
</body>
</html>