<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
</head>
<script>
	$(function(){
		$("#depositTest").click(function(){
			$.ajax({
				url : "https://testapi.openbanking.or.kr/v2.0",
				type : "POST",
				data :{
					  "cntr_account_type": "N",
					  "cntr_account_num": "7926113990",
					  "wd_pass_phrase": "NONE",
					  "wd_print_content": "테스트",
					  "name_check_option": "off",
					  "sub_frnc_name": "하위가맹점",
					  "sub_frnc_num": "123456789012",
					  "sub_frnc_business_num": "1234567890",
					  "tran_dtime": "20201001150133",
					  "req_cnt": "1",
					  "req_list": [
					    {
					      "tran_no": "1",
					      "bank_tran_id": "F123456789U4BC34239Z",
					      "fintech_use_num": "199158928057879980186508",
					      "print_content": "테스트",
					      "tran_amt": "10000",
					      "req_client_name": "홍길동",
					      "req_client_bank_code": "097",
					      "req_client_account_num": "00012300000678",
					      "req_client_num": "HONGGILDONG1234",
					      "transfer_purpose": "TR",
					      "cms_num": "93848103221"
					    }
					  ]
					},
					success : function(){
						var msg = "test";
						alert(msg);
						
					}
			})
		});	
	});
	
</script>
<body>

<button id="depositTest">환불, 입금 테스트</button>
</body>
</html>