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
<style>
	.container{
	width:800px;
	text-align:center;
	}
	.badge {

	
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
	input[type=text]{
	border-color: orange;
	display:inline-block;
	width:200px;
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
<script>
	$(function(){
		$(".areaTitle1").click(function(){
			  $("#areaBox1").toggle();
			});
	});
</script>
</head>
<body>
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<hr/><br/>
</div>
<div class="container">
	<div id="title">
	   	<div id="titlefont">활동가능지역</div>
	 </div>
	<form method="post" action="teacherMapOk" name="locationFrm" >
	
	<div class="card">
		<div class="areaTitle1">
			<span class="badge badge-warning mr-1">1순위</span>활동가능지역<br/>
		</div>
		<div class="areaBox1">
			<input type="text" class="form-control align-middle" id="area1" name="area1" value="${vo.area1}" placeholder="주소">
			<input type="button" class="btn btn-warning align-middle" onclick="sample5_execDaumPostcode()" value="주소 검색" ><br>
			
			<!--  <input type="text" id="addrdetail" placeholder="상세주소">
			<input type="text" id="zipcode" placeholder="우편번호" value="${mvo.zipcode}" ><br/>-->
			<input type="hidden" id="lat" name="lat" value="${mvo.lat}" />
			<input type="hidden" id="lng" name="lng" value="${mvo.lng}" />
			<div id="map"></div>
		</div>
	</div>

	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng("${mvo.lat}", "${mvo.lng}"), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
	
    
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    mapContainer.style.display = "block";
    
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png'; // 마커이미지의 주소입니다    
	var imageSize = new kakao.maps.Size(24, 35); // 마커이미지의 크기입니다
		  
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
    markerPosition = new kakao.maps.LatLng(${mvo.lat}, ${mvo.lng}); // 마커가 표시될 위치입니다

    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng("${mvo.lat}", "${mvo.lng}"),
        image: markerImage, // 마커이미지 설정 
        map: map,
    });
    map.relayout();

    
    
    ///////////////주소 검색///////////////////////////////////////////////////////////
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var area1 = data.address; // 최종 주소 변수
				var zipcode = data.zonecode;
                var lat = data.lat;
                
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("area1").value = area1;
                //document.getElementById("zipcode").value = zipcode;
                //document.getElementById("addrdetail").focus();
                
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
    
    /////////////////////////////////////지도 클릭////////////////////////////////
 // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var area1 = ""; // !!result[0].road_address ? result[0].road_address.address_name : '';
                area1 += result[0].address.address_name;
                document.getElementById("area1").value = area1;
                
                
                /* var content = '<div class="bAddr">' +
                                '<span class="title">법정동 주소정보</span>' + 
                                area1 + 
                            '</div>';
                            
                  */          

                // 마커를 클릭한 위치에 표시합니다 
                marker.setPosition(mouseEvent.latLng);
                marker.setMap(map);
                
                document.getElementById("lat").value = mouseEvent.latLng.getLat();
                document.getElementById("lng").value = mouseEvent.latLng.getLng();
                
                
                
                
                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                //infowindow.setContent(content);
                //infowindow.open(map, marker);
            }   
        });
    });

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            //var infoDiv = document.getElementById('centerAddr');

            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
        }    
    }
    
   
</script>



	<div id="bottomBtnBox">
		<input type="button" value="뒤로" onclick="javascript:history.back()" class="btn btn-warning"/>
		<input type="submit" value="저장" class="btn btn-warning"/>
	</div>
	</form>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>