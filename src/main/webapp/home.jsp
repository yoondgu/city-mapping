<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seoul maps</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="common/nav.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container">
	<div id="mapwrap">
	   <div id="map" style="width:1000px; height:1000px; margin:0 auto!important;"></div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d6022b2beb61e1212f718707de6c0f3"></script>
<script type="text/javascript">
	let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	let options = { //지도를 생성할 때 필요한 기본 옵션
	    center: new kakao.maps.LatLng(37.5642135, 127.0016985), //지도의 중심좌표.
	    level: 8 //지도의 레벨(확대, 축소 정도)
	};
	
	let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "https://www.data.go.kr/download/15025444/standard.do?dataType=json", true);
	xhr.send();
	
	xhr.onload = function() {
		
		//// 육교데이터 가져와서 마커 표시하기
		// 마커 객체를 담을 배열	
		let positions = [];
		if (this.status === 200) {
			let data = JSON.parse(this.responseText);
			
			let records = data.records;
			for (let i = 0; i < records.length; i++) { 
				// 육교정보 object를 불러온다.
				let item = records[i];
				if (!item.소재지도로명주소.startsWith("서울")) {
					continue;
				}
				
				// title, latlng으로 이루어진 객체를 마커 배열에 담는다.
				positions.push({title: item["육교명"], latlng: new kakao.maps.LatLng(item["위도"], item["경도"])})
			}
	   
			for (let i = 0; i < positions.length; i ++) {
			    
				//// 마커 생성하기
				let marker = createMarker(positions[i]);
			    
			    //// 인포윈도우 생성하기
			    let infowindow = createInfowindow(positions[i]);
			    
			    ////마커에 등록하기
				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    // 마커 위에 인포윈도우를 표시합니다
			      	infowindow.open(map, marker);  
				});
			}
		}	
	}
	
	function createMarker(position) {
		let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    // 마커 이미지의 이미지 크기 입니다
	    let imageSize = new kakao.maps.Size(24, 35); 
	    // 마커 이미지를 생성합니다    
	    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    let marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: position.latlng, // 마커를 표시할 위치
	        title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });

	    // 마커가 지도 위에 표시되도록 설정
	    marker.setMap(map);
	    
	    return marker;
	}
	
	function createInfowindow(position) {
	    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	    console.log(position.title);
		let iwContent = '<div class="badge text-dark text-wrap">' + position.title + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
		// 인포윈도우를 생성합니다
		let infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		
		return infowindow;
	}
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>