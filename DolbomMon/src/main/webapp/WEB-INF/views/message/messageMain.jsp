<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	.tab-content{
		margin:10px 15px;
	}
	
	#messageMain{
		width:492px;
		height:600px;
		margin:0 auto;
		border:1px solid lightblue;
	}
	
	
</style>
</head>
	<div id="messageMain">
		  <div id="note_tile">
		   <p class="text_title" style='text-align:left;'>
		
				<!-- 게시판 검색주소 넣기 .. ex:https://www.ppomppu.co.kr/zboard/member_memo.php?exec=view&no=&page=1&memo_type=inbox&sort=unread -->
				<!--  ex : https://www.ppomppu.co.kr/zboard/member_memo.php?exec=view&no=&page=1&memo_type=inbox -->
			    <a href="#" class="btn_show">
			    안 읽은 쪽지 <font style="font-weight:bold;color:#F00;">0</font></a> /
			    <a href="#" class="btn_show">
			    전체 <span style='font-weight:bold;'>0</span></a>
			
		   </p>
		  </div>
		<div style="float:clear"></div>		
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="tab" href="#send">보낸쪽지</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#accept">받은쪽지</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#storage">보관쪽지</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#spam">스팸쪽지</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#memberSearch">회원검색</a>
		  </li>
		</ul>
		
		<div class="tab-content">
		  <div class="tab-pane fade show active" id="send">
      		<table>
	          <colgroup>
		            <col width="20px" />
		            <col width="" />
		            <col width="120px" />
		            <col width="34px" />
		          </colgroup>
		          <thead>
		            <tr>
		             <th scope="col"><input type="checkbox"/></th>
		             <th scope="col" class="sub_title">제목</th>
		             <th scope="col" class="sub_title">보낸사람</th>
		             <th scope="col" class="sub_title">날짜</th>
		            </tr>
		          </thead>
	          <tbody>
      	          <tr class="list_line"><td class="note_info note_notice" colspan="4">
      	          <p class="note_new">
      	          <a href="/zboard/view.php?id=notice&no=940" target="_blank" class="btn_show">
      	          전자파 미인증 제품 판매글 관련 안내 </a></p></td></tr>
      	          <tr><td colspan="4" class="board-line"></td></tr>
	          </tbody>
           </table>	
		  </div>
		  <div class="tab-pane fade" id="accept">
		    <p>받은쪽지</p>
		  </div>
		  <div class="tab-pane fade" id="storage">
		    <p>쪽지보관</p>
		  </div>
		  <div class="tab-pane fade" id="spam">
		    <p>스팸쪽지</p>
		  </div>
		  <div class="tab-pane fade" id="memberSearch">
		    <p>회원검색</p>
		  </div>
		</div>
	</div>
</body>
</html>