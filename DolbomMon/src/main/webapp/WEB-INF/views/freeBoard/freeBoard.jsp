<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
	body{
	 	font-size: 0.9em;
	 }
	 ul, li{
		margin: 0px;
		padding: 0px;
		list-style-type: none;
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

<div class="container">
<div id="top">
<b>자유게시판</b>
</div>
<div>
	<a id="writeBtn" class="btn btn-warning" href="freeBoardWrite" role="button">글쓰기</a>
</div>
<div><br/>총 게시물 수 : ${totalRecord}</div>
<div id="board">
<br/>
	<table class="table table-hover">
		<thead>
			<tr id="head">
				<th width="70">글번호</th>
				<th width="130">말머리</th>
				<th>글제목</th>
				<th width="90">작성자</th>
				<th width="100">등록일</th>
				<th width="70">조회수</th>
				<th width="70">첨부파일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<c:if test="${vo.step<=0}">
					<td scope="row" align="center">${vo.no}</td>
					<td scope="row" align="center">${vo.head}</td>
				</c:if>
				<c:if test="${vo.step>0}">
					<td scope="row" align="center"></td>
					<td scope="row" align="center"></td>
				</c:if>
					<td scope="row" class="subject">
						<!-- 공백을 step만큼 띄어주기 -->
						<c:forEach var="s" begin="1" end="${vo.step}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						<c:if test="${vo.step>0}">
							☞
						</c:if>
						<a href="/dbmon/freeBoardView?no=${vo.no}">${vo.subject}</a></td>
					<td align="center">${vo.userid}</td>
					<td align="center">${vo.writedate}</td>
					<td align="center">${vo.hit}</td>
					
					<!-- 첨부파일 -->
					<c:forEach var="f" items="${vo.filename}">
					<c:if test="${f!=null}">
					<a href="<%=request.getContextPath()%>/upload/${f}" download><img src="<%=request.getContextPath()%>/img/disk.png" title="${f}" alt="${vo.no}"/></a>
					</c:if>
					</c:forEach>
						
					
					<td align="center"><a href="" download><img src="<%=request.getContextPath()%>/img/disk.png"/>${vo.filename1}, ${vo.filename2}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/>
	
	<!-- paging -->
		<nav aria-label="...">
			<ul class="pagination" >
				<!-- 이전페이지 -->	
				<li class="page-item">
					<c:if test="${pVo.nowPage>1}">
						<a class="page-link"  class="page-link" href="/dbmon/freeBoard?nowPage=${pVo.nowPage-1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>">Prev</a>
					</c:if>
				</li>
				
				
				<c:forEach var="p" begin="${pVo.startPageNum}" end="${pVo.startPageNum+pVo.onePageNumCount-1}">
					<c:if test="${p<=pVo.totalPage }">
						<li class="page-item">
							<a class="page-link" href="/dbmon/freeBoard?nowPage=${p}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>"><span <c:if test="${p==pVo.nowPage}">style="color:red"</c:if>>${p}</span></a>
						</li>
					</c:if>
				</c:forEach>
				
				
				
				<!-- 다음페이지 -->
				<li class="page-item"> 
					<c:if test="${pVo.nowPage<pVo.totalPage}">
						<a class="page-link" href="/dbmon/freeBoard?nowPage=${pVo.nowPage+1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>">Next</a>
					</c:if>
				</li>	
			</ul>
		</nav>
		
		----------
		
		
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				
				<!-- 이전 페이지 -->
				<li class="page-item">
					<c:if test="${pVo.nowPage>1}">
						<a class="page-link" href="/dbmon/freeBoard?nowPage=${pVo.nowPage-1}" tabindex="-1" aria-disabled="true">Previous</a>
					</c:if>	
				</li>
				
				<c:forEach var="p" begin="${pVo.startPageNum}" end="${pVo.startPageNum+pVo.onePageNumCount-1}">
					<c:if test="${p<=pVo.totalPage}">
						<li class="page-item">
						<a class="page-link" href="/dbmon/freeBoard?nowPage=${p}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${prevWord}</c:if>"><span <c:if test="${p==pVo.nowPage}">style="color:red"</c:if>>${p}</span></a>
					</c:if>
				</c:forEach>
				<!-- 다음페이지 -->
				
				<li class="page-item">
					<c:if test="${pVo.nowPage<pVo.totalPage}">
						<a class="page-link" href="/dbmon/freeBoard?nowPage=${pVo.nowPage+1}">Next</a>
					</c:if>
					</li>
				
			</ul>
		</nav>
		
		
		
		
	<br/>
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="검색어를 입력하세요"/>
		<div class="input-group-append">
			<button class="btn btn-warning" type="button" id="button-addon2">검색</button>
		</div>
	</div>
</div>
</div>
</body>
</html>