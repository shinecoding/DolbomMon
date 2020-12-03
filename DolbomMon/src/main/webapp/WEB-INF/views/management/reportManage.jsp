<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript" ></script>
<script>
	//$(document).ready(function(){
/* 	 	var table = $("#myTable").DataTable({
			ajax:{
				'url' : 'reportList',
				'type': 'POST',
				'dataSrc' : ''
			},
			columns : [
				{"data" : "SHINGO_NO"},
				{"data" : "SHINGO_REASON"},
				{"data" : "SHINGO_DETAIL"},
				{"data" : "USERID"},
				{"data" : "SHINGO_ID"},
				{"data" : "SHINGO_DATE"},
				{"data" : "SHINGO_STATUS"},
				{"data" : "SHINGO_RESPONSE"},
				{"data" : "shingo_name"}
			] */
/* 			,
			"language":{
	            "emptyTable": "데이터가 없습니다.",
	            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	            "info": "현재 _START_ - _END_ / _TOTAL_건",
	            "infoEmpty": "데이터 없음",
	            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	            "search": "에서 검색: ",
	            "zeroRecords": "일치하는 데이터가 없습니다.",
	            "loadingRecords": "로딩중...",
	            "processing":     "잠시만 기다려 주세요...",
	            "paginate": {
	                "next": "다음",
	                "previous": "이전"
	            }
			} */
	//	}); 
		
		
 		$(document).ready(function() {
		    $('#myTable').DataTable({
		    autoWidth: false,
		     scrollY:500,
		     ajax: {
		      "type" : "POST",
		         "url" : "reportList",
		            "dataType": "JSON"
		         },
		        columns: [
					{"data" : "shingo_no"},
					{"data" : "shingo_reason"},
					{"data" : "userid"},
					{"data" : "shingo_id"},
					{"data" : "shingo_date"},
					{"data" : "shingo_status"},
					{"data" : "shingo_response"},
					  ],
					"language":{
			            "emptyTable": "데이터가 없습니다.",
			            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
			            "info": "현재 _START_ - _END_ / _TOTAL_건",
			            "infoEmpty": "데이터 없음",
			            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			            "search": "에서 검색: ",
			            "zeroRecords": "일치하는 데이터가 없습니다.",
			            "loadingRecords": "로딩중...",
			            "processing":     "잠시만 기다려 주세요...",
			            "paginate": {
			                "next": "다음",
			                "previous": "이전"
			            }
					}
		    });
		} );
	//});
</script>
</head>
<body>

<div style="width:1000px;">
<table id="myTable"  class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>신고번호</th>
            <th>사유</th>
            <th>신고한회원</th>
            <th>신고당한회원</th>
            <th>신고날짜</th>
            <th>처리상태</th>
            <th>답변</th>
        </tr>
    </thead>
</table>
</div>

</body>
</html>