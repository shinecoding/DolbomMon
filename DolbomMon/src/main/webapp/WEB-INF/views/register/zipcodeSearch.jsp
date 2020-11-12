<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		//서버에서 비동기식으로 주소목록 가져오기
		$("#zipFrm").submit(function(){
			if($("#doro").val==""){	//도로명을 입력하지 않은 경우
				alert("도로명 입력 후 다시 검색하세요.");
			}else{ // 도로명이 있을 때
				var url = "";
				// form의 필드 name과 값을 직렬화시키기
				//var params = "doro="+$("#doro").val(); // doro=백범로22길
				var params = $("#zipFrm").serialize(); // doro=백범로22길
				$.ajax({
					url : url,
					data : params,
					success : function(result){
						$("#zipList").html(result);
						console.log(result);
					},
					error : function(){
						console.log("검색 실패..");
					}
				});		
			}
			return false;
		});
		
		// 우편번호와 주소를 회원등록 폼으로 셋팅
		$(document).on('click','#zipList>li',function(){	//document를 선택할 시 페이지 전체를 선택함
			var zipcode = $(this).children(".zip").text();
			var address = $(this).children(".addr").text();
			
			opener.document.getElementById("zipcode").value = zipcode; //열어준 창에 텍스트 설정
			opener.document.getElementById("addr").value = address;
			
			window.close();//팝업창닫기 self.close();
		});
	});
</script>
</head>
<body>
<form method="post" id="zipFrm" >
	도로명을 입력 후 주소를 검색하세요...<br/>
	(예:백범로22길)<br/>
	<input type="text" name="doro" placeholder="백범로22길"/>
	<input type="submit" value="주소검색하기"/>
</form>
<hr/>
<ul id="zipList">
</ul>
</body>
</html>