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
	#reportTable{
		font-size:14px;
	}
	td {
		max-width: 120px;
		white-space: nowrap;
		overflow:hidden;
		text-overflow: ellipsis;
	}
	.clickTr:hover{
		background-color: #efefef;
	}
</style>
<script>
var shingoTable;
	$(document).ready(function() {
	   shingoTable = $('#reportTable').DataTable({
	    	"order"        : [[ 0, "desc" ]],
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
					title: '신고 내역 데이터베이스입니다.',
					//className: 'btn btn-sm btn-primary' 
				},
				{
					extend: 'excel',
					text: '엑셀',
					filename: '신고내역 EXCEL',
					title: '신고 처리 현황 데이터베이스입니다.'
				},
				{
					extend: 'csv',
					text: 'CSV',
					filename: '신고내역 CSV(UTF-8->MS엑셀에서 바로 열면 인코딩문제가 생깁니다. CSV불러오기로 가져오세요.)'
				},
				{
					extend: 'pdf',
					text: 'PDF',
					filename: '신고내역 데이터베이스 PDF입니다.'
				}
			],createdRow: function (row, data, dataIndex) {
			    $(row).addClass('clickTr');
			},
		ajax: {
			"type" : "POST",
			"url" : "reportList",
			"dataType": "JSON"
	         },columns: [
				{"data" : "shingo_no"},
				{"data" : "shingo_reason"},
				{"data" : "userid",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<a href="/dbmon/parentProfile?userid='+ data + '" target="_blank">' + data + '</a>';
		                    }
		                    return data;	
				
				}},
				{"data" : "shingo_id",
					 "render": function(data, type, row){
		                    if(type=='display'){
		                        data ='<a href="/dbmon/parentProfile?userid='+ data + '" target="_blank">' + data + '</a>';
		                    }
		                    return data;	
				
				}},
				{"data" : "shingo_date"},
				{"data" : "shingo_status",
					 "render": function(data, type, row){
		                    if(data=='W'){
		                        data = '대기중';
		                    }else{
		                    	data = '처리완료';
		                    }
		                    return data;	
				
				}},
				{"data" : "shingo_detail",
					"render":  function (data, type, row) {
							if ( data == null ) {
							 return '';
							}
							return data;
				}},
				{"data" : "shingo_response"},
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
				{ targets: 0, width: 50 },
				{ targets: 1, width: 170 },
				{ targets: 2, width: 80 },
				{ targets: 3, width: 80 },
				{ targets: 4, width: 140 },
				{ targets: 5, width: 80 },
				{ targets: 6, searchable:false, width: 130 },
				{ targets: 7, searchable:false, width: 80}
			]
	    });
	   $('.dt-button').addClass('btn btn-outline-info');
	   $('.dt-button').removeClass('dt-button');
	});
	
	$(function(){
		$(document).on('click', '.clickTr',function() {
			$('.delTr').remove();
			var val = $(this).closest('tr').find('td:eq(0)').text(); // amend the index as needed
			var val3 = $(this).closest('tr').find('td:eq(6)').text();
			var val4 = $(this).closest('tr').find('td:eq(7)').text();
			tag="<tr class='delTr'>";
			tag+='<td colspan="1"><a name="3" id="third2"></a>글번호 = '+val+'</a></td>';
			tag+='<td colspan="3"><a name="3" id="third3"><textarea class="form-control" style="white-space:normal; background:#FAFAFA; border:1px solid gray; height:110px; overflow:scroll; width:100%; overflow-x: hidden;">'+val3+'</textarea></td>';
			tag+='<td colspan="3"><a name="4" id="third1"><textarea class="shingo_response form-control" cols="55"; style="height:110px;">'+val4+'</textarea></td>';
			tag+='<td colspan="1"><button class="btn btn-info answerBtn" id='+val+'>답변완료</button></td></tr>';
			
			$(this).closest('tr').after(tag);
		});
		$(document).on('click',".answerBtn",function(){
			//$(this).closest('tr').prev().find('td:eq(5)').html("처리완료");
			var no = $(".answerBtn").attr('id');
			var shingo_response = $(".shingo_response").val();
			$.ajax({
				url:"updateShingoRow",
				async : false,
				type:"POST",
				data : {
					no:no,
					shingo_response:shingo_response,
				},success : function(){
					location.href="/dbmon/management?type=reportManage"
				}
				
			})
			
		});

		
	})
</script>
</head>
<body>
<!-- table-bordered  -->

<div class="container" style="padding-top:50px;">
<table id="reportTable"  class="table hover">
    <thead>
        <tr>
            <th>번호</th>
            <th>사유</th>
            <th>신고회원</th>
            <th>대상회원</th>
            <th>날짜</th>
            <th>처리상태</th>
            <th>내용</th>
            <th>답변</th>
        </tr>
    </thead>
</table>

</div>

</body>
</html>