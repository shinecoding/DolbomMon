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
.container{width:518px; padding:0;
	}
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
	#title{
		margin:20px 5px;
		display:block;
	width:100%;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
</style>
</head>
<body>
<div class="container">
	<div id="title">
	   	<div id="titlefont">내 근처 선생님/학부모 찾기</div>
	 </div>
<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng("${mvo.lat}", "${mvo.lng}"), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
	<c:forEach var="vo" items="${hash}">
    {
        content: '<div style="padding:5px;">${vo.username}<br/><a href="teacherView">프로필보기</a></div>', 
        latlng: new kakao.maps.LatLng("${vo.lat}", "${vo.lng}")
    },
    </c:forEach>
];

// 마커 이미지의 이미지 주소입니다
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
        //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });

  //  var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : positions[i].content 
	});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
//infowindow.open(map, marker); 



// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(map, 'click', makeOutListener(infowindow));
}//for문

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}

</script>

	<div id="bottomBtnBox">
		<input type="button" value="뒤로" onclick="javascript:history.back()" class="btn btn-warning"/>
	</div>
			 
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>