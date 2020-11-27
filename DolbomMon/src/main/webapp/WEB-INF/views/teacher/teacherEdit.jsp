<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.container{width:800px;}
i{color:gray;}

h5{
	padding: 20px 0px 0px 0px;
	font-weight: bold;
}
 .fa-check-circle{
 font-size:60px;
 margin: 8px;
}

#cctvLst>label{
position:relative;
display:inline-block;
width:45%;
height:150px;
border: 1px solid #ddd;
padding:50px 0;
margin:5px;
text-align:center;

}
input[type=submit]{
opacity:0;
width:100%;
height:100%;
left:0;
top:0;
position:absolute;
}

#cctvWarning{
font-size: 0.8em;
color: gray;
text-align:center;
}
#cctvHidden{
overflow:hidden;
height:0px;
}
#cctvCheck1, #cctvCheck2{
font-size: 40px;
float:right;
color:white;
}
#profFrame{
	position: relative;
	width: 500px;
	height: 500px;
	display:block;
	left: calc(50% - 250px);
	overflow:visible;
	margin-top: 50px;
	}
	#profimg{
	position:absolute;
	width:500px;
	height:500px;	
	}
	.fa-pen{
	position: absolute;
	width:50px;
	height:50px;
	right:-10px;
	top:-10px;
	padding-top:17px;
	background-color:orange;
	color:white;
	border-radius:50%;
	text-align:center;
	z-index:100;
	}
	.editBtn{
	opacity:0%;
	position:absolute;
	top:0;
	left:0;
	bottom:0;
	right:0;
	width:100%;
	height:100%
	}
	.list-group-item{
	position:relative;
	padding: 20px;
	}

img{

width:50%;

}
.boldFont{
color:orange;
font-weight:bold;
}
</style>
<script>
	$(function(){
		$("#cctvLst>label").click(function(){
			$(this).css("background-color", "orange").css("font-weight", "bold");
			$(this).siblings().css("background-color", "white").css("font-weight", "normal");
	
		});
			
		
	});
</script>
</head>
<body>

