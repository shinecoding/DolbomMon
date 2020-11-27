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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<div class="container">
	<form method="post" action="teacherMapOk" name="locationFrm" >
	<div id="map" style="width:500px;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f&libraries=services"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

		<script>
		$(function(){
			
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(${mvo.lat}, ${mvo.lng}),
				level: 3
			};
			//지도 생성
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${mvo.lat}, ${mvo.lng}); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition,
			    map:map, // 마커가 지도 위에 표시되도록 설정합니다
			    draggable:true// 마커가 드래그 가능하도록 설정합니다 
			});
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			

			var latlng;
			
			//드래그 후 위도,경도 위치
			kakao.maps.event.addListener(marker, 'dragend', function() {
				latlng = marker.getPosition();
				$("#lat").val(latlng.getLat());
				$("#lng").val(latlng.getLng());
				
			});
			
			//주소 클릭 후 
			$("#locBtn").click(function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			            $("#zipcode").val(data.zonecode);
			            $("#addr").val(data.address);
			              
			            geocoder.addressSearch(data.address, function(result, status) {

			                // 정상적으로 검색이 완료됐으면 
			                 if (status === kakao.maps.services.Status.OK) {
								
			                	 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			                     // 결과값으로 받은 위치를 마커로 표시합니다
			                     marker = new kakao.maps.Marker({
			                         map: map,
			                         position: coords
			                     });

			                	 
								console.log("경도=> " + result[0].x);
								console.log("위도=> " + result[0].y);
			                	 $("#lng").val(result[0].x);
			                	 $("#lat").val(result[0].y);
			                	 
			                	 map.setCenter(coords);
			                } 
			            });
			           	window.close();
			        }
			    }).open();
				
				
				
			});
			
			
			
			
		});
			
			 
		</script>
			
		
		<input type="text" id="zipcode" placeholder="우편번호">
		<input type="button" id="locBtn" value="검색"><br/>
		<input type="text" id="addr" placeholder="도로명 주소">
		<input type="text" id="addrdetail" placeholder="상세 주소"><br/><br/>
		<input type="text" id="lat" name="lat" value=${mvo.lat}/>
		<input type="text" id="lng" name="lng" value=${mvo.lng}/><br/>
		
		<input type="submit" value="저장" />
		
	</form>
</div>
</body>
</html>