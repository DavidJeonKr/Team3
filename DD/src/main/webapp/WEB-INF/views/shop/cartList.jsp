<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		
		<section id="container">

			<div id="container_box">
				<h2>상품 목록</h2>
				
				<table>
					<thead>
						<tr>	
							<th>상품</th>		
							<th>이름</th>
							<th>가격</th>							
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${cartList}" var="cartList">
						<tr>
							<td><a href=""><img src="${pageContext.request.contextPath}/${cartList.productThumbImg}"></a></td>

							<td><a href="">${cartList.productName}</a></td>
							<td>${list.productPrice}</td>
							
						</tr>
					</c:forEach>
					</tbody>
				
				</table>
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