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
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="overpass"/>
</jsp:include>
<div class="container">
	<h5>서울 보행육교 정보 리스트</h5>
   <table>
	   <thead id="th">
	   		<tr class="th-row">
	   		</tr>
	   </thead>
	   <tbody id="tb">
	   </tbody>
   </table>
</div>
<script type="text/javascript" src="main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>