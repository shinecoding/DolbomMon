<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/multidatepicker.css" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/css/datepicker-ko.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.container{width:800px;}
	i{color:gray;}
	#profimg{
	   	width:100px;
		height:100px;
	}
	h5{
	   padding: 20px 0px 0px 0px;
	   font-weight: bold;
	}
	 .fa-check-circle{
	 font-size:60px;
	 margin: 8px;
	}
	#applyDbmList h6{height:7%;}
 	.ui-datepicker:nth-of-type(1){width:100%;}
 	.ui-datepicker td>a{text-align:center;}
 	.divOff{display:none;}
 	.divOn{display:inline-block;}
 	
 	
 	#regularDate{
 		display:inline-block;
 		width:100%;
 	}
 	#regularDate #timeDiv{width:50px;float:left;}
 	#regularDate #dateDiv{float:left; margin-left:50px;}
 	#regularDate .settime{
 		height:40px; 
 		line-height:40px;
 		text-align:center;
 	}
 	#regularDate .dateCls{text-align:center;}
 	#timebarDiv {position:relative;width:0px;height:0px;}
 	.timebar{position:absolute;top:50px; background-color:orange;opacity:0.7; width:50px;}
 	.clearfix:after { clear:both; }
 	
 	.viewContract{
		position: relative;
	    margin: 0 5px;
	    top: 0px;
	    right: 0px;
	}
</style>

<script>

</script>
<style>
	#specificDate>div{width:100%;}
	.ui-state-disabled>span{text-align:center;}
</style>
</head>
<body>

<%@include file="/WEB-INF/views/top.jsp"%>
<hr/>
<div class="container">
	<div style="margin:20px 0;">
  	 	<img class="rounded-circle mx-auto d-block " id="profimg" <c:if test="${vo.pic==null || vo.pic==''}" >src="img/profilepic.png" </c:if><c:if test="${vo.pic!=null || vo.pic != '' }" >src="upload/${vo.pic}"</c:if>/>
   	</div>
   	<div class="clearfix" style="width:100%">
	   <div style="position:relative; float:right; height:1px; top:-420px;">
			<div class="badge badge-warning badge-pill mt-3 p-2"><img src="icon/icon-alarm.png" style="width:1em; height:1em"/></div>
	   </div>
   	</div>
   	<div>
   	<ul class="list-group">
   	</ul>
   	</div>
      
   
    <ul style="padding:0px;">
    	<h5>이름</h5>
        <li class="list-group-item p-3" style="text-align:center;"><span  style="font-size:1.4em; font-weight:bold">${vo.username }</span><span class="badge badge-warning badge-pill align-middle p-2 ml-2 mb-2"><c:if test="${vo.who=='P' }">학부모</c:if><c:if test="${vo.who=='T' }">선생님</c:if></span><br/>
        </li>
     	<h5>연락처</h5>
    	<li class="list-group-item p-3" style="text-align:center">${vo.tel1 }</li>
     	<h5>이메일</h5>
    	<li class="list-group-item p-3" style="text-align:center">${vo.email }</li>
     	<h5>주소</h5>
    	<li class="list-group-item p-3" style="text-align:center">${vo.addr } ${vo.addrdetail }</li>
     	<h5>성별</h5>
    	<li class="list-group-item p-3" style="text-align:center"><c:if test="${vo.gender=='M' }">남자</c:if><c:if test="${vo.gender=='F' }">여자</c:if></li>
     	<h5>가입일</h5>
    	<li class="list-group-item p-3" style="text-align:center">${vo.regdate }</li>
    	<h5>생년월일/나이</h5>
    	<li class="list-group-item p-3" style="text-align:center">${vo.birth } / ${vo.age }세</li>
    </ul>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>

