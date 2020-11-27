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
	
	<input type="text" id="addr" placeholder="주소">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	<input type="text" id="addrdetail" placeholder="상세주소">
	<input type="text" id="zipcode" placeholder="우편번호"><br/>
	<input type="text" id="lat" name="lat" value=${mvo.lat}/>
	<input type="text" id="lng" name="lng" value=${mvo.lng}/><br/>
<div id="map" style="width:600px;height:600px;margin-top:10px;display:none"></div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(${mvo.lat}, ${mvo.lng}), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
	
    
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    mapContainer.style.display = "block";
    
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${mvo.lat}, ${mvo.lng}),
        map: map,
        draggable:true// 마커가 드래그 가능하도록 설정합니다 
    });
    map.relayout();
  //드래그 후 위도,경도 위치
	kakao.maps.event.addListener(marker, 'dragend', function() {
		latlng = marker.getPosition();
		$("#lat").val(latlng.getLat());
		$("#lng").val(latlng.getLng());
		 map.relayout();
	});

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
				var zipcode = data.zonecode;
                var lat = data.lat;
                
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr").value = addr;
                document.getElementById("zipcode").value = zipcode;
                document.getElementById("addrdetail").focus();
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        document.getElementById("lat").value = result.y;
                        document.getElementById("lng").value = result.x;
                        
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
	
	<input type="submit" value="저장" />
	
	</form>
</div>
</body>
</html>