<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ include file="/WEB-INF/views/top.jsp" %>
<style>
	.container{width:800px;}
	img { width: 50px; height:50px;}
	
	#title{
		margin:20px 5px;
		display:block;
		width:800px;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	.nav-item>a {
	color:black;
	}
	.fa-check-circle, .fa-times-circle{
		font-size: 50px;
		margin: 10px;
		color:orange;
	}
	.card-body{
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#imgBox{
		float:left;
		padding: 15px;
		height: 150px;
		position: absolute;
		top: 20px;
	}
	#offerBox{
	    position: relative;
	    width: 310px;
	    padding: 3px;
	    left: 180px;
	}
	#offerTitle{
		font-size: 1.1em;
	}
	.all_wrapper{
		margin-top:70px;
		width:770px;
		background-color:white;
		margin:0 auto;
	}

</style>
</head>
<body>
<div class="container">
	<div id="title">
   		<div id="titlefont">활동 내역</div>
	</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<div class="all_wrapper" >
					<div class="row">
						<c:forEach var="vo" items="${list}">
							<div style="padding:0px 10px; width:765px">
								<div class="card">
									<div class="card-body">
										<div id="imgBox"><img src="img/ch1.PNG" class="rounded-circle" style="height:110px; width:110px;"></div>
										<span class="badge badge-warning badge-pill align-middle p-2 ml-2 mt-3" style="position: absolute; top: 150px; left: 37px;"><c:if test="${vo.teacher_type=='선생님'}">선생님 돌봄몬</c:if><c:if test="${vo.teacher_type=='대학생'}">대학생 돌봄몬</c:if><c:if test="${vo.teacher_type=='엄마'}">엄마 돌봄몬</c:if><c:if test="${vo.teacher_type=='일반'}">일반 돌봄몬</c:if></span>
										<div id="offerBox" >
											<span class="card-title" id="offerTitle" style="line-height: 2em;"><b>${vo.username.substring(0,1)}O${vo.username.substring(2)}</b></span>
											
											<span class="ml-2 mb-3" style="font-size:0.7em">
												<fmt:parseNumber integerOnly="true" var="edit_year" value="${vo.last_edit/525600}"/>
												<fmt:parseNumber integerOnly="true" var="edit_month" value="${vo.last_edit/43200}"/>
												<fmt:parseNumber integerOnly="true" var="edit_day" value="${vo.last_edit/1440}"/>
												<fmt:parseNumber integerOnly="true" var="edit_hour" value="${vo.last_edit/60}"/>					
											<c:choose>
												<c:when test="${vo.last_edit>525600}">${edit_year}년</c:when>
												<c:when test="${vo.last_edit>43200}">${edit_month}달</c:when>
												<c:when test="${vo.last_edit>1440}">${edit_day}일</c:when>
												<c:when test="${vo.last_edit>60}">${edit_hour}시간</c:when>
												<c:otherwise>${vo.last_edit}분</c:otherwise>
											</c:choose>
											 전
											 </span><br/>
											<span class="mb-4"><i class="fas fa-map-marker-alt" style="color: orange;"></i>${vo.area1}</span><br/>
											<span class="mb-4"><i class="fas fa-child" style="color: orange" ></i> ${vo.birth}세 <c:if test='${vo.gender=="F"}'>여자 </c:if><c:if test='${vo.gender=="M"}'>남자 </c:if>| <i class="fas fa-baby-carriage" style="color: orange"></i>돌봄가능아이 : ${vo.headcount}명</span><br/>
											<span class="mb-4"><i class="fas fa-coins mr-1" style="color: orange"></i>희망시급 ${vo.desired_wage}원</span><br/>
											<c:if test="${vo.discussion=='Y'}"><span class="mb-3"><i class="fas fa-hands-helping" style="color: orange"></i>협의가능</span></c:if><br/>
											결제일 : ${vo.pay_date}<br/>
											결제금액 : ${vo.pay_money}원<br/>
										</div>
									</div>
								<div class="card-footer btn mt-3" onclick="location.href='teacherView?username=${vo.username}'">자세히 보기</div>
								</div>
							</div>
						</c:forEach>
					</div>
					</div>
				</li>
			</ul>
		
		
		<div style="margin-bottom:200px;"></div>

</div>
</body>
</html>