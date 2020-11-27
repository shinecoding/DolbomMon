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
		
		//setInterval(getChatList, 2000);
		
		$("#send").click(function(){
			insertChat();
		});
		
		$("#message").keypress(function(event){
			var kcode=event.keyCode;
			if(kcode=='13'){
				insertChat();
			}
		});
		
		$("#room2").click(function(){
			console.log("test")
			makeRoom();
		})
		
		function makeRoom(){
			$.ajax({
				url : "makeRoom", //채팅폼의 액션
				data : {
					roomname:$("#roomname").val(),
				},
				type : "post",
				success : function(result){
					if(result=="ok"){
						$(".chatform").css("display","block"); //이거 엡솔루트해야할듯. 포지션바꿔서 창크기 고정시키기
					}
				}
			});
		}
		
		
		function insertChat(){
			$.ajax({
				url : "/insertChat", //채팅폼의 액션
				data : {
					roomseq:$("#roomseq").val(),
					message:$("#message").val()
				},
				type : "post",
				success : function(data){
					if(data=="ok"){
						$("#message").val("");
						$("#message").focus();
					}
				}
			});
		}
		
		function getChatList(){ //받아오는부분
			$.ajax({
				url:"/chatMessage",
				data:{roomseq:$("#roomseq").val()},
				type:"get",
				success:function(data){
					var content="";
					for(var i=0; i<data.length; i++){
						content+="<tr>";
						content+="<td>"+data[i].userid+' : ';
						content+="</td>";
						content+="<td>"+data[i].message;
						content+="</td>";
						content+="<td>"+data[i].indate;
						content+="</td>";
						content+="</tr>";
					}
					$("#messageList").html(content);
				}
				
			});
		}
		
		
	});