<div class="container">
	<h5>내 사진</h5>

	   	<div id="profFrame">
				<img class="rounded mx-auto d-block" id="profimg" <c:if test="${vo.pic==null}">src="img/profilepic.png"</c:if>
				<c:if test="${vo.pic!=null}">src="upload/${vo.pic}"</c:if>/>
				<i class="fas fa-pen"><a class="editBtn" href="teacherPicture"></a></i>	
			</div>	
   

   	<h5>간단 자기소개</h5>
   	<li class="list-group-item" style="text-align:center">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherIntro"></a></i>
	   <c:if test="${vo.intro!=null }">	${vo.intro }</c:if>
	   <c:if test="${vo.intro==null }">작성 시 부모로부터<br/>
			<span class="boldFont">4배 더 많은 선택<span>을 받게 됩니다!</c:if>
   	</li>
   	<h5>선호하는 돌봄유형</h5>
   	<li class="list-group-item" style="text-align:center">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherType"></a></i>
	   	"저는 <span class="boldFont">${vo.care_type}</span> 돌봄을 가장 선호해요"
   	</li>
   	<h5>희망 시급</h5>
   	<li class="list-group-item" style="text-align:center">
   		<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
   		<c:if test="${vo.desired_wage!=null }"> ₩${vo.desired_wage }<br/></c:if>
   		<span class="boldFont"> 원하는 시급을 자유롭게 입력해주세요</span>
   	</li>
   	<h5>관련 경험</h5>
   	<li class="list-group-item" style="text-align:center">
   		<i class="fas fa-pen"><a class="editBtn" href="teacherExp"></a></i>
   		<c:if test="${hash!=null}">
   		<c:forEach var="evo" items="${hash}">
   			<b>${evo.exp_content}</b><br/>
   			${evo.exp_start} ~ ${evo.exp_end}<br/><br/>
   		</c:forEach>	
   		</c:if>
   		<c:if test="${hash==null}">
   		작성 시 부모로부터<br/>3배 더 많은 선택을 받게 됩니다!
   		</c:if>
   	</li>
   	<h5>활동 가능 시간</h5>
   	<li class="list-group-item">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
	   	스케쥴차트</li>
   	<h5>돌봄 가능 연령</h5>
   	 <c:set var = "str" value = "${vo.child_age}"/>
   	<li class="list-group-item">
   	 	<i class="fas fa-pen"><a class="editBtn" href="teacherAge"></a></i>
	   	<ul class="list-group list-group-horizontal-sm" >
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '신생아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '신생아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-newborn-baby-s.svg"</c:if> 
			alt="신생아" /><br/>신생아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '영아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '영아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-toddler-s.svg"</c:if>
			 alt="영아" /><br/>영아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${ !fn:contains(str, '유아')}">
			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-n.svg"</c:if>
			<c:if test = "${fn:contains(str, '유아')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-child-s.svg"</c:if>
			 alt="유아" /><br/>유아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
			<c:if test = "${!fn:contains(str, '초등학생')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-n.svg"</c:if> 
			<c:if test = "${fn:contains(str, '초등학생')}">"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/sitter-schoolchild-s.svg"</c:if> 
			 alt="초등학생" /><br/>초등학생</li>
	   </ul>
   </li>
   <h5>가능한 활동</h5>
   <c:set var = "str" value = "${vo.activity_type}"/>
   <li class="list-group-item">
   	<i class="fas fa-pen"><a class="editBtn" href="teacherActivity"></a></i>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '실내놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-read-s.svg" </c:if> 
	   			/><br/>실내놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-n.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '등하원돕기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-indoorplay-s.svg" </c:if>
	   			/><br/>등하원돕기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-n@2x.png" </c:if>
	   			<c:if test = "${fn:contains(str, '책읽기')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-walk-s@2x.png" </c:if>
	   			 /><br/>책읽기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-n.svg" </c:if> 
	   			<c:if test = "${fn:contains(str, '야외활동')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-outdooractivities-s.svg" </c:if> 
	   			/><br/>야외활동</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
	   			<c:if test = "${!fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-n-2.svg" </c:if>
	   			<c:if test = "${fn:contains(str, '한글놀이')}">
	   			"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/p-membership-2-koreanicon-s-2.svg" </c:if>
	   			 /><br/>한글놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				 <c:if test = "${!fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-n.svg" </c:if> 
				<c:if test = "${fn:contains(str, '영어놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-english-s.svg" </c:if> 
				/><br/>영어놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '학습지도')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-specially-s.svg" </c:if>
				/><br/>학습지도</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '체육놀이')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-pe-s.svg" </c:if>		
				/><br/>체육놀이</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '간단 청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '간단 청소')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cleaning-s.svg"</c:if>
				/><br/>간단 청소</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '밥 챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '밥 챙겨주기')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-cook-s.svg"</c:if>
				/><br/>밥 챙겨주기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '간단 설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-n.svg" </c:if>
				<c:if test = "${fn:contains(str, '간단 설거지')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-washing-s.svg" </c:if>						
				/><br/>간단 설거지</li>
   		
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-n.svg"</c:if>
				<c:if test = "${fn:contains(str, '장기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-longterm-s.svg"</c:if>
				/><br/>장기입주</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src=
				<c:if test = "${!fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-n.svg"</c:if> 
				<c:if test = "${fn:contains(str, '단기입주')}">
				"https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/form/join-shortperide-s.svg"</c:if> 			
				/><br/>단기입주</li>

   		</ul>
   	</li>	
		<h5>활동 가능 지역</h5>
		
		<li class="list-group-item">
			<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
			<ul class="list-group" >
			<li class="list-group-item" style="border:none">
				<span class="badge badge-warning">1순위</span> 서울특별시 마포구 마포동
			</li>
			</ul>
		</li>
		
		<h5>CCTV동의 여부</h5>
		<form method="post" action="cctvOk">
		
			<li id="cctvLst" class="list-group-item" >
				<div id="cctvHidden">
					<input type="submit" name="cctv" id="cctvDisagree" value="N"/>
				    <input type="submit" name="cctv" id="cctvAgree" value="Y"/>	    
			    </div>
					 <label for="cctvDisagree" class="rounded"  <c:if test="${vo.cctv=='N'}"> style="background-color:orange" </c:if>>   
				    CCTV촬영을<br/> 원치 않습니다.<br/>
				    	<i id="cctvCheck1" class="fas fa-check-circle"></i>
				    </label>
				    <label for="cctvAgree" class="rounded" <c:if test="${vo.cctv=='Y'}"> style="background-color:orange" </c:if>>
				    CCTV가 있어도<br/>당당히 일할 수 있습니다.<br/>
				    	<i id="cctvCheck2" class="fas fa-check-circle"></i>
					</label>
			
				<p id="cctvWarning">단, 녹화된 영상을 유출 배포하지 않는 전제</p>		
			
		</li>
   	</form>	
   <br/>
</div>



</body>
</html>

