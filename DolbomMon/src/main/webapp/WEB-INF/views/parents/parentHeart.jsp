<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
	.container{width:800px;}
	img{ height:90px; width:90px;}
	
	h1{text-align:center;}
	i{color:orange;}
	#title{
		margin:20px 5px;
		display:block;
	width:100%;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	#orderDropdown {
	border:none;
	}
	.trash {
	cursor:pointer;
	}
</style>
<script>
$(function(){
	$(document).on("click", ".trash", function(){
		var cardid = $(this).parent().parent().attr("id");
		$(this).parent().parent().hide();
		console.log(cardid);
		var url = "/dbmon/deleteHeartT";
		var params = "cardid="+cardid;
		
		$.ajax({
			url:url,
			data:params,
			type:'GET',
			success:function(result){
				
				if(result=="1"){
					console.log("성공");
					
					
				}else if(result="0"){
					console.log("실패");
				}
				
			}, error:function(){
				console.log("AJAX 받기 에러");
			}
		})
		
	});//trash삭제
	
	$(document).on("change", "#orderDropdown", function(){
		var order = $(this).val();
		console.log("정렬="+order);
		var url = "/dbmon/likeOrder";
		var params = "order="+order;
		console.log("파람="+params);
		
		$.ajax({
			url:url,
			data:params,
			type:'GET',
			success:function(result){
				
				console.log("성공");
				
			}, error:function(error){
				console.log("ajax 받기 에러-->" + error.responseText);
			}
		})
		
	});
	
	
	
});
</script>
</head>
<body>
	<div class="container">
	
	<div id="title">
   		<div id="titlefont">찜한 돌봄몬</div>
	</div>
	<div class="mb-3"><i class="fas fa-circle"></i>전체 <i class="fas fa-circle"></i>구인중 일자리만
		<div id="orderFilter" class="float-right" style="cursor:pointer; height:20px; overflow:hidden;">
		<select id="orderDropdown">
			<option value="like_order">찜한 순</option>
			<option value="certi_cnt">인증 수 순</option>
			<option value="wage_low">시급 낮은 순</option>
			<option value="wage_high">시급 높은 순</option>
		</select>
	</div>
	</div>
	
	<!--<c:if test="${list==null}">
		<div style="text-align:center;">찜한 돌봄몬이 없습니다.</div>					
	</c:if>
	-->
	
	<c:forEach var="vo" items="${list}">
		
		<ul class="list-group" id="${vo.userid}">
			<li class="list-group-item">
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item border-0 col-2">
						<img src=<c:if test="${vo.pic==null}">"img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">"upload/${vo.pic}"</c:if> alt="${vo.userid}" class="rounded-circle"/><br/>
						<div class="badge badge-warning badge-pill ml-3" >신청하기</div>
					</li>
					<li class="list-group-item border-0 col-10">
						<h6><b>${vo.username.substring(0,1)}O${vo.username.substring(2)}</b>
						<span class="ml-2" style="font-size:0.7em">
								<fmt:parseNumber integerOnly="true" var="edit_year" value="${vo.last_edit/525600}"/>
								<fmt:parseNumber integerOnly="true" var="edit_month" value="${vo.last_edit/43200}"/>
								<fmt:parseNumber integerOnly="true" var="edit_day" value="${vo.last_edit/1440}"/>
								<fmt:parseNumber integerOnly="true" var="edit_hour" value="${vo.last_edit/60}"/>					
							<c:choose>
								<c:when test="${vo.last_edit>525600}">${vo.last_edit/525600}년</c:when>
								<c:when test="${vo.last_edit>43200}">${edit_month}달</c:when>
								<c:when test="${vo.last_edit>1440}">${edit_day}일</c:when>
								<c:when test="${vo.last_edit>60}">${edit_hour}시간</c:when>
								<c:otherwise>${vo.last_edit}분</c:otherwise>
							</c:choose>
						</span>
						</h6>
						<h6 class="loc"><i class="fas fa-map-marker-alt"></i>${vo.area1}</h6>
						<h6><i class="fas fa-coins mr-1"></i>희망시급 : ${vo.desired_wage}원 | <i class="fas fa-hands-helping"></i>협의유무: ${vo.discussion}</h6>
						<h6><i class="fas fa-child"></i>${vo.birth}세 | <i class="fas fa-baby-carriage"></i>돌봄가능아이 : ${vo.headcount}명</h6>
					</li>
					
				</ul>
		
			
	<!--스케쥴api가 완성되고 요일 데이터를 집어넣을 경우! 아니면 그냥 인증정보 표시
		<div class="float-left">
				단기 - 12 동안
		</div>
		<c:forEach var="day" items="월, 화, 수, 목, 금, 토, 일">
			<div class="badge badge-warning badge-round">${day}</div>
		</c:forEach>
		-->
				<c:if test="${vo.identi_status =='Y' || vo.license_status == 'Y' || vo.school_status == 'Y' || vo.crime_status == 'Y'}">
				<hr/>
				</c:if>
				<c:if test="${vo.identi_status == 'Y' }"><div class="badge badge-pill badge-warning align-top mr-1">등초본</div></c:if>
				<c:if test="${vo.license_status == 'Y'}"><div class="badge badge-pill badge-warning align-top mr-1">선생님</div></c:if>
				<c:if test="${vo.school_status == 'Y'}"><div class="badge badge-pill badge-warning align-top mr-1">학교</div></c:if>
				<c:if test="${vo.crime_status == 'Y'}"><div class="badge badge-pill badge-warning align-top mr-1">성범죄안심</div></c:if>
		
		<span class="trash"><i class="far fa-trash-alt float-right"></i></span>
		</li>
	</ul>
	<br/>
	</c:forEach>
	
	
	
		
	<br/>
	</div>
	
</body>
</html>