$( '.friend-drawer--onhover' ).on( 'click',  function() {
  
  $( '.chat-bubble' ).hide('slow').show('slow');
  
});
</script>
<style>
	body {
	  background-color: #fff;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  text-rendering: optimizeLegibility;
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
	  background: #eee;
	  padding: 10px 15px;
	  border-radius: 7px;
	}
	.settings-tray .no-gutters {
	  padding: 0;
	}
	.settings-tray--right {
	  float: right;
	}
	.settings-tray--right i {
	  margin-top: 10px;
	  font-size: 25px;
	  color: grey;
	  margin-left: 14px;
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
	  background: #eee;
	}
	.friend-drawer .text {
	  margin-left: 12px;
	  width: 70%;
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
	  animation: fadeIn 1s ease-in;
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
	
	@keyframes fadeIn {
	  0% {
	    opacity: 0;
	  }
	  100% {
	    opacity: 1;
	  }
	}
	.offset-md-9 .chat-bubble {
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
	  padding: 6px 2px;
	}
	.chat-box-tray i {
	  color: grey;
	  font-size: 30px;
	  vertical-align: middle;
	}
	.chat-box-tray i:last-of-type {
	  margin-left: 25px;
	}
	.chatBox2{
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
	
</style>
</head>
<body>
<div class="container">

	
	방생성 : <input type="text" id="roomname">
		<input type="button" value="방만들기" class="btn btn-info" id="room2">
	
<%-- 	<input type="hidden" id="roomseq" value="${roomseq}">
	테스트입력 : <input type="text" id="message">
	<input type="submit" id="send" value="send">
	
	
	
	<table>
	<c:forEach items="${chatList }" var="chat">
	<tr>
	<td>${chat.roomname}</td>
	<td>${chat.indate }</td>
	<td>${chat.userid }</td>
	</tr>
	</c:forEach>
	</table>
	 --%>
	
	
	
	
	<div class="row no-gutters chatform">
	  <div class="col-md-4 border-right userBox">
		<div class="settings-tray">
		  <img class="profile-image" src="https://mblogthumb-phinf.pstatic.net/MjAxNzA0MDNfMjEx/MDAxNDkxMTc1MTc3MDU2._c0rnvCrPIVJUFdB40z-tR3eUTv2aC9CMmm9b57lgmUg.FGaQd94-twbynMnhrvYW1gIdijL1vAbXcXQEzsT3WGYg.JPEG.eungee_e/se3_image_570625329.jpg?type=w800" alt="Profile img">
		  <span class="settings-tray--right">
			<i class="material-icons">cached</i>
			<i class="material-icons">message</i>
			<i class="material-icons">menu</i>
		  </span>
		</div>
		<div class="search-box">
		  <div class="input-wrapper">
			<i class="material-icons">search</i>
			<input placeholder="Search here" type="text">
		  </div>
		</div>
		<div class="friend-drawer friend-drawer--onhover">
		  <img class="profile-image" src="https://c.pxhere.com/photos/d5/31/background_cat_red_white_background_image_attention-611858.jpg!d" alt="">
		  <div class="text">
			<h6>test1</h6>
			<p class="text-muted">채팅 내용</p>
		  </div>
		  <span class="time text-muted small">13:21</span>
		</div>
		<hr>
		<div class="friend-drawer friend-drawer--onhover">
		  <img class="profile-image" src="https://blog.kakaocdn.net/dn/0mySg/btqCUccOGVk/nQ68nZiNKoIEGNJkooELF1/img.jpg" alt="">
		  <div class="text">
			<h6>test2</h6>
			<p class="text-muted">채팅 내용1</p>
		  </div>
		  <span class="time text-muted small">00:32</span>
		</div>
		<hr>
		<div class="friend-drawer friend-drawer--onhover ">
		  <img class="profile-image" src="http://blog.jinbo.net/attach/615/200937431.jpg" alt="">
		  <div class="text">
			<h6>test3</h6>
			<p class="text-muted">채팅 내용2</p>
		  </div>
		  <span class="time text-muted small">13:21</span>
		</div>
		<hr>
		<div class="friend-drawer friend-drawer--onhover">
		  <img class="profile-image" src="https://taegon.kim/wp-content/uploads/2018/05/image-1.gif" alt="">
		  <div class="text">
			<h6>test4</h6>
			<p class="text-muted">채팅 내용3</p>
		  </div>
		  <span class="time text-muted small">13:21</span>
		</div>
		<hr>
		<div class="friend-drawer friend-drawer--onhover">
		  <img class="profile-image" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F24283C3858F778CA2EFABE" alt="">
		  <div class="text">
			<h6>test5</h6>
			<p class="text-muted">채팅 내용4</p>
		  </div>
		  <span class="time text-muted small">13:21</span>
		</div>
		<hr>
		<div class="friend-drawer friend-drawer--onhover">
		  <img class="profile-image" src="https://item.kakaocdn.net/do/a3f71a301d363f57dc069aa14d284ae2617ea012db208c18f6e83b1a90a7baa7" alt="">
		  <div class="text">
			<h6>test6</h6>
			<p class="text-muted">채팅 내용5</p>
		  </div>
		  <span class="time text-muted small">13:21</span>
		</div>
	  </div>
	  <div class="col-md-8 chatBox">
		<div class="settings-tray">
			<div class="friend-drawer no-gutters friend-drawer--grey">
			<img class="profile-image" src="https://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg" alt="">
			<div class="text">
			  <h6>test1</h6>
			  <p class="text-muted">상단바</p>
			</div>
			<span class="settings-tray--right">
			  <i class="material-icons">cached</i>
			  <i class="material-icons">message</i>
			  <i class="material-icons">menu</i>
			</span>
		  </div>
		</div>
		<div class="chatBox2">
			<div class="chat-panel">
			  <div class="row no-gutters">
				<div class="col-md-3">
				  <div class="chat-bubble chat-bubble--left">
					채팅 내용11
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3 offset-md-9">
				  <div class="chat-bubble chat-bubble--right">
					채팅 내용22
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3 offset-md-9">
				  <div class="chat-bubble chat-bubble--right">
					채팅 내용33
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3">
				  <div class="chat-bubble chat-bubble--left">
					채팅 내용44
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3">
				  <div class="chat-bubble chat-bubble--left">
					채팅 내용55
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3">
				  <div class="chat-bubble chat-bubble--left">
					채팅 내용66
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3 offset-md-9">
				  <div class="chat-bubble chat-bubble--right">
					채팅 내용77
				  </div>
				</div>
			  </div>
			  <div class="row no-gutters">
				<div class="col-md-3 offset-md-9">
				  <div class="chat-bubble chat-bubble--right">
					채팅 내용88
				  </div>
				</div>
			  </div>
		 	</div>
		</div>
		<div class="row chatBox">
			<div class="col-12">
			  <div class="chat-box-tray">
				<i class="material-icons">sentiment_very_satisfied</i>
				<input type="text" placeholder="내용을 입력하세요.">
				<i class="material-icons">mic</i>
				<i class="material-icons">send</i>
			  </div>
			</div>
		</div>
	  </div>
	</div>
  </div>
          
</body>
</html>