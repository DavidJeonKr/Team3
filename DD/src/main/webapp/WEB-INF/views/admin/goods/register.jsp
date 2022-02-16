<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../resources/css/shop/reset.css">
<link rel="stylesheet" href="../../resources/css/admin/main.css">
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
				<h2>상품 등록</h2>
				<form role="form" method="post" autocomplete="off">
				
					<div class="inputArea">
						<label for="productName">상품명</label>
						<input type="text" id="productName" name="productName" />
					</div>
					
					<div class="inputArea">
						<label for="productPrice">상품가격</label>
						<input type="text" id="productPrice" name="productPrice" />
					</div>
				
					<div class="inputArea">
						<label for="productDesc">상품소개</label>
						<textarea rows="5" cols="50" id="productDesc" name="productDesc"></textarea>
					</div>
					
					<div class="inputArea">
						<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
					</div>
					
					</form>
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