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
<style>
#map{
	width:600px;
	height:600px;
	position:relative;
	display: block;
	left: calc(50% - 300px);
	margin-top:10px;
	}
#bottomBtnBox{
	text-align:center;
	margin:10px;
	}
</style>
</head>
<body>
<div class="container">
<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
 {
     title: '카카오', 
     latlng: new kakao.maps.LatLng(33.450705, 126.570677)
 },
 {
     title: '생태연못', 
     latlng: new kakao.maps.LatLng(33.450936, 126.569477)
 },
 {
     title: '텃밭', 
     latlng: new kakao.maps.LatLng(33.450879, 126.569940)
 },
 {
     title: '근린공원',
     latlng: new kakao.maps.LatLng(33.451393, 126.570738)
 }
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
 
for (var i = 0; i < positions.length; i ++) {
 
 // 마커 이미지의 이미지 크기 입니다
 var imageSize = new kakao.maps.Size(24, 35); 
 
 // 마커 이미지를 생성합니다    
 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
 
 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: positions[i].latlng, // 마커를 표시할 위치
     title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
     image : markerImage // 마커 이미지 
 });
}
</script>

	<div id="bottomBtnBox">
		<input type="button" value="뒤로" onclick="javascript:history.back()" class="btn btn-warning"/>
	</div>
			 
</div>
</body>
</html>