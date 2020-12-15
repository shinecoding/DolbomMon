<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>DolbomMon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" type="text/css" /><link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css" type="text/css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script src="https://kit.fontawesome.com/74c16632e0.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js" type="text/javascript" ></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js" type="text/javascript" ></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js" type="text/javascript" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" type="text/javascript" ></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath() %>/css/pdfmake.min.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath() %>/css/vfs_fonts.js" type="text/javascript" ></script>

<script>
 
    function memberPage(url){
        var ajaxOption = {
                url : url,
                async : true,
                type : "GET",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            $('#mainPage').children().remove();
            $('#mainPage').html(data);
        });
        
    }
    function logOut(){
		location.href="/dbmon/managerLogout";
    } 
	
    
    
    //Timer 설정 시작
    var tid;
    var cnt = parseInt(1800);//초기값(초단위)
    
    function counter_init() { //메인화면 세션 카운트 실행
     tid = setInterval("counter_run()", 1000);
    }
    
    function counter_run() { //메인화면 세션 카운트
     document.all.counter.innerText = time_format(cnt);
     cnt--;
     if(cnt < 0) {
      clearInterval(tid);
     }
    }
    
      
    function counter_reset() { 
      $.ajax({
    	  	url:"increaseSession",
    	  	success:function(){
    	        clearInterval(tid);
    	        cnt = parseInt(1800);//초기값(초단위)
    	        counter_init();
    	  	}
      			
      })
     
    }
    
    function time_format(s) {
     //var nHour=0;
     var nMin=0;
     var nSec=0;
     if(s>0) {
      nMin = parseInt(s/60);
      nSec = s%60;

      if(nMin>60) {
       //nHour = parseInt(nMin/60);
       nMin = nMin%60;
      }
     }
     if(nSec<10) nSec = "0"+nSec;
     if(nMin<10) nMin = "0"+nMin;

     return /*""+nHour+":"+*/nMin+":"+nSec;
    }
</script>
<style>

	body, div{
		margin:0;
		padding:0;
	}
	#topBar{
		display:flex;
		font-size:15px;
		line-height:2em;
		padding:16px;
		height:70px;
		background-color: #222;
	    border-color: #080808;
	    border: 1px solid transparent;
	    color:rosybrown;
	    font-family: 'Noto Sans KR', sans-serif;
	}
	#mainPage{
		position:absolute;
		left:60px;
		width: -webkit-calc(100% - 60px);
		height: -webkit-calc(100% - 70px);
		
		
	}
	/*
	button{
		margin-top:15px;
	}
	*/
	

	.fa {
		position: relative;
		display: table-cell;
		width: 60px;
		height: 36px;
		text-align: center;
		vertical-align: middle;
		font-size:30px;
	}
	.main-menu:hover,nav.main-menu.expanded {
		width:250px;
		overflow:visible;
	}
	
	.main-menu {
		background:#212121;
		border-right:1px solid #e5e5e5;
		position:absolute;
		top:0;
		bottom:0;
		height:100%;
		left:0;
		width:60px;
		overflow:hidden;
		-webkit-transition:width .05s linear;
		transition:width .05s linear;
		-webkit-transform:translateZ(0) scale(1,1);
		z-index:1002;	
	}
	
	.main-menu>ul {
		margin:7px 0;
	}
	
	.main-menu li {
		position:relative;
		display:block;
		width:250px;
		margin:10px 0px;
	}
	#top-ul>li{
		top:100px;
	}
	
	.main-menu li>a {
		position:relative;
		display:table;
		border-collapse:collapse;
		border-spacing:0;
		color:#999;
		 font-family: arial;
		font-size: 14px;
		text-decoration:none;
		-webkit-transform:translateZ(0) scale(1,1);
		-webkit-transition:all .1s linear;
		transition:all .1s linear;
	}
	
	.main-menu .nav-icon {
		position:relative;
		display:table-cell;
		width:60px;
		height:36px;
		text-align:center;
		vertical-align:middle;
		font-size:18px;
	}
	
	.main-menu .nav-text {
		position:relative;
		display:table-cell;
		vertical-align:middle;
		width:190px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.main-menu>ul.logout {
		position:absolute;
		left:0;
		bottom:0;
	}
	.nav-text {
		font-size:1.2em;
	}
	
	.no-touch .scrollable.hover {
		overflow-y:hidden;
	}
	
	.no-touch .scrollable.hover:hover {
		overflow-y:auto;
		overflow:visible;
	}
	
	a:hover,a:focus {
		text-decoration:none;
	}
	
	nav {
		-webkit-user-select:none;
		-moz-user-select:none;
		-ms-user-select:none;
		-o-user-select:none;
		user-select:none;
	}
	
	nav ul,nav li {
		outline:0;
		margin:0;
		padding:0;
	}
	.main-menu li:hover>a,nav.main-menu li.active>a,.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus,.no-touch .dashboard-page nav.dashboard-menu ul li:hover a,.dashboard-page nav.dashboard-menu ul li.active a {
		color:#fff;
		background-color:#5fa2db;
	}
	#nav-text {
		font-family: 'Noto Sans KR', sans-serif;
		font-style: normal;
		font-weight: 300;
	}
	#mainPage{
		overflow: scroll;
		overflow-x:hidden;
	}
	.clearfix:after { clear:both; }
	
