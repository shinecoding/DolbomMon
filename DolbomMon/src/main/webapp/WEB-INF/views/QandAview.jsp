<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
System.out.print(request.getAttribute("list"));
%>

  <style>
	a.nav-link:hover{
		color:#ff7942;
	}
  </style>
<h1 style="color:#ff7928;">Q&A</h1>
<h3 class="_3xkJ0">돌봄몬이 <span class="_34XF1">궁금</span>하신가요?</h3>
<!--   <div>
	관리자만 볼 수 있게 숨기기
	<a class="btn btn-warning" href="noticeBoardWrite" role="button" style="float:right; margin-bottom:30px;">공지사항 등록하기</a>
</div> -->
    <div class="container">
      <div class="row">
        <div class="col">
         
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">부모 회원</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">돌봄몬 회원</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">돌봄활동과 활동비</a>
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
			<col style="width: 10%;">
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="notice" items="${list}">
			<tr>
				<th scope="row">${notice.no}</th>
				<td class="subject"><a href="noticeBoardView">${notice.subject}</a></td>
				<td>${notice.userid}</td>
				<td>${notice.writedate}</td>
				<td>1</td>
			</tr>
			</c:forEach>
			<tr>
				<th scope="row">2</th>
				<td>공지사항2222222</td>
				<td>관리자</td>
				<td>11-11 15:11</td>
				<td>2</td>
				
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>글제목입니다3333333</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>공지사항4444444</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>공지사항5555555</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
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
			<col style="width: 10%;">
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td class="subject"><a href="noticeBoardView">공지사항11111111111111</a></td>
				<td>관리자</td>
				<td>13:11</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>공지사항2222222</td>
				<td>관리자</td>
				<td>11-11 15:11</td>
				<td>2</td>
				
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>글제목입니다3333333</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>공지사항4444444</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>공지사항5555555</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
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
			<col style="width: 10%;">
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td class="subject"><a href="noticeBoardView">공지사항11111111111111</a></td>
				<td>관리자</td>
				<td>13:11</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>공지사항2222222</td>
				<td>관리자</td>
				<td>11-11 15:11</td>
				<td>2</td>
				
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>글제목입니다3333333</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>공지사항4444444</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>공지사항5555555</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
		</tbody>
	</table>
              </div>
            </div>
        </div>
      </div>
    </div>
    <hr/>