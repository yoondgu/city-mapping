<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seoul map</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
   <h1>서울의 입체시설물 정보</h1>
   <div>
   <ul>
   		<li>
	   		<a href="overpass/table.jsp">보행육교 리스트</a>
   		</li>
   </ul>
   </div>
   <div id="map" style="width:1500px; height:1200px;">
   </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d6022b2beb61e1212f718707de6c0f3"></script>
<script type="text/javascript" src="main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>