<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menu = request.getParameter("menu");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
   	<div class="row p-3 text-center bg-light" id="title">
	   <h5><a class="link-dark text-decoration-none" href="home.jsp">seoul maps</a></h5>
	</div>

	<ul class="nav justify-content-center">
		<li class="nav-item">
	   		<a class="nav-link link-dark <%="overpass".equals(menu) ? "fw-bold" : "" %>" href="overpass/table.jsp">보행육교 리스트</a>
		</li>
		<li class="nav-item">
	   		<a class="nav-link link-dark" href="">메뉴2</a>
		</li>
		<li class="nav-item">
	   		<a class="nav-link link-dark" href="">메뉴3</a>
		</li>
	</ul>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>