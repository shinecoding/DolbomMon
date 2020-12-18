<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	
	$(function(){
		
		var anotherUser;
		var timerID;
		var newTimerID; 
		var roomNo;
		var scrollStop = 1;
		var startChatRoom = 0;
		var roomseq;
		//채팅입력
		$("#send2").click(function(){
			insertChat();
		});
		makeRoom();
		//채팅방 클릭시
		$(document).on("click",".roomBox>div",function(e){
			roomNo = $(this).attr('id');
	        e.preventDefault();
		    clearTimeout(timerID); // 타이머 중지
		    selectRoom(roomNo);
		    var anotherId = $(this).children('div.text').children('h6').children('span.anotherUser').text();
		    $("#insertId").html(anotherId+"님과 채팅중입니다."); 
		    //$(this).children('div.imgChange').html('<img src="icon/message/chaticon2.png" class="imgResize"/>');
		});
		/*
		$("#room2").click(function(){
			newRoom();
			$(".container").css("display","block");
			 
		});
		*/
		$("#hiddenChat").click(function(){
			$(".container").css("display","none");
			window.close();
		});
		
		
		
		//자동스크롤 다운
		function scrollDown(){
			if(scrollStop==1){
			$(".chat-panel").scrollTop($(".chat-panel")[0].scrollHeight);
			}
		}
		
		//스크롤 정지 기능 개선
		$(".chat-panel").scroll(function() {  
				var scHeight = $('.chat-panel').prop('scrollHeight');
				var currHeight = $('.chat-panel').prop('scrollTop');
				
	            if((currHeight+500)>scHeight){
					scrollStop=1;
				}else{
					scrollStop=0;
				}

	    });  
		
/* 		//스크롤 올릴때 자동으로 내려가는것 멈추기 (스크롤정지기능 휠 -> 모든 이벤트개선 위에)
		$(".chat-panel").on('mousewheel',function(e){
			var wheel = e.originalEvent.wheelDelta;
			//스크롤값을 가져온다.
			if(wheel>0){
				scrollStop=0;
			}
			var scHeight = $('.chat-panel').prop('scrollHeight');
			var currHeight = $('.chat-panel').prop('scrollTop');
			
			if(wheel<0){
				if((currHeight+700)>scHeight){
					scrollStop=1;
				}
			}
		}); */
		
		
		$("#message").keypress(function(event){
			var kcode=event.keyCode;
			if(kcode=='13'){
				insertChat();
			}
		});
		/*
		//채팅방 접속, 생성
		$("#room2").click(function(){
			makeRoom();
		})
		*/

		
		
		
		
		
		
		
		//채팅입력시
		function insertChat(){
			$.ajax({
				url : "insertChat", 
				data : {
					message:$("#message").val(),
					roomseq:$("#roomseq").val()
				},
				type : "post",
				success : function(data){
					if(data!=null){
						tag="";
						tag+='<div class="row no-gutters"><div class="col-md-6 offset-md-6"><div class="chat-bubble chat-bubble--right">'
						tag+=$("#message").val()+'</div></div> </div>'

						$(".chat-panel:last-child").after().append(tag);
						$("#message").val("");
						$("#message").focus();
					}
				}
			});
		}
		//채팅방 클릭시
		function selectRoom(roomNo){
			$.ajax({
				url : "selectChatRoom",
				data : "roomNo="+roomNo,
				type : "post",
				success : function(data){
						var $data = $(data);
						//var userid = ${myId};
						//var myId = <%=(String)session.getAttribute("userid")%>	
						tag="";
						$data.each(function(idx, mVo){
							tag+="<div class='row no-gutters'>";
							if(mVo.userid == "${myId}"){
								tag+="<div class='col-md-6 offset-md-6'>";
								tag+="<div class='chat-bubble chat-bubble--right'>";
								tag+=mVo.message;
								//tag+=""
								tag+="</div><div style='float:right; font-size:12px; margin-right:30px;'><"+mVo.indate+"></div></div></div>";
							}else{
								tag+="<div class='col-md-6'>";
								tag+="<div class='chat-bubble chat-bubble--left'>";
								tag+=mVo.message;
								tag+="</div><div style='float:left; font-size:12px; margin-left:30px;'><"+mVo.indate+"></div></div></div></div>";
							}
							
						});					
						$(".chat-panel").html(tag);
						$("#roomseq").val(roomNo);
						scrollDown()
				}
			
			});
			
			timerID = setTimeout(selectRoom, 1000, roomNo);
			
		}
		//방만들기 버튼 클릭시

		function makeRoom(){
			$.ajax({
				url : "makeRoom", 
				data : {
					roomname:$("#roomname").val(),
					userid:"${anotherId}",
				},
				type : "post",
				success : function(result){
				///////////
						var $data = $(result);
						tag="";
						$data.each(function(idx, rVo){
							if(rVo.userid!=rVo.userid_t){
								if(startChatRoom==0){
									selectRoom(rVo.roomseq);
									roomNo=rVo.roomseq;
								}
								tag+='<div class="friend-drawer friend-drawer--onhover" id="'+rVo.roomseq+'">';
								tag+='<img class="profile-image" src="https://c.pxhere.com/photos/d5/31/background_cat_red_white_background_image_attention-611858.jpg!d" alt="">';
								tag+='<div class="text">';
								tag+='<h6>'+rVo.roomseq+' : ';
								if(rVo.userid=="${myId}"){
									if(startChatRoom==0){
										$("#insertId").html(rVo.userid_t+"님과 채팅중입니다.");
										startChatRoom++;
									}
									tag+="<span class='anotherUser'>"+rVo.userid_t;
								}else{
									if(startChatRoom==0){
										$("#insertId").html(rVo.userid+"님과 채팅중입니다.");
										startChatRoom++;
									}
									tag+="<span class='anotherUser'>"+rVo.userid
								}
								tag+='</span></h6>';
								tag+='<p class="time text-muted small wordCut" style="width:150px; height:19px;">'+rVo.lastChat+'</p>';
								tag+='<p class="time text-muted small">'+rVo.indate+'</p></div>';
								tag+='<div style="line-height:50px; height:50px;" class="imgChange">';
								if(roomNo!=rVo.roomseq){
									if(rVo.userid=="${myId}"){
										if(rVo.newchat=="Y"){
											tag+='<img src="icon/message/chaticon1.png" class="imgResize"/>';
										}							
									}else if(rVo.userid_t=="${myId}"){
										if(rVo.newchat_t=="Y"){
											tag+='<img src="icon/message/chaticon1.png" class="imgResize"/>';
										}					
									}
								}else{
									tag+='<img src="icon/message/chaticon2.png" class="imgResize"/>';
								}
								tag+="</div></div><hr>";
							}
						});					
					$(".roomBox").html(tag);
					$("#roomname").val("");
					$("#message").focus();
				}
			});
			
			newTimerID = setTimeout(makeRoom, 1999);
		}
		
		
	
	});
	//해당 게시글 대상 아이디로 방목록 최상단 갱신
	function newRoom(){
		$.ajax({
			url : "newRoom",
			data : {
				anotherId:"${anotherId}"
			},
			success : function(result){
				
			}
		})
	}
	
