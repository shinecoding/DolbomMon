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
	#certiTable{
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
		width:25px;
		height:25px;
	}
</style>
<script>
var certiTable;
	$(document).ready(function() {
	   certiTable = $('#certiTable').DataTable({
	    	"order"        : [[ 2, "desc" ]], //정렬을 indate로 바꿔야한다. 업데이트 할때마다 indate sysdate 등록하게 해야함.
	    	"destroy" : true,
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
					title: '인증 내역 데이터베이스입니다.',
					//className: 'btn btn-sm btn-primary' 
				},
				{
					extend: 'excel',
					text: '엑셀',
					filename: '인증내역 EXCEL',
					title: '인증 처리 현황 데이터베이스입니다.'
				},
				{
					extend: 'csv',
					text: 'CSV',
					filename: '인증내역 CSV(UTF-8->MS엑셀에서 바로 열면 인코딩문제가 생깁니다. CSV불러오기로 가져오세요.)'
				},
				{
					extend: 'pdf',
					text: 'PDF',
					filename: '인증내역 데이터베이스 PDF입니다.'
				}
			],createdRow: function (row, data, dataIndex) {
			    $(row).addClass('clickTr');
			},
		ajax: {
			"type" : "POST",
			"url" : "certificationList",
			"dataType": "JSON"
	         },columns: [
	        	{"data" : "userid",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<a class="selectId" href="/dbmon/teacherView?userid='+ data + '" target="_blank">' + data + '</a>';
		                    }
		                    return data;	
				
				}},
				{"data" : "no",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<span id="'+data+'">' + data + '</span>';
		                    }
		                    return data;	
				
				}},
	        	{"data" : "indate"},
	        	{"data" : "school",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "department",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "degree",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "status",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "grade",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "school_date",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "school_proof",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a href="/dbmon/upload/'+data+'" download=""><img src="/dbmon/icon/document4.png" title="'+data+'"></a>'
						}
						return data;
			}},
        	{"data" : "identi_status",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}else if( data=="N"){
						data = "";
					}else if( data=="S"){
						data = '<a class="xBtn" href="#" id="identi_status"><img src="/dbmon/icon/xbutton.png" title="보충"></a>'+"&nbsp &nbsp"+'<a class="yBtn" href="#" id="identi_status"><img src="/dbmon/icon/ybutton.png" title="통과"></a>'
					}else if( data=="Y"){
						data = '<img src="/dbmon/icon/certibutton.png" title="통과"><span style="color:orange"> 패스</span>'
					}else if( data=="X"){
						data = "<span style='color:red'>보충필요</span>";
					}
					return data;
		}},
	        	{"data" : "license",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "license_date",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "license_proof",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a href="/dbmon/upload/'+data+'" download=""><img src="/dbmon/icon/document4.png" title="'+data+'"></a>'
						}
						return data;
			}},
			{"data" : "school_status",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}else if( data=="N"){
						data = "";
					}else if( data=="S"){
						data = '<a class="xBtn" href="#" id="school_status"><img src="/dbmon/icon/xbutton.png" title="보충"></a>'+"&nbsp &nbsp"+'<a class="yBtn" href="#" id="school_status"><img src="/dbmon/icon/ybutton.png" title="통과"></a>'
					}else if( data=="Y"){
						data = '<img src="/dbmon/icon/certibutton.png" title="통과"><span style="color:orange"> 패스</span>'
					}else if( data=="X"){
						data = "<span style='color:red'>보충필요</span>";
					}
					return data;
		}},
	        	{"data" : "identi",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a href="/dbmon/upload/'+data+'" download=""><img src="/dbmon/icon/document4.png" title="'+data+'"></a>'
						}
						return data;
			}},
	        	{"data" : "identi_date",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "identi_addr",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
			{"data" : "license_status",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}else if( data=="N"){
						data = "";
					}else if( data=="S"){
						data = '<a class="xBtn" href="#" id="license_status"><img src="/dbmon/icon/xbutton.png" title="보충"></a>'+"&nbsp &nbsp"+'<a class="yBtn" href="#" id="license_status"><img src="/dbmon/icon/ybutton.png" title="통과"></a>'
					}else if( data=="Y"){
						data = '<img src="/dbmon/icon/certibutton.png" title="통과"><span style="color:orange"> 패스</span>'
					}else if( data=="X"){
						data = "<span style='color:red'>보충필요</span>";
					}
					return data;
		}},
	        	{"data" : "crime",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a href="/dbmon/upload/'+data+'" download=""><img src="/dbmon/icon/document4.png" title="'+data+'"></a>'
						}
						return data;
			}},
	        	{"data" : "crime_date",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
			{"data" : "crime_status",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}else if( data=="N"){
						data = "";
					}else if( data=="S"){
						data = '<a class="xBtn" href="#" id="crime_status"><img src="/dbmon/icon/xbutton.png" title="보충"></a>'+"&nbsp &nbsp"+'<a class="yBtn" href="#" id="crime_status"><img src="/dbmon/icon/ybutton.png" title="통과"></a>'
					}else if( data=="Y"){
						data = '<img src="/dbmon/icon/certibutton.png" title="통과"><span style="color:orange"> 패스</span>'
					}else if( data=="X"){
						data = "<span style='color:red'>보충필요</span>";
					}
					return data;
		}},
	        	{"data" : "privacy",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}else{
							data = '<a href="/dbmon/upload/'+data+'" download=""><img src="/dbmon/icon/document4.png" title="'+data+'"></a>'
						}
						return data;
			}},
	        	{"data" : "privacy_date",
					"render":  function (data, type, row) {
						if ( data == null ) {
						 return '';
						}
						return data;
			}},
	        	{"data" : "privacy_status",
				"render":  function (data, type, row) {
					if ( data == null ) {
					 return '';
					}else if( data=="N"){
						data = "";
					}else if( data=="S"){
						data = '<a class="xBtn" href="#" id="privacy_status"><img src="/dbmon/icon/xbutton.png" title="보충"></a>'+"&nbsp &nbsp"+'<a class="yBtn" href="#" id="privacy_status"><img src="/dbmon/icon/ybutton.png" title="통과"></a>'
					}else if( data=="Y"){
						data = '<img src="/dbmon/icon/certibutton.png" title="통과">'
					}else if( data=="X"){
						data = "<span style='color:red'>보충필요</span>";
					}
					return data;
			}},
	        	{"data" : "certi_cnt"}
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
				{ targets: 0, width: 60 },
				{ targets: 1, width: 70 },
				{ targets: 2, width: 80 },
				{ targets: 3, width: 60 },
				{ targets: 4, width: 60 },
				{ targets: 5, width: 50 },
				{ targets: 6, width: 70 },
				{ targets: 7, width: 50 },
				{ targets: 8, width: 70 },
				{ targets: 9, width: 70 },
				{ targets: 10, width: 70 },
				{ targets: 11, width: 80 },
				{ targets: 12, width: 150 },
				{ targets: 13, width: 70 },
				{ targets: 14, width: 70 },
				{ targets: 15, width: 70 },
				{ targets: 16, width: 70 },
				{ targets: 17, width: 100 },
				{ targets: 18, width: 70 },
				{ targets: 19, width: 70 },
				{ targets: 20, width: 120 },
				{ targets: 21, width: 70 },
				{ targets: 22, width: 80 },
				{ targets: 23, width: 110 },
				{ targets: 24, width: 70 },
				{ targets: 25, width: 80 },
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
		if(confirm("서류에 보충이 필요합니까?")){
		alert("사유를 입력하세요.");
		var userid = $(this).closest('tr').find('td:eq(0)').text();
		openMessage(userid);
		var no = $(this).closest('tr').find('td:eq(1)').text();
		var type= $(this).attr('id');
		
		$.ajax({
				url:"updateCerti",
				async : false,
				type:"POST",
				data : {
					no:no,
					certi:"X",
					type:type,
				},success : function(){
					location.href="/dbmon/management?type=certiManage?no="+no;
				}
			})
		}
	});
	$(document).on("click",".selectId",function(){
		$('tr').css("background-color","#fff");
		$(this).closest('tr').css("background-color","antiquewhite");
	});
	
	$(document).on("click",".yBtn",function(){
		if(confirm("서류를 통과시키겠습니까?")){
		var no = $(this).closest('tr').find('td:eq(1)').text();
		var type= $(this).attr('id');
		$.ajax({
				url:"updateCerti",
				async : false,
				type:"POST",
				data : {
					no:no,
					certi:"Y",
					type:type,
				},success : function(){
					location.href="/dbmon/management?type=certiManage?no="+no;
				}
			})
		}
	});
	
	//마우스 휠 방향전환
	$("#certiTable").on('mousewheel',function(e){
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
<table id="certiTable"  class="table hover">
    <thead>
        <tr>
            <th>아이디</th>
            <th>관리번호</th>
            <th>마지막 갱신일</th>
            <th>학교명</th>
            <th>학과명</th>
            <th>학위</th>
            <th>학적상태</th>
            <th>학년</th>
            <th>학적서류<br/>발급일자</th>
            <th>학교<br/>인증서류</th>
            <th>학교<br/>인증상태</th>
            <th>자격증명</th>
            <th>자격증<br/>발급일자</th>
            <th>자격증<br/>인증서류</th>
            <th>자격증<br/>인증상태</th>
            <th>등초본</th>
            <th>발급일자</th>
            <th>등초본상주소</th>
            <th>등초본<br/>인증상태</th>
            <th>성범죄<br/>조회서류</th>
            <th>성범죄<br/>조회신청일자</th>
            <th>성범죄<br/>인증상태</th>
            <th>개인정보<br/>제공동의서</th>
            <th>개인정보제공<br/>동의서신청일자</th>
            <th>개인정보<br/>	동의상태</th>
            <th>인증 갯수</th>
        </tr>
    </thead>
</table>

</div>

</body>
</html>