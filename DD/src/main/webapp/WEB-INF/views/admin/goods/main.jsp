<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DD</title>


<link rel="stylesheet" href="../../resources/css/shop/reset.css">
<link rel="stylesheet" href="../../resources/css/admin/main.css">
<link rel="shortcut icon" type="imge/x-icon" href="../../resources/imgs/favicon.ico">
<script src="../../resources/js/shop/jquery.min.js"></script>
<script src="../../resources/js/shop/shop.js" defer></script>

</head>
<body>

	<div id="wrap">
		
				<%@ include file="../include/header.jsp" %>
		
	
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div>
		</nav>
		
		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
			<div id="container_box">
				
			</div>
		</section>
	
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>		
		</footer>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>