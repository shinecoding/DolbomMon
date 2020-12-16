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
	#memberTable{
		font-size:14px;
	}
	td {
		white-space: nowrap;
		overflow:hidden;
		text-overflow: ellipsis;
	}
	.clickTr:hover{
		background-color: #efefef;
	}
	td img{
		width:20px;
		height:20px;
	}
</style>
<script>
var memberTable;
	$(document).ready(function() {
	   memberTable = $('#memberTable').DataTable({
	    	"order"        : [[ 0, "desc" ]], //정렬을 indate로 바꿔야한다. 업데이트 할때마다 indate sysdate 등록하게 해야함.
	    	"destroy" : true,
	    	"scrollX" : true,
	    	"lengthMenu": [10, 25, 50],
		    "autoWidth" : "false",
		    "bStateSave" : "true", //쿠키저장
		    orderMulti: true,
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
					title: '회원정보 데이터베이스입니다.',
					//className: 'btn btn-sm btn-primary' 
				},
				{
					extend: 'excel',
					text: '엑셀',
					filename: '회원정보 EXCEL',
					title: '회원정보 데이터베이스입니다.'
				},
				{
					extend: 'csv',
					text: 'CSV',
					filename: '회원정보 CSV(UTF-8->MS엑셀에서 바로 열면 인코딩문제가 생깁니다. CSV불러오기로 가져오세요.)'
				},
				{
					extend: 'pdf',
					text: 'PDF',
					filename: '회원정보 데이터베이스 PDF입니다.'
				}
			],createdRow: function (row, data, dataIndex) {
			    $(row).addClass('clickTr');
			},
		ajax: {
			"type" : "POST",
			"url" : "memberManageList",
			"dataType": "JSON"
	         },columns: [
	        	 {"data" : "no",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<span id="'+data+'">' + data + '</span>';
		                    }
		                    return data;	
				
				}},
	        	{"data" : "who",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else if( data == 'P'){
							data = '부모님 회원';
						}else if( data == 'T'){
							data = '선생님 회원'
						}
						return data;
				}},
				{"data" : "reasontoleave",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a class="lBtn" href="#")><img src="/dbmon/icon/leaveicon.png" title="탈퇴사유">사유확인</a>'
						}
						return data;
				}},
				{"data" : "leavedate",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
				{"data" : "activity",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else if( data == 'Y'){
							data = '<span style="color:green">활동회원</span> <a class="xBtn" href="#" id="activity"><img src="/dbmon/icon/ybutton.png" title="활동정지"></a>';
						}else if( data == 'N'){
							data = '<span style="color:red">정지회원</span> <a class="yBtn" href="#" id="activity"><img src="/dbmon/icon/returnicon.png" title="정지해제"></a>';
						}
						return data;
				}},
	        	{"data" : "userid",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<a class="selectId" href="/dbmon/parentProfile?userid='+ data + '" target="_blank">' + data + '</a>';
		                    }
		                    return data;	
				}},
	        	{"data" : "memo",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a class="mBtn" href="#")><img src="/dbmon/icon/memo.png" title="회원메모"></a> 메모'
						}
						return data;
				}},
	        	{"data" : "username"},
	        	{"data" : "gender",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else if(data == 'M'){
							data = "남성"
						}else{
							data = "여성"
						}
						return data;
				}},
	        	{"data" : "birth",
					"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
		        {"data" : "tel1",
					"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
	        	{"data" : "tel2",
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
	        	{"data" : "addr",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
	        	{"data" : "addrdetail",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
				{"data" : "zipcode",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
				}},
	        	{"data" : "regdate",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
	        	{"data" : "lat",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
				{"data" : "lng",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
	        	{"data" : "bank_name",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}
					return data;
				}},
	        	{"data" : "bank_account_no",
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
				{ targets: 13, width: 70 },
				{ targets: 14, width: 70 },
				{ targets: 15, width: 70 },
				{ targets: 16, width: 120 },
				{ targets: 17, width: 70 },
				{ targets: 18, width: 70 },
				{ targets: 19, width: 70 },
				{ targets: 20, width: 70 },
			] 
	    });
	   $('.dt-button').addClass('btn btn-outline-info');
	   $('.dt-button').removeClass('dt-button');
	});
	
	
	function openMessage(userid){
	    window.open('/dbmon/messageWrite?receiveId='+userid,'message','width=1200,height=1000,status=no,toolbar=no,resizable=yes,scrollbars=no, left=500, top=120');  
	}  
	
	//재업로드 하면 상태가 S로 바뀌게 만들기.
	$(document).on("click",".xBtn",function(){
		if(confirm("이 회원을 활동 정지시키겠습니까?")){

		var no = $(this).closest('tr').find('td:eq(0)').text();
		var type= $(this).attr('id');
		reason(no);
		$.ajax({
				url:"updateActivity",
				async : false,
				type:"POST",
				data : {
					no:no,
					certi:"N",
					type:type,
				},success : function(){
					location.href="/dbmon/management?type=memberManage?no="+no;
				}
			})
		}
	});
	$(document).on("click",".yBtn",function(){
		if(confirm("이 회원의 활동 정지를 해제하시겠습니까?")){
		var no = $(this).closest('tr').find('td:eq(0)').text();
		var type= $(this).attr('id');
		
		$.ajax({
				url:"updateActivity",
				async : false,
				type:"POST",
				data : {
					no:no,
					certi:"Y",
					type:type,
				},success : function(){
					location.href="/dbmon/management?type=memberManage?no="+no;
				}
			})
		}
	});
	function reason(no){
		console.log("test")
		var win = window.open("/dbmon/inactivityReason?no="+no, '', '_blank'); 
	}
	
	$(document).on("click","tr",function(){
		$('tr').css("background-color","#fff");
		$(this).closest('tr').css("background-color","antiquewhite");
	});
	
	$(document).on("click",".mBtn",function(){
		var no = $(this).closest('tr').find('td:eq(0)').text();
		var win = window.open("/dbmon/memberMemo?no="+no, '', '_blank'); 
		//location.href="/dbmon/memberMemo?no="+no;

	});
	
	$(document).on("click",".lBtn",function(){
		var no = $(this).closest('tr').find('td:eq(0)').text();
		console.log(no)
		var win = window.open("/dbmon/leaveReason?no="+no, '', '_blank'); 
		//location.href="/dbmon/memberMemo?no="+no;

	});
	
	//마우스 휠 방향전환
	$("#memberTable").on('mousewheel',function(e){
		var wheelDelta = e.originalEvent.wheelDelta;
		if(wheelDelta > 0){
			$(".dataTables_scrollBody").scrollLeft(-wheelDelta + $(".dataTables_scrollBody").scrollLeft());
		}else{
			$(".dataTables_scrollBody").scrollLeft(-wheelDelta + $(".dataTables_scrollBody").scrollLeft());
		}
	});
	
	
	//색깔 쿠키에 기록? 온로드 안먹힘
	function trColor(no){
		$("'#"+no+"'").closest('tr').css("background-color","antiquewhite");
		console.log("'#"+no+"'");
	}
	
</script>
</head>
<body>
<!-- table-bordered  -->

<div class="container" style="padding-top:50px;">
<table id="memberTable"  class="table hover">
    <thead>
        <tr>
            <th>번호</th>
            <th>회원분류</th>
            <th>회원탈퇴<br/>신청사유</th>
            <th>회원탈퇴<br/>신청일자</th>
            <th>활동허용</th>
            <th>아이디</th>
            <th>회원메모</th>
            <th>이름</th>
            <th>성별</th>
            <th>생일</th>
            <th>연락처1</th>
            <th>연락처2</th>
            <th>이메일</th>
            <th>주소</th>
            <th>상세주소</th>
            <th>우편번호</th>
            <th>등록일</th>
            <th>위도</th>
            <th>경도</th>
            <th>은행명</th>
            <th>계좌번호</th>
            
        </tr>
    </thead>
</table>

</div>

</body>
</html>