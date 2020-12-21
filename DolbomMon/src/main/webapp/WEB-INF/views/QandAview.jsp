<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <style>
	a.nav-link:hover{
		color:#ff7942;
	}

		.spread-underline:after {    
		  background: none repeat scroll 0 0 transparent;
		  bottom: 0;
		  content: "";
		  display: block;
		  height: 2px;
		  left: 50%;
		  position: absolute;
		  background: #ffb000;
		  transition: width 0.3s ease 0s, left 0.3s ease 0s;
		  width: 0;
		}
		.spread-underline:hover:after { 
		  width: 100%; 
		  left: 0; 
		}
  </style>
<h1 style="color:#ff7928; font-weight:bold;" id="target1">Q&A</h1>
<h3 class="_3xkJ0 spread-underline">돌봄몬이 <span class="_34XF1" style="font-weight:bold; color:#ff7942;">궁금</span> 하신가요?</h3>
<!--   <div>
	관리자만 볼 수 있게 숨기기
	<a class="btn btn-warning" href="noticeBoardWrite" role="button" style="float:right; margin-bottom:30px;">공지사항 등록하기</a>
</div> -->
    <div class="container">
      <div class="row">
        <div class="col">
         
            <ul class="nav nav-tabs">
              <li class="nav-item" style="font-size:20px;">
                <a class="nav-link active" data-toggle="tab" href="#qwe" style="font-size:18px; color:gray;">부모 회원</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd" style="font-size:18px; color:gray;">돌봄몬 회원</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc" style="font-size:18px; color:gray;">돌봄활동과 활동비</a>
              </li>
            </ul>
            <div class="tab-content" style="font-weight:normal;">
            <!-- 부모회원 -->
              <div class="tab-pane fade show active" id="qwe">
                	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 12%;">
			<col style="width: 15%;">
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="font-weight:bold;">글번호</th>
				<th scope="col" style="font-weight:bold;">글제목</th>
				<th scope="col" style="font-weight:bold;">작성자</th>
				<th scope="col" style="font-weight:bold;">등록일</th>
				
				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="qna_vo" items="${qna_list}">
			<tr>
				<th scope="row"><c:out value="${qna_vo.seq}"/></th>
				<td class="subject" style="float:left;">
				<a href="/dbmon/qnaBoardView?seq=${qna_vo.seq}">
				<c:out value="${qna_vo.subject}"/></a></td>
				<td><c:out value="${qna_vo.userid}"/></td>
				<td><fmt:formatDate value="${qna_vo.writedate}" pattern="yyyy-MM-dd"/></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
            

              </div>
              <!-- ====================== 돌봄몬회원====================== -->
              <div class="tab-pane fade" id="asd">
               	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 12%;">
			<col style="width: 15%;">
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="font-weight:bold;">글번호</th>
				<th scope="col" style="font-weight:bold;">글제목</th>
				<th scope="col" style="font-weight:bold;">작성자</th>
				<th scope="col" style="font-weight:bold;">등록일</th>
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="qna_vo" items="${qna_list2}">
			<tr>
				<th scope="row"><c:out value="${qna_vo.seq}"/></th>
				<td class="subject" style="float:left;">
				<a href="/dbmon/qnaBoardView?seq=${qna_vo.seq}">
				<c:out value="${qna_vo.subject}"/></a></td>
				<td><c:out value="${qna_vo.userid}"/></td>
				
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
              </div>
              <div class="tab-pane fade" id="zxc">
                  	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 12%;">
			<col style="width: 15%;">
		
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="font-weight:bold;">글번호</th>
				<th scope="col" style="font-weight:bold;">글제목</th>
				<th scope="col" style="font-weight:bold;">작성자</th>
				<th scope="col" style="font-weight:bold;">등록일</th>
			
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="qna_vo" items="${qna_list3}">
			<tr>
				<th scope="row"><c:out value="${qna_vo.seq}"/></th>
				<td class="subject" style="float:left;">
				<a href="/dbmon/qnaBoardView?seq=${qna_vo.seq}">
				<c:out value="${qna_vo.subject}"/></a></td>
				<td><c:out value="${qna_vo.userid}"/></td>
				
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
              </div>
            </div>
        </div>
      </div>
    </div>
    
<img src="img/intro2.PNG" class="img1"/>
    <hr/>

