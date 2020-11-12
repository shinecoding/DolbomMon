<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DolbomMon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>
 
    function memberPage(url){
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            $('#mainPage').children().remove();
            console.log(data);
            $('#mainPage').html(data);
        });
    }
 


</script>
<style>
	body, div{
		margin:0;
		padding:0;
	}
	#topBar{
		height:10vh;
		background-color:lightblue;
		font-size:2.5em;
		line-height:2.5em;
		text-align:center;
	}
	#leftBar{
		height:90vh;
		width:10%;
		border:1px solid gray;
		float:left;
		text-align:center
	}
	#mainPage{
		height:90vh;
		width:90%;
		float:left;
	}
	button{
		margin-top:10px;
	}
	
	
</style>
<style>
	
</style>

</head>

<body>
<div id="topBar" id="topBar">관리자페이지</div>
<div id="leftBar" id="leftBar">
	<button class="btn btn-warning" onclick="memberPage('/dbmon/memberManage')">회원관리</button><br>
	<button class="btn btn-primary" onclick="memberPage('/dbmon/memberManage')">정산관리</button><br>
	<button class="btn btn-danger">신고관련</button><br>
</div>
<div id="mainPage"></div>

</body>
</html>