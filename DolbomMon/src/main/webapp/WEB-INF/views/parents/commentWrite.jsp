<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 800px;
	}	
	#top{
		margin: 15px;
		margin-top: 40px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	div{
		text-align: center;
	}
	#commentInfo{
		color: gray;
	}
	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: orange;
	}
	.rating .rate_radio {
	    position: relative;
	    display: inline-block;
	    z-index: 20;
	    opacity: 0.001;
	    width: 60px;
	    height: 60px;
	    background-color: #fff;
	    cursor: pointer;
	    vertical-align: top;
	    display: none;
	}	
	#review_content{
		width: 550px;
		height: 270px;
		margin: 0 auto;
	}
	#reviewDiv{
		margin: 0 auto;
	}
	
</style>
<script>
	function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
		    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		    this.rate = newrate;
		    let items = document.querySelectorAll('.rate_radio');
		    items.forEach(function(item, idx){
		        if(idx < newrate){
		            item.checked = true;
		        }else{
		            item.checked = false;
		        }
		    });
		}
	let rating = new Rating();//별점 인스턴스 생성

	document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	        }
	    })
	});	

	
</script>
</head>
<body>
<div id="top">
<b>후기 작성하기</b>
</div>
<div id="commentInfo">
이용하신 돌봄 선생님은 어떠셨나요?<br/>더 나은 서비스를 위해 후기를 남겨주세요
</div><br/><br/>
<form method="post" action="commentWriteOk">
<div class="review_rating">
	<div class="warning_msg">별점을 선택해 주세요.</div><br/>
	<div class="rating">
		<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
		<input type="checkbox" name="review_star" id="rating1" value="1" class="rate_radio" title="1점">
		<label for="rating1"></label>
		<input type="checkbox" name="review_star" id="rating2" value="2" class="rate_radio" title="2점">
		<label for="rating2"></label>
		<input type="checkbox" name="review_star" id="rating3" value="3" class="rate_radio" title="3점" >
		<label for="rating3"></label>
		<input type="checkbox" name="review_star" id="rating4" value="4" class="rate_radio" title="4점">
		<label for="rating4"></label>
		<input type="checkbox" name="review_star" id="rating5" value="5" class="rate_radio" title="5점">
		<label for="rating5"></label>
	</div>
</div>
<br/>
<div class="form-floating" id="reviewDiv">
  <textarea class="form-control" placeholder="돌봄 선생님에 대한 후기를 남겨주세요" id="review_content" name="review_content"></textarea>
</div><br/>
	<input type="hidden" name="userid" value="${userid}"/>
<div>
<input type="submit" class="btn btn-warning" id="commentConfirm" value="작성하기"/>
</div>
</form>
</body>
</html>