</script>
<style>
	body {
	  background-color: #fff;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  text-rendering: optimizeLegibility;
	  overflow-x:hidden;
	}
	
	.container {
	  margin: 60px auto;
	  background: #fff;
	  padding: 0;
	  border-radius: 7px;
	}
	
	.profile-image {
	  width: 50px;
	  height: 50px;
	  border-radius: 40px;
	}
	
	.settings-tray {
		height:70px;
		background: #eee;
		padding: 10px 15px;
		border-radius: 7px;
	}
	.settings-tray .no-gutters {
	  padding: 0;
	}
	.settings-tray--right {
	  float: right;
	  text-align: right;
	  width: 15%;
	  margin-left: 25px;
	}
	.settings-tray--right i {
	  margin-top: 10px;
	  font-size: 25px;
	  color: grey;
	  margin-left: 7px;
	  transition: 0.3s;
	}
	.settings-tray--right i:hover {
	  color: #74b9ff;
	  cursor: pointer;
	}
	
	.search-box {
	  background: #fafafa;
	  padding: 10px 13px;
	}
	.search-box .input-wrapper {
	  background: #fff;
	  border-radius: 40px;
	}
	.search-box .input-wrapper i {
	  color: grey;
	  margin-left: 7px;
	  vertical-align: middle;
	}
	
	input {
	  border: none;
	  border-radius: 30px;
	  width: 80%;
	}
	input::placeholder {
	  color: #e3e3e3;
	  font-weight: 300;
	  margin-left: 20px;
	}
	input:focus {
	  outline: none;
	}
	
	.friend-drawer {
		padding: 10px 15px;
		display: flex;
		vertical-align: baseline;
		background: #fff;
		transition: 0.3s ease;
	}
	.friend-drawer--grey {
		height:50px;
		background: #eee;
	}
	.friend-drawer .text {
	  margin-left: 12px;
	  width: 75%;
	}
	.friend-drawer .text h6 {
	  margin-top: 6px;
	  margin-bottom: 0;
	}
	.friend-drawer .text p {
	  margin: 0;
	}
	.friend-drawer .time {
	  color: grey;
	}
	.friend-drawer--onhover:hover {
	  background: #74b9ff;
	  cursor: pointer;
	}
	.friend-drawer--onhover:hover p,
	.friend-drawer--onhover:hover h6,
	.friend-drawer--onhover:hover .time {
	  color: #fff !important;
	}
	
	hr {
	  margin: 5px auto;
	  width: 60%;
	}
	
	.chat-bubble {
	  padding: 10px 14px;
	  background: #eee;
	  margin: 10px 30px;
	  border-radius: 9px;
	  position: relative;
	  /*animation: fadeIn 1s ease-in;*/
	}
	.chat-bubble:after {
	  content: "";
	  position: absolute;
	  top: 50%;
	  width: 0;
	  height: 0;
	  border: 20px solid transparent;
	  border-bottom: 0;
	  margin-top: -10px;
	}
	.chat-bubble--left:after {
	  left: 0;
	  border-right-color: #eee;
	  border-left: 0;
	  margin-left: -20px;
	}
	.chat-bubble--right:after {
	  right: 0;
	  border-left-color: #74b9ff;
	  border-right: 0;
	  margin-right: -20px;
	}
	
	.offset-md-6 .chat-bubble {
	  background: #74b9ff;
	  color: #fff;
	}
	
	.chat-box-tray {
	  background: #eee;
	  display: flex;
	  align-items: baseline;
	  padding: 10px 15px;
	  align-items: center;
	  margin-top: 19px;
	  bottom: 0;
	}
	.chat-box-tray input {
	  margin: 0 10px;
	  padding: 6px 12px;
	}
	.chat-box-tray i {
	  color: grey;
	  font-size: 30px;
	  vertical-align: middle;
	}
	.chat-box-tray i:last-of-type {
	  margin-left: 25px;
	}
	.chat-panel{
		overflow:scroll;
		overflow-x:hidden;
		height:448px;
		min-width:300px;
	}
	.chatBox{
		min-width:300px;
	}
	.container{
		min-width:800px;
		overflow-x: scroll:
	}
	.userBox{
		width:250px;
	}
	.roomBox{
		height:477.5px;
		overflow:scroll;
		overflow-x:hidden;
	}
	
	.imgResize{
		width:50px;
		height:50px;
		vertical-align:middle;
	}
	.wordCut{
	    white-space:nowrap;
	    overflow:hidden;
	    text-overflow:ellipsis;
	}
	.chatPage{
		margin:0 auto;
	}
	.downimg{
		width:15px;
		height:15px;
		padding-bottom:4px;
	}
