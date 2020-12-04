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

</style>
<script>
	$(document).ready(function() {
	    $('#reportTable').DataTable({
	    	"order"        : [[ 0, "desc" ]],
	    	"lengthMenu": [10, 25, 50],
		    "autoWidth" : "false",
		    dom: 'Bfrtip',
			buttons: [
				/*'copy', 'csv', 'excel', 'pdf'*/
				
				{
					extend: 'pageLength',
					text: '표시할 레코드수',
					//className: 'btn btn-sm btn-primary' 
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
			],
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
		                        data = '<a href="'+ data + '">' + data + '</a>';
		                    }
		                    return data;	
				
				}},
				{"data" : "shingo_id"},
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
				{"data" : "shingo_response"},
				{"data" : "shingo_detail",
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
				{ targets: 1, width: 200 },
				{ targets: 4, width: 130 },
				{ targets: 7, searchable:false, visible:false }
			]
	    });
	   $('.dt-button').addClass('btn btn-outline-info');
	   $('.dt-button').removeClass('dt-button')
	});
	
	$(function(){
	
		$(document).on('click', '#reportTable td',function() {
			  var val = $(this).closest('tr').find('td:eq(0)').text(); // amend the index as needed
			  console.log(val);
			  tag="";
			  tag+='<td colspan="3" style=><a name="3" id="third"><textarea cols:50; rows:50;></textarea></td>';
			  tag+='<td colspan="3" style=><a name="3" id="third"></a>글 내용3</a></td>';
			  $(this).closest('tr').after(tag);
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
            <th>답변</th>
            <th>내용</th>
        </tr>
    </thead>
</table>
</div>

</body>
</html>