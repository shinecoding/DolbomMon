<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#registerBtn{
		text-align:center;
	}
	#padDiv{
		padding:50px 250px;
	}
</style>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
 	<div class="container">
 		<div id="padDiv">
	 		<div id="padDiv-2" >
				<div class="form-group" id="divId">
				    <label for="inputId" class="col-lg-2 control-label">아이디</label>
				    <div class="col-lg-12">
				        <input type="text" class="form-control" id="id" data-rule-required="true" placeholder="관리자 아이디" maxlength="30">
				    </div>
				</div>
				<div class="form-group" id="divPassword">
				    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
				    <div class="col-lg-12">
				        <input type="password" class="form-control" id="password" name="userpwd" data-rule-required="true" placeholder="패스워드" maxlength="30">
				    </div>
				</div>
				<div class="form-group" id="divPasswordCheck">
				    <label for="inputPasswordCheck" class="col-lg-4 control-label">패스워드 확인</label>
				    <div class="col-lg-12">
				        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
				    </div>
				</div>
				<div class="form-group" id="divName">
				    <label for="inputName" class="col-lg-2 control-label">이름</label>
				    <div class="col-lg-12">
				        <input type="text" class="form-control" id="name" data-rule-required="true" placeholder="이름" maxlength="15">
				    </div>
				</div>
				
				<div class="form-group" id="divNickname">
				    <label for="inputNickname" class="col-lg-2 control-label">부서</label>
				    <div class="col-lg-12">
				        <input type="text" class="form-control" id="department" data-rule-required="true" placeholder="부서" maxlength="15">
				    </div>
				</div>
				
				<div class="form-group" id="divEmail">
				    <label for="inputEmail" class="col-lg-2 control-label">직책</label>
				    <div class="col-lg-12">
				        <input type="email" class="form-control" id="managerPosition" data-rule-required="true" placeholder="직책" maxlength="40">
				    </div>
				</div>
				<div class="form-group" id="divPhoneNumber">
				    <label for="inputPhoneNumber" class="col-lg-4 control-label">휴대폰 번호</label>
				    <div class="col-lg-12">
				        <input type="tel" class="form-control onlyNumber" id="tel" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
				    </div>
				</div>
				<div class="form-group">
				    <label for="inputPhoneNumber" class="col-lg-4 control-label">관리자 권한 설정</label>
				    <div class="col-lg-12">
				        <select class="form-control" id="authority">
				            <option value="A">1등급</option>
				            <option value="B">2등급</option>
				            <option value="C">3등급</option>
				            <option value="D">4등급</option>
				        </select>
				    </div>
				</div>
		        <div class="form-group" id="registerBtn">
			        <div class="col-lg-offset-2 col-lg-12">
						<button type="submit" class="btn btn-primary">관리자 등록</button>
			        </div>
		        </div>
	        </div>
        </div>
	</div>
	