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
<style>
	/*ul, li { margin:0; padding: 0; list-style-type:none;}
	*/
	img { width: 50px; height:50px;}
</style>
</head>
<body>
<div class="container">
	<h4>구직현황</h4>
	<nav>
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" id="nav-apply-tab" href="#nav-apply" data-toggle="tab" role="tab">
			내가 지원한</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="nav-inbox-tab" href="#nav-inbox" data-toggle="tab" role="tab">
				내게 신청한</a>
			</li>
		</ul>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-apply" role="tabpanel">지원했다네</div>
		<div class="tab-pane fade" id="nav-inbox" role="tabpanel">받았다네</div>
	</div>
</div>
</body>
</html>