</style>
</head>
<body onload="newRoom()">

<!-- <input type="button" value="방만들기" class="btn btn-info" id="room2" style="margin-bottom:15px;"> -->
<div class="chatPage" style="display:block">
	
	<div class="row no-gutters chatform">
	  <div class="col-md-4 border-right userBox">
		<div class="settings-tray">
		<div class="friend-drawer no-gutters friend-drawer--grey">
			<img class="profile-image" src="https://mblogthumb-phinf.pstatic.net/MjAxNzA0MDNfMjEx/MDAxNDkxMTc1MTc3MDU2._c0rnvCrPIVJUFdB40z-tR3eUTv2aC9CMmm9b57lgmUg.FGaQd94-twbynMnhrvYW1gIdijL1vAbXcXQEzsT3WGYg.JPEG.eungee_e/se3_image_570625329.jpg?type=w800" alt="Profile img">
			<!-- 본인 프로필 이미지 -->
			<div class="text">
			  <h4 style="line-height:45px;">${myId}</h4>
			</div>
			<span class="settings-tray--right">
				<i class="material-icons">cached</i> <!-- 채팅방 새로고침 -->
			</span>
			</div>
		</div>

		<div class="search-box">
		  <div class="input-wrapper">
			<i class="material-icons">search</i> <!-- 상대방 검색? -->
			<input placeholder="Search here" type="text">
		  </div>
		</div>
		
		<!-- -------------------- 채팅room 영역--------------------- -->
		<div class="roomBox">
		</div>
		
	  </div>
	  
	  <!-- -------------------- 채팅 room 영역 end--------------------- -->
	  
	  <div class="col-md-8 chatBox">
		<div class="settings-tray">
			<div class="friend-drawer no-gutters friend-drawer--grey">
			<img class="profile-image" src="https://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg" alt="">
			<div class="text">
			  <h6 id="insertId"></h6>
			  <p class="text-muted">상태창</p>
			</div>
			<span class="settings-tray--right">
			  <i class="material-icons">cached</i>
			  <i class="material-icons" id="hiddenChat">close</i>
			</span>
		  </div>
		</div>
			<div class="chat-panel">
			  
		 	</div>
		<div class="row chatBox">
			<div class="col-12">
			  <div class="chat-box-tray">
				<input type="text" name="message" placeholder="내용을 입력하세요." id="message">
				<input type="hidden" name="roomseq" id="roomseq" value="">
				<input type="button" id="send2" value="보내기" class="btn btn-secondary" style="width:100px">
				<!-- 결제넘어가는 버튼 만들기 -->
				<button class="btn btn-info">계약하기</button>
			  </div>
			</div>
		</div>
	  </div>
	</div>
  </div>
          
</body>
</html>