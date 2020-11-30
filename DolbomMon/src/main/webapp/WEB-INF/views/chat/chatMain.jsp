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
		var timerID;
		var roomNo;
		var scrollStop = 1;
		//채팅입력
		$("#send2").click(function(){
			insertChat();
		});
		
		//채팅방 클릭시
		$(".roomBox>div").click(function(e){
			roomNo = $(this).attr('id');
	        e.preventDefault();
		    clearTimeout(timerID); // 타이머 중지
		    
		    selectRoom(roomNo);
		});
		$("#room2").click(function(){
			$(".container").css("display","block");
		});
		
		 
		//자동스크롤 다운
		function scrollDown(){
			if(scrollStop==1){
			$(".chat-panel").scrollTop($(".chat-panel")[0].scrollHeight);
			}
		}
		
		
		//스크롤 올릴때 자동으로 내려가는것 멈추기
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
		});
		
		
		$("#message").keypress(function(event){
			var kcode=event.keyCode;
			if(kcode=='13'){
				insertChat();
			}
		});
		
		//채팅방 접속, 생성(접속기능=채팅폼 띄우기. 만약 방검사해서 해당 인물과 방 없으면 채팅룸하나 만들기)
		$("#room2").click(function(){
			makeRoom();
		})
		var roomseq;
		function makeRoom(){
			$.ajax({
				url : "makeRoom", //채팅폼의 액션
				data : {
					roomname:$("#roomname").val(),
				},
				type : "post",
				success : function(result){
				///////////
						var $data = $(result);
						tag="";
						$data.each(function(idx, rVo){
							tag+='<div class="friend-drawer friend-drawer--onhover" id="'+rVo.roomseq+'">';
							tag+='<img class="profile-image" src="https://c.pxhere.com/photos/d5/31/background_cat_red_white_background_image_attention-611858.jpg!d" alt="">';
							tag+='<div class="text">';
							tag+='<h6>'+rVo.roomseq+' : ';
							if(rVo.userid=="${myId}"){
								tag+=rVo.userid_t;
							}else{
								tag+=rVo.userid
							}
							tag+='</h6>';
							tag+='<p class="time text-muted small">'+rVo.indate+'</p></div>';
							tag+='<i class="material-icons" style="line-height:50px;">message</i>';
							tag+="</div><hr>";
						});					
						$(".roomBox").html(tag);
						
						
				/////////////
					
					
					$("#roomname").val("");
					$("#message").focus();
				}
			});
		}
		
		//채팅입력시
		function insertChat(){
			$.ajax({
				url : "insertChat", //채팅폼의 액션
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
								tag+="</div></div></div>";
							}else{
								tag+="<div class='col-md-6'>";
								tag+="<div class='chat-bubble chat-bubble--left'>";
								tag+=mVo.message;
								tag+="</div></div></div>";
							}
						});					
						$(".chat-panel").html(tag);
						$("#roomseq").val(roomNo);
						scrollDown()
				}
			});
			timerID = setTimeout(selectRoom, 1000, roomNo);
		}
		
		/////////////////////////////////////////////////////////
		
		
		
		/* function insertChat(){
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
		} */
		
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
		height:50px;
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
	
</style>
</head>
<body>

		<input type="button" value="방만들기" class="btn btn-info" id="room2" style="margin-bottom:15px;">
<div class="container" style="display:none">

	

	
	
	<div class="row no-gutters chatform">
	  <div class="col-md-4 border-right userBox">
		<div class="settings-tray">
		  <img class="profile-image" src="https://mblogthumb-phinf.pstatic.net/MjAxNzA0MDNfMjEx/MDAxNDkxMTc1MTc3MDU2._c0rnvCrPIVJUFdB40z-tR3eUTv2aC9CMmm9b57lgmUg.FGaQd94-twbynMnhrvYW1gIdijL1vAbXcXQEzsT3WGYg.JPEG.eungee_e/se3_image_570625329.jpg?type=w800" alt="Profile img">
		  <!-- 본인 프로필 이미지 -->
		  <span class="settings-tray--right">
			<i class="material-icons">cached</i> <!-- 채팅방 새로고침 -->
		  </span>
		</div>
		<div class="search-box">
		  <div class="input-wrapper">
			<i class="material-icons">search</i> <!-- 상대방 검색? -->
			<input placeholder="Search here" type="text">
		  </div>
		</div>
		
		<!-- -------------------- 채팅room 영역--------------------- -->
		<div class="roomBox">
	<%-- 	<c:forEach var="vo" items="${roomList}">
		<div class="friend-drawer friend-drawer--onhover" id="${vo.roomseq}">
		  <img class="profile-image" src="https://c.pxhere.com/photos/d5/31/background_cat_red_white_background_image_attention-611858.jpg!d" alt="">
		  <div class="text">
			<h6>${vo.roomseq} : 
			<c:choose>
				<c:when test="${vo.userid.equals(userid)}">
					${vo.userid_t}
				</c:when>
				<c:otherwise>
					${vo.userid}
				</c:otherwise>
			</c:choose>
			</h6>
			<p class="time text-muted small">${vo.indate}</p>
		  </div>
		  <i class="material-icons" style="line-height:50px;">message</i>
		</div>
		<hr>
		</c:forEach> --%>
		</div>
		
	  </div>
	  
	  <!-- -------------------- 채팅 room 영역 end--------------------- -->
	  
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
			  <i class="material-icons">menu</i>
			</span>
		  </div>
		</div>
			<div class="chat-panel">
			  
		 	</div>
		<div class="row chatBox">
			<div class="col-12">
			  <div class="chat-box-tray">
				<i class="material-icons">sentiment_very_satisfied</i>
				<input type="text" name="message" placeholder="내용을 입력하세요." id="message">
				<input type="hidden" name="roomseq" id="roomseq" value="">
				<input type="button" id="send2" value="보내기" class="btn btn-secondary" style="width:100px">
				<!-- 결제넘어가는 버튼 만들기 --><i class="material-icons">send</i>
			  </div>
			</div>
		</div>
	  </div>
	</div>
  </div>
          
</body>
</html>