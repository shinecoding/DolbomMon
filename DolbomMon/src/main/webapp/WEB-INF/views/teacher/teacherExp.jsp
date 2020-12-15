<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
	.container{width:800px;
	font-family: 'Jua', sans-serif;}
	
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
	#expWarning{
		margin-top:30px;
		color:gray;
		text-align:center;
	}
	li{
		list-type-style:none;
		display:block;
	}
	ul{
	display:block;
	}
	input[type=submit]{
	position:relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top:50px;
	}
	#result{
	overflow:visible;
	width:100%;
	}
	
	button{
		float:right;
	}
	input[type=text]{
	width:100%;
	border:none;
	text-align:left;
	}
	#addExp{
	width:100%;
	margin-top:30px;
	}
	
	.expLine{
	text-align:center;
	}
	input[type=date]{
	border:none;
	font-weight:bold;
	margin-bottom:30px;
	}
	hr{
	margin:0; padding:0;
	}
</style>	
<script>
		
	$(function(){
		//경험추가
		$("#addExp").click(function(){
			//exxxx();
			addExp();
		});
		//경험추가
		function addExp(){
			$.ajax({
				url : "teacherAddExp",
				success : function(result){
					if(result=="pass"){
						document.location.reload(true);
					}else{
						alert("경험 추가에 실패하였습니다. 로그인 상태를 확인하세요.");
					}
				}
			});
		}
		//경험삭제
		function delExp(no){
			if(confirm("경험을 삭제하면 되돌릴 수 없습니다. 정말 삭제하시겠습니까?")){
				$.ajax({
					url : "teacherDelExp",
					data : "exp_no="+no,
					success : function(result){
						if(result=="pass"){
							document.location.reload(true);
						}else{
							alert("경험 삭제에 실패하였습니다. 로그인 상태를 확인하세요.");
						}
					}
				});
				
			}			
		}
		
		$("#expForm").submit(function(){
			var formData = $("#expForm").serialize();
			if(confirm("경험을 저장하시겠습니까?")){
				$.ajax({
					url : "teacherSaveExp",
					data : formData,
					type : "post",
					success : function(result){
						console.log(result)
						if(result=="pass"){
							alert("수정되었습니다.")
							window.scrollTo(0, 0);
							document.location.reload(true);
						}else if(result=="경험 내용을 입력하세요."){
							alert(result+" 경험 내용이 없으면 등록하실 수 없습니다.");
						}else{
							alert("경험 저장에 실패하였습니다. 로그인 상태를 확인하세요.");
						}
					}
				});
			}
		});
		
		
		$(document).on('click','button', function(){
			//$(this).parent().remove("li");
			delExp($(this).attr('id'));
		});
	
	});
</script>
</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">관련 경험 수정</div>
	 	</div>
	 	<div class="m-2" id="expWarning">
				아이를 키운 경험부터 사촌과 놀아준 경험까지,<br/>
				아이와 돌봄에 관련된 경험이라면 무엇이든 적어주세요<br/>
		</div>
	 	
	 	
		<form method="post" id="expForm" onsubmit="return false;">
			<div class="form-group">
				<ul id="result">
				<c:forEach var="evo" items="${list}">
					<input type="hidden" name="exp_no" value="${evo.exp_no }"/>
					<li>
						<button class="btn btn-warning" type="button" id="${evo.exp_no }">삭제</button>		
						<div>경험내용</div>							
						<input type="text" name="exp_content" class="form-control" placeholder="예)키즈카페, 교육기관, 봉사활동" 
						value="${evo.exp_content}"	/>
						<hr/>
						<div>경험기간</div>
						<div class="expLine">
							<input type="date" name="exp_start" value="${evo.exp_start}"/> -
							<input type="date" name="exp_end" value="${evo.exp_end}"/>
						</div>
					</li>
					</c:forEach>
				</ul>
				<input type="button" id="addExp" class="btn btn-warning" value="+경험내용 추가하기"/>
				
				<input type="submit" class="btn btn-warning" value="저장" />
			</div>
		</form>
		
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>