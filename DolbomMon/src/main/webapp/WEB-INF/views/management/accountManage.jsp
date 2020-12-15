<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<style>
	*, html{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#accountTable{
		font-size:14px;
	}
	td {
		white-space: nowrap;
	}
	.clickTr:hover{
		background-color: #efefef;
	}
	.clearfix:after { clear:both; }
	td img{
		width:20px;
		height:20px;
	}
</style>
<script>
var test='<%=(String)session.getAttribute("userid")%>';
	$(document).ready(function() {
	   accountTable = $('#accountTable').DataTable({
		   "order"        : [[ 0, "desc" ]], //정렬을 indate로 바꿔야한다. 업데이트 할때마다 indate sysdate 등록하게 해야함.
	    	"scrollX" : true,
	    	"lengthMenu": [10, 25, 50],
		    "autoWidth" : "false",
		    "bStateSave" : "true", //쿠키저장
		    dom: 'Bfrtip',
			buttons: [
				/*'copy', 'csv', 'excel', 'pdf'*/
				
				{
					extend: 'pageLength',
					text: '표시할 레코드수',
				},
				{
					extend: 'copy',
					text: '복사',
					title: '관리자 데이터베이스입니다.',
					//className: 'btn btn-sm btn-primary' 
				},
				{
					extend: 'excel',
					text: '엑셀',
					filename: '관리자 EXCEL',
					title: '관리자 데이터베이스입니다.'
				},
				{
					extend: 'csv',
					text: 'CSV',
					filename: '관리자 CSV(UTF-8->MS엑셀에서 바로 열면 인코딩문제가 생깁니다. CSV불러오기로 가져오세요.)'
				},
				{
					extend: 'pdf',
					text: 'PDF',
					filename: '관리자 데이터베이스 PDF입니다.'
				}
			],createdRow: function (row, data, dataIndex) {
			    $(row).addClass('clickTr');
			},
		ajax: {
			"type" : "POST",
			"url" : "paymentList",
			"dataType": "JSON"
	         },columns: [
				{"data" : "pay_no",
					"render":  function (data, type, row) {
						if ( data == null ) {
						console.log('data test'+data)
						 return '';
						}
						return data;
				}},
				{"data" : "parent_id",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "parent_name",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "pay_date",
					"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
				{"data" : "pay_money",
					"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
				{"data" : "teacher_id",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<a class="selectId" href="/dbmon/parentProfile?userid='+ data + '" target="_blank">' + data + '</a>';
		                    }
		                    return data;	
				
				}},
				{"data" : "refund_status",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "reimburse",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "pay_id",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "merchant_id",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "apply_num",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "tel",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "email",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
			],"language":{
	            "emptyTable": "데이터가 없습니다.",
	            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	            "info": "현재 _START_ - _END_ / _TOTAL_건",
	            "infoEmpty": "데이터 없음",
	            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	            "search": "검색: ",
	            "zeroRecords": "일치하는 데이터가 없습니다.",
	            "loadingRecords": "로딩중...",
	            "processing":     "잠시만 기다려 주세요...",
	            "paginate": {
	                "next": "다음",
	                "previous": "이전"
	            }
			},columnDefs: [
				{ targets: 0, width: 70 },
				{ targets: 1, width: 70 },
				{ targets: 2, width: 70 },
				{ targets: 3, width: 70 },
				{ targets: 4, width: 70 },
				{ targets: 5, width: 70 },
				{ targets: 6, width: 70 },
				{ targets: 7, width: 70 },
				{ targets: 8, width: 70 },
				{ targets: 9, width: 70 },
				{ targets: 10, width: 70 },
				{ targets: 11, width: 70 },
				{ targets: 12, width: 70 },
			]
	    });
	   console.log("test");
	   $('.dt-button').addClass('btn btn-outline-info');
	   $('.dt-button').removeClass('dt-button');
	});
	//팝업창 위치
	/* iframe으로 열기
	function onPopupWindow(){
		var win =  window.open(null, '_blank', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		win.document.write('<iframe width="100%", height="100%" src="/dbmon/managerRegister" frameborder="0" allowfullscreen></iframe>')
	}
	*/
	//마우스 휠 방향전환
	$("#accountTable").on('mousewheel',function(e){
		var wheelDelta = e.originalEvent.wheelDelta;
		if(wheelDelta > 0){
			$(".dataTables_scrollBody").scrollLeft(-wheelDelta + $(".dataTables_scrollBody").scrollLeft());
		}else{
			$(".dataTables_scrollBody").scrollLeft(-wheelDelta + $(".dataTables_scrollBody").scrollLeft());
		}
	});
	
	$(document).on("click","tr",function(){
		$('tr').css("background-color","#fff");
		$(this).closest('tr').css("background-color","antiquewhite");
	});
	
	$(document).on("click",".eBtn",function(){
		if(confirm("해당 관리자의 정보를 수정하겠습니까?")){
			var userid = $(this).closest('tr').find('td:eq(1)').text();
			window.open('/dbmon/updateManager?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
		}
	});
</script>
</head>
<body>
<!-- table-bordered  -->

<div class="container" style="padding-top:50px;">
<table id="accountTable"  class="table hover">
    <thead>
        <tr>
            <th>결제 번호</th>
            <th>결제자ID</th>
            <th>이름</th>
            <th>결제일</th>
            <th>결제금액</th>
            <th>선생님ID</th>
            <th>환불신청여부</th>
            <th>환불진행여부</th>
            <th>결제고유ID</th>
            <th>상점거래ID</th>
            <th>카드승인번호</th>                        
            <th>연락처</th>
            <th>email</th>
        </tr>
    </thead>
</table>

</div>

</body>
</html>