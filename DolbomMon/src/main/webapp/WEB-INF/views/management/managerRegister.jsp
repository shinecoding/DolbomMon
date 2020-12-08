<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" type="text/css" />
<link rel="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap-reboot.min.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.background {
	  position: fixed;
	  z-index: -1;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  object-fit: cover;
	  height: 100%;
	  width: 100%;
	}
	
	.form-btn,
	.form-btn-cancel,
	.form-btn-error {
	  background: transparent;
	  font-size: 1rem;
	  color: #fff;
	  cursor: pointer;
	  border: 1px solid transparent;
	  padding: 5px 24px;
	  margin-top: 2.25rem;
	  position: relative;
	  z-index: 0;
	  transition: transform 0.28s ease;
	  will-change: transform;
	}
	
	.form-btn::before,
	.form-btn::after,
	.form-btn-cancel::before,
	.form-btn-cancel::after,
	.form-btn-error::before,
	.form-btn-error::after {
	  position: absolute;
	  content: "";
	  top: -1px;
	  left: -1px;
	  right: -1px;
	  bottom: -1px;
	}
	
	.form-btn::before,
	.form-btn-cancel::before,
	.form-btn-error::before {
	  background: #337ab7;
	  z-index: -2;
	}
	
	.form-btn::after,
	.form-btn-cancel::after,
	.form-btn-error::after {
	  background: #000;
	  z-index: -1;
	  opacity: 0;
	  transition: opacity 0.28s ease;
	  will-change: opacity;
	}
	
	.form-btn:focus,
	.form-btn-cancel:focus,
	.form-btn-error:focus {
	  outline: none;
	}
	
	.form-btn:focus::after,
	.form-btn:hover::after,
	.form-btn-cancel:focus::after,
	.form-btn-cancel:hover::after,
	.form-btn-error:focus::after,
	.form-btn-error:hover::after {
	  opacity: 0.3;
	}
	
	.form-btn:active,
	.form-btn-cancel:active,
	.form-btn-error:active {
	  transform: translateY(1px);
	}
	
	.form-btn-error::before {
	  background: #d9534f;
	}
	
	.form-btn-cancel {
	  transition: color 0.28s ease, transform 0.28s ease;
	  color: #b52b27;
	  border-color: currentColor;
	  will-change: color, transform;
	}
	
	.form-btn-cancel.-nooutline {
	  border-color: transparent;
	}
	
	.form-btn-cancel::before {
	  background: #b52b27;
	  opacity: 0;
	  transition: opacity 0.28s ease;
	  will-change: opacity;
	}
	
	.form-btn-cancel::after {
	  display: none;
	}
	
	.form-btn-cancel:focus,
	.form-btn-cancel:hover {
	  color: #fff;
	}
	
	.form-btn-cancel:focus::before,
	.form-btn-cancel:hover::before {
	  opacity: 1;
	}
	
	.form-btn-block {
	  display: block;
	  width: 100%;
	  padding: 5px;
	}
	
	.form-checkbox-inline .form-checkbox-label{
	  display: inline-block;
	  margin-right: 1rem;
	}
	
	.form-checkbox-legend{
	  margin: 0 0 0.125rem 0;
	  font-weight: 500;
	  font-size: 1rem;
	  color: #333;
	}
	
	.form-checkbox-label{
	  position: relative;
	  cursor: pointer;
	  padding-left: 1.5rem;
	  text-align: left;
	  color: #333;
	  display: block;
	  margin-bottom: 0.5rem;
	}
	
	.form-checkbox-label:hover i{
	  color: #337ab7;
	}
	
	.form-checkbox-label span{
	  display: block;
	}
	
	.form-checkbox-label input{
	  width: auto;
	  opacity: 0.0001;
	  position: absolute;
	  left: 0.25rem;
	  top: 0.25rem;
	  margin: 0;
	  padding: 0;
	}
	
	.form-checkbox-button {
	  position: absolute;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	  display: block;
	  color: #999;
	  left: 0;
	  top: 0.25rem;
	  width: 1rem;
	  height: 1rem;
	  z-index: 0;
	  border: 0.125rem solid currentColor;
	  border-radius: 0.0625rem;
	  transition: color 0.28s ease;
	  will-change: color;
	}
	
	.form-checkbox-button::before,
	.form-checkbox-button::after {
	  position: absolute;
	  height: 0;
	  width: 0.2rem;
	  background-color: #337ab7;
	  display: block;
	  transform-origin: left top;
	  border-radius: 0.25rem;
	  content: "";
	  transition: opacity 0.28s ease, height 0s linear 0.28s;
	  opacity: 0;
	  will-change: opacity, height;
	}
	
	.form-checkbox-button::before {
	  top: 0.65rem;
	  left: 0.38rem;
	  transform: rotate(-135deg);
	  box-shadow: 0 0 0 0.0625rem #fff;
	}
	
	.form-checkbox-button::after {
	  top: 0.3rem;
	  left: 0;
	  transform: rotate(-45deg);
	}
	
	.form-checkbox-field:checked ~ .form-checkbox-button {
	  color: #337ab7;
	}
	
	.form-checkbox-field:checked ~ .form-checkbox-button::after,
	.form-checkbox-field:checked ~ .form-checkbox-button::before {
	  opacity: 1;
	  transition: height 0.28s ease;
	}
	
	.form-checkbox-field:checked ~ .form-checkbox-button::after {
	  height: 0.5rem;
	}
	
	.form-checkbox-field:checked ~ .form-checkbox-button::before {
	  height: 1.2rem;
	  transition-delay: 0.28s;
	}
	
	
	.form-has-error .form-checkbox-button{
	  color: #d9534f;
	}
	
	.form-card {
	  border-radius: 2px;
	  background: #fff;
	  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	  transition: all 0.56s cubic-bezier(0.25, 0.8, 0.25, 1);
	  max-width: 500px;
	  padding: 0;
	  margin: 50px auto;
	}
	
	.form-card:hover,
	.form-card:focus {
	  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
	}
	
	.form-card:focus-within {
	  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
	}
	
	.form-actions {
	  position: relative;
	  display: -ms-flexbox;
	  display: flex;
	  margin-top: 2.25rem;
	}
	
	.form-actions .form-btn-cancel {
	  -ms-flex-order: -1;
	  order: -1;
	}
	
	.form-actions::before {
	  content: "";
	  position: absolute;
	  width: 100%;
	  height: 1px;
	  background: #999;
	  opacity: 0.3;
	}
	
	.form-actions > * {
	  -ms-flex: 1;
	  flex: 1;
	  margin-top: 0;
	}
	
	.form-fieldset {
	  padding: 30px;
	  border: 0;
	}
	
	.form-fieldset + .form-fieldset {
	  margin-top: 15px;
	}
	
	.form-legend {
	  padding: 1em 0 0;
	  margin: 0 0 -0.5em;
	  font-size: 1.5rem;
	  text-align: center;
	}
	
	.form-legend + p {
	  margin-top: 1rem;
	}
	
	.form-element {
	  position: relative;
	  margin-top: 2.25rem;
	  margin-bottom: 2.25rem;
	}
	
	.form-element-hint {
	  font-weight: 400;
	  font-size: 0.6875rem;
	  color: #a6a6a6;
	  display: block;
	}
	
	.form-element-bar {
	  position: relative;
	  height: 1px;
	  background: #999;
	  display: block;
	}
	
	.form-element-bar::after {
	  content: "";
	  position: absolute;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  background: #337ab7;
	  height: 2px;
	  display: block;
	  transform: rotateY(90deg);
	  transition: transform 0.28s ease;
	  will-change: transform;
	}
	
	.form-element-label {
	  position: absolute;
	  top: 0.75rem;
	  line-height: 1.5rem;
	  pointer-events: none;
	  padding-left: 0.125rem;
	  z-index: 1;
	  font-size: 1rem;
	  font-weight: normal;
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  margin: 0;
	  color: #a6a6a6;
	  transform: translateY(-50%);
	  transform-origin: left center;
	  transition: transform 0.28s ease, color 0.28s linear, opacity 0.28s linear;
	  will-change: transform, color, opacity;
	}
	
	.form-element-field {
	  outline: none;
	  height: 1.5rem;
	  display: block;
	  background: none;
	  padding: 0.125rem 0.125rem 0.0625rem;
	  font-size: 1rem;
	  border: 0 solid transparent;
	  line-height: 1.5;
	  width: 100%;
	  color: #333;
	  box-shadow: none;
	  opacity: 0.001;
	  transition: opacity 0.28s ease;
	  will-change: opacity;
	}
	
	.form-element-field:-ms-input-placeholder {
	  color: #a6a6a6;
	  transform: scale(0.9);
	  transform-origin: left top;
	}
	
	.form-element-field::placeholder {
	  color: #a6a6a6;
	  transform: scale(0.9);
	  transform-origin: left top;
	}
	
	.form-element-field:focus ~ .form-element-bar::after {
	  transform: rotateY(0deg);
	}
	
	.form-element-field:focus ~ .form-element-label {
	  color: #337ab7;
	}
	
	.form-element-field.-hasvalue,
	.form-element-field:focus {
	  opacity: 1;
	}
	
	.form-element-field.-hasvalue ~ .form-element-label,
	.form-element-field:focus ~ .form-element-label {
	  transform: translateY(-100%) translateY(-0.5em) translateY(-2px) scale(0.9);
	  cursor: pointer;
	  pointer-events: auto;
	}
	
	.form-has-error .form-element-label.form-element-label,
	.form-has-error .form-element-hint {
	  color: #d9534f;
	}
	
	.form-has-error .form-element-bar,
	.form-has-error .form-element-bar::after {
	  background: #d9534f;
	}
	
	.form-is-success .form-element-label.form-element-label,
	.form-is-success .form-element-hint {
	  color: #259337;
	}
	
	.form-is-success .form-element-bar::after {
	  background: #259337;
	}
	
	input.form-element-field:not(:placeholder-shown),
	textarea.form-element-field:not(:placeholder-shown) {
	  opacity: 1;
	}
	
	input.form-element-field:not(:placeholder-shown) ~ .form-element-label,
	textarea.form-element-field:not(:placeholder-shown) ~ .form-element-label {
	  transform: translateY(-100%) translateY(-0.5em) translateY(-2px) scale(0.9);
	  cursor: pointer;
	  pointer-events: auto;
	}
	
	textarea.form-element-field {
	  height: auto;
	  min-height: 3rem;
	}
	
	select.form-element-field {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  cursor: pointer;
	}
	
	.form-select-placeholder {
	  color: #a6a6a6;
	  display: none;
	}
	
	.form-select .form-element-bar::before {
	  content: "";
	  position: absolute;
	  height: 0.5em;
	  width: 0.5em;
	  border-bottom: 1px solid #999;
	  border-right: 1px solid #999;
	  display: block;
	  right: 0.5em;
	  bottom: 0;
	  transition: transform 0.28s ease;
	  transform: translateY(-100%) rotateX(0deg) rotate(45deg);
	  will-change: transform;
	}
	
	.form-select select:focus ~ .form-element-bar::before {
	  transform: translateY(-50%) rotateX(180deg) rotate(45deg);
	}
	
	.form-element-field[type=number] {
	  -moz-appearance: textfield;
	}
	
	.form-element-field[type=number]::-webkit-outer-spin-button,
	.form-element-field[type=number]::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	
	body {
	  margin: 40px auto;
	  background-image: linear-gradient(to top, #a3bded 0%, #6991c7 100%);
	}
</style>
<script>

	document.addEventListener("change", function(event) {
		  let element = event.target;
		  if (element && element.matches(".form-element-field")) {
		    element.classList[element.value ? "add" : "remove"]("-hasvalue");
		  }
	});
	
	/*
	$('.form-card').submit(
			function ajaxMemo(){	
				var params = $(".form-card").serialize();
				$.ajax({
					url:"/dbmon/managerInsert",
					data:params,
					type:"POST",
					success : function(){
						alert("성공적으로 관리자가 등록되었습니다.");
				    	opener.location.reload();
				        window.close();
					}
				})
			}
			)
	*/
	
	$('#subBtn').click(function(){
		alert("test");		
	});
	
	$(function(){
		$('.form-card').submit(
			//$('#subBtn').click(
				function ajaxtest(){	
					var params = $("form[name=form-card]").serialize();
					alert(params);	
				
					$.ajax({
						url:"/dbmon/managerInsert",
						data:params,
						type:"POST",
						success : function(){
					    	opener.location.reload();
					        window.close();
						}, error : function(request,status,error){
					    	opener.location.reload();
					       	window.close();
						}
					});
				}
		)
	});
	
	// 서브밋 새로고침 없게 만들기. ajax로 보낼때 새로고침이 생기기때문에 success로 가기전에 데이터가 날아간다. ajax쓸때는 submit버튼을 쓰면 안되지만 유효성검사 편하게 하려고 어거지로 되게 만듬.
	//아이디 중복검사만 만들기.
	const toDoForm = document.querySelector('.js-toDoForm'),
	  toDoInput = toDoForm.querySelector('input'),
	  toDoList = document.querySelector('.js-toDoList')
	const TODOS_LS = 'toDos'

	function paintToDo(text) {
	  const li = document.createElement('li')
	  const delBtn = document.createElement('button')
	  delBtn.innerText = '❌'
	  const span = document.createElement('span')
	  span.innerText = text
	  li.appendChild(delBtn)
	  li.appendChild(span)
	  toDoList.appendChild(li)
	}

	function handleSubmit(event) {
	  event.preventDefault()
	  const currentValue = toDoInput.value
	  paintToDo(currentValue)
	  toDoInput.value = '' //submit처럼 값을 보냈을때 input창에 있는 값 초기화
	}

	function loadToDos() {
	  const toDos = localStorage.getItem(TODOS_LS)
	  if (toDos !== null) {
	  }
	}
	function init() {
	  loadToDos()
	  //input 태그에 submit 이벤트가 발생했을 경우
	  toDoForm.addEventListener('submit', handleSubmit)
	}

	init()
</script>
</head>
<body>
<video width="1280" height="720" class="background" autoplay muted loop>
  <source src="https://codepen.jonnitto.ch/BackgroundVideo.mp4" type="video/mp4">
</video>
<form class="form-card" name="form-card" id="managerForm"> <!--  method="post" action="/dbmon/managerInsert" -->
    <fieldset class="form-fieldset">
        <legend class="form-legend">관리자 등록</legend>
        <div class="form-checkbox form-checkbox-inline">
            <div class="form-checkbox-legend"><h5 style="margin-left:1px;">권한 설정</h5></div>
            <label class="form-checkbox-label">
                <input name="manager_join_authority" class="form-checkbox-field" type="checkbox"  value="Y"/>
                <i class="form-checkbox-button"></i>
                <span>관리자등록권한</span>
            </label><br/>
            <label class="form-checkbox-label">
                <input name="member_inactivity_authority" class="form-checkbox-field" type="checkbox" value="Y" />
                <i class="form-checkbox-button"></i>
                <span>회원비활성화권한</span>
            </label><br/>
            <label class="form-checkbox-label">
                <input name="page_authority" class="form-checkbox-field" type="checkbox" value="Y" />
                <i class="form-checkbox-button"></i>
                <span>웹페이지관리권한</span>
            </label>
            <small class="form-element-hint">관리권한 설정은 필수입니다.</small>
        </div>
        <div class="form-element form-input">
            <input id="userid" name="userid" class="form-element-field" placeholder="아이디" type="text" required autocomplete="off"/>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="userid">관리자 ID</label>
        </div>
        <div class="form-element form-input">
            <input id="password" name="userpwd" class="form-element-field" placeholder="패스워드" type="password" required autocomplete="off"/>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="password">관리자 패스워드</label>
        </div>
        <div class="form-element form-select">
            <select name="department" id="department" class="form-element-field" required>
                <option disabled selected value="" class="form-select-placeholder"></option>
                <option value="전산운영팀">전산운영팀</option>
                <option value="정보기획팀">정보기획팀</option>
                <option value="개발팀">개발팀</option>
                <option value="CS팀">CS팀</option>
                <option value="감사팀">감사팀</option>
            </select>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="field-be1h8i-ll2hpg-q4efzm-nfjj1e-udkw5r">부서명</label>
        </div>
         <div class="form-element form-select">
            <select name="position" id="position" class="form-element-field" required>
                <option disabled selected value="" class="form-select-placeholder"></option>
                <option value="인턴">인턴</option>
                <option value="사원">사원</option>
                <option value="대리">대리</option>
                <option value="계장">계장</option>
                <option value="과장">과장</option>
                <option value="차장">차장</option>
                <option value="부장">부장</option>
            </select>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="field-be1h8i-ll2hpg-q4efzm-nfjj1e-udkw5r">직위</label>
        </div>
        <div class="form-element form-input">
            <input id="username" name="username" class="form-element-field" placeholder="이름" type="text" required autocomplete="off"/>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="username">이름</label>
        </div>
        <div class="form-element form-input" style="margin-bottom:16px;">
            <input id="tel" name="tel" class="form-element-field" placeholder="연락처" type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required autocomplete="off"/>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="tel">연락처</label>
            <small class="form-element-hint">ex)010-0000-0000</small>
        </div>
        <div class="form-element form-input" style="margin-top:23px;">
            <input name="email" id="email" class="form-element-field" placeholder="이메일" type="email" required autocomplete="off"/>
            <div class="form-element-bar"></div>
            <label class="form-element-label" for="email">Email</label>
            <small class="form-element-hint">업무용 이메일을 입력해주세요.</small>
        </div>
    </fieldset>
    <div class="form-actions">
        <button class="form-btn" id="subBtn" type="submit">등록</button>
        <button class="form-btn-cancel -nooutline" type="reset">취소</button>
    </div>
</form>
</body>