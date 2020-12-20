<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>
	$(function(){
		$(document).on("click","#topBtn",function(){
			location.href="/dbmon/";
		});
		
	});
</script>
<style>
	*, html{
		font-family: 'Noto Sans KR', sans-serif;
	}
	html {
	    color: #222;
	    font-weight: 100;
	    font-size: 1em;
	    line-height: 1.375;
	}
	.topDiv{
		color: rgba(0, 0, 0, 0.87);
	    background-color: white;
	    transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
	    box-sizing: border-box;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	    box-shadow: none;
	    border-radius: 0px;
	    position: relative;
	    z-index: 1100;
	    width: 100%;
	    display: flex;
	    padding-left: 24px;
	    padding-right: 24px;
	}
	.mainDiv{
		background-color: #fff;
		min-height: 500px;
		max-width: 600px;
    	margin: 50px auto 0;
	}
	#topBtn{
	    border: 10px;
	    box-sizing: border-box;
	    display: inline-block;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	    cursor: pointer;
	    text-decoration: none;
	    margin: 0px;
	    padding: 12px;
	    outline: none;
	    font-size: 0px;
	    font-weight: inherit;
	    position: relative;
	    z-index: 1;
	    overflow: visible;
	    width: 48px;
	    height: 48px;
	    background: none;	
	    margin-left:20px;
    }
    #topBtn img{
	    display: inline-block;
	    color: rgba(0, 0, 0, 0.87);
	    fill: black;
	    height: 20px;
	    width: 20px;
	    user-select: none;
    }
    .topDiv2{
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    margin: 0px;
	    padding-top: 0px;
	    letter-spacing: 0px;
	    font-size: 24px;
	    font-weight: 600;
	    color: rgb(255, 255, 255);
	    height: 64px;
	    line-height: 64px;
	    flex: 1 1 0%;
    }
    .topDiv2>span{
    	color: black;
	    font-size: 20px;
	    vertical-align: top;
	    text-align: center;
	    position: absolute;
	    width: 200px;
	    left: calc(50% - 100px);
    }
    .reportList{
		margin-left: 0px;
	    padding: 0px 16px 25px 72px;
	    position: relative;
    }
    .listTop{
    	justify-content: space-between;
    	align-items: center;
  	    flex-wrap: wrap;
       	flex-direction: row;
  	    display: flex;
    }
    .name{
	    object-fit:contain; 
	    text-align:left;    
	    font-size: 17px;
	    font-weight: 700;
	    line-height: 1.18;
    }
    .reason{
    	border: 10px;
	    box-sizing: border-box;
	    display: flex;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	    cursor: default;
	    text-decoration: none;
	    margin: 0px;
	    padding: 0px;
	    outline: none;
	    font-size: inherit;
	    font-weight: inherit;
	    position: relative;
	    z-index: 1;
	    background-color: rgb(224, 224, 224);
	    border-radius: 16px;
	    white-space: nowrap;
    }
    .reason span{
    	color: rgba(0, 0, 0, 0.87);
	    font-size: 12px;
	    font-weight: 400;
	    line-height: 32px;
	    padding-left: 12px;
	    padding-right: 12px;
	    user-select: none;
	    white-space: nowrap;
    }
    .reportDate{
    	font-size: 12px;
    	line-height: 1;
        object-fit: contain;
	    text-align: left;
    }
    .reasonDetail{
    	font-size: 12px;
	    line-height: 1.5;
	    text-align: left;
	    color: #3b3b3b;
	    margin: 5px 0;
    }
    .reportList img{
	    color: rgb(255, 255, 255);
	    background-color: rgb(188, 188, 188);
	    user-select: none;
	    display: inline-flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 20px;
	    border-radius: 50%;
	    height: 40px;
	    width: 40px;
	    position: absolute;
	    top: 8px;
	    left: 16px;
	    -webkit-box-align: center;
	    -webkit-box-pack: center;
    }
    .topSpan{
	   	border-width: 10px 10px 1px;
	    border-top-style: initial;
	    border-right-style: initial;
	    border-bottom-style: solid;
	    border-left-style: initial;
	    border-top-color: initial;
	    border-right-color: initial;
	    border-bottom-color: rgb(235, 235, 235);
	    border-left-color: initial;
	    border-image: initial;
	    box-sizing: border-box;
	    display: block;
	    font-family: "Noto Sans KR", sans-serif;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	    cursor: pointer;
	    text-decoration: none;
	    margin: 10px 0px;
	    padding: 5px 0px;
	    outline: none;
	    font-size: 16px;
	    font-weight: inherit;
	    position: relative;
	    z-index: 1;
	    color: rgba(0, 0, 0, 0.87);
	    line-height: 16px;
	    transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
	    background: none;
    }
    .topSpan:hover{
    	background-color:#F1F3F4;
    }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<div class="mainDiv">
	<div class="topDiv">
		<div style="margin-top:8px; margin-right:8px; margin-left:-16px;">
			<button tabindex="0" type="button" id="topBtn">
				<div>
					<img src="icon/X_icon.png">
				</div>
			</button>
		</div>
		<div class="topDiv2">
			<span>신고내역</span>
		</div>
		
	</div>
	<c:forEach var="vo" items="${list}">
	<span class="topSpan">
	<div>
		<div class="reportList">
			<div class="listTop">
				<div class="name">${vo.firstName}○${vo.lastName}</div>
				<div>
					<div class="reason">
						<span>${vo.shingo_reason}</span>
					</div>
				</div>
			</div>
			<div>
				<span class="reportDate">
					<b>신고일시 : ${vo.shingo_date}</b>
				</span>
			</div>
			<div class="reasonDetail">
				${vo.shingo_detail }
			</div>
			<img src="icon/w-student.png"/>
		</div>
	</div>
	<div style="border-top:1px dashed lightgray; width:80%; margin:0 auto; padding:5px;">
		<c:if test='${vo.shingo_status.equals("W")}'>
			<div class="reason" style="display:inline-block; background-color:#875AF1;">
				<span style="color:#fff">신고 접수</span>
			</div>
		</c:if>
		<c:if test='${vo.shingo_status.equals("D")}'>
			<div class="reason" style="display:inline-block; background-color:#41D583;">
				<span>처리 완료</span>
			</div>
		</c:if>
		<div style="margin-top:10px; padding:5px;">
			<span>${vo.shingo_response}</span>
		</div>
	</div>
	<br/>
	</span>
	
	</c:forEach>
</div>
</body>
</html>

<jsp:include page="../footer.jsp"/>