</style>

</head>
<body onload="counter_init(); <c:if test='${type!=null}'>memberPage('/dbmon/${type}');</c:if>">


<div class="area"></div><nav class="main-menu">
            <ul id="top-ul">
                <li style="">
                    <a href="/dbmon/">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            돌봄몬 메인
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="#">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            이용자 현황
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="/dbmon/management?type=memberManage">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            회원 관리
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="/dbmon/management?type=managerManage">
                       <i class="fa fa-folder-open fa-2x"></i>
                        <span class="nav-text">
                            매니저 관리
                        </span>
                    </a>
                   
                </li>
                <li>
                    <a href="/dbmon/management?type=accountManage">
                        <i class="fa fa-bar-chart-o fa-2x"></i>
                        <span class="nav-text">
                            회계 관리
                        </span>
                    </a>
                </li>
    	<!-- 	<li>
                    <a href="#">
                        <i class="fa fa-font fa-2x"></i>
                        <span class="nav-text">
                           추가버튼
                        </span>
                    </a>
                </li>
                <li>
                   <a href="#">
                       <i class="fa fa-table fa-2x"></i>
                        <span class="nav-text">
                            추가버튼
                        </span>
                    </a>
                </li>
                <li>
                   <a href="#">
                        <i class="fa fa-map-marker fa-2x"></i>
                        <span class="nav-text">
                            추가버튼
                        </span>
                    </a>
                </li>
-->                
				<li>
                   <a href="/dbmon/management?type=certiManage">
                       <i class="fa fa-table fa-2x"></i>
                        <span class="nav-text">
                            인증관리
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/dbmon/management?type=reportManage">
                       <i class="fa fa-info fa-2x"></i>
                        <span class="nav-text">
                            신고처리
                        </span>
                    </a>
                </li>
            </ul>

            <ul class="logout">
                <li>
                   <a href="javascript:logOut()">
                         <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Logout
                        </span>
                    </a>
                </li>  
            </ul>
        </nav>




<!-- ============================= -->
<div id="topBar" id="topBar" class="clearfix">
	<div style="width:100%; text-align:right;">
		<span style="margin-right:20px; line-height:36.2px;"><b>${vo.department}</b> ${vo.username}님 &nbsp&nbsp&nbsp <span id="counter">30:00</span></span><button class="btn btn-outline-info" style="padding:3px; margin-bottom:3px;" onclick="counter_reset()">세션연장</button>
	</div>
</div><!-- 돌봄몬 사이트 네비게이션 위치 -->
<div id="mainPage"></div>
</body>
</html>