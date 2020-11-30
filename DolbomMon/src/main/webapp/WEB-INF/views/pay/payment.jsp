<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(function(){

	var IMP = window.IMP; // 생략가능
	IMP.init('imp05848718');
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '돌봄몬 결제',
	    amount : 100, //판매 가격
	    buyer_email : '${mvo.email}',
	    buyer_name : '${mvo.username}',
	    buyer_tel : '${mvo.tel1}',
	    buyer_addr : '${mvo.addr}',
	    buyer_postcode : '${mvo.zipcode}'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	   var msg = '결제가 완료되었습니다.';
	           msg += '고유ID : ' + rsp.imp_uid;
	           msg += '상점 거래ID : ' + rsp.merchant_uid;
	           msg += '결제 금액 : ' + rsp.paid_amount;
	           msg += '카드 승인번호 : ' + rsp.apply_num;
	        //성공시 이동할 페이지
	        location.href="<%=request.getContextPath()%>/pay/paySuccess?msg="+msg;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        //실패시 이동할 메세지
	        location.href="<%=request.getContextPath()%>/pay/payFail";
	       
	    }
	    alert(msg);
	});
});

</script>
</body>
</html>