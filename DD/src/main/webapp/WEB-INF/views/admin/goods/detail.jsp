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
				<h2>상품 등록</h2>
				<form role="form" method="post" autocomplete="off">
				<input type="hidden" name="n" value=" ${product.productId}">
				
				<div class="inputArea"> 
				 <label>1차 분류</label>
				 <span class="category1"></span>        
				 <label>2차 분류</label>
				 <span class="category2">${product.cateCode}</span>
				</div>			
				
					<div class="inputArea">
						<label for="productName">상품번호</label>
						<span>${product.productId}</span>
					</div>
					
					<div class="inputArea">
						<label for="productName">상품명</label>
						<span>${product.productName}</span>
					</div>
					
					<div class="inputArea">
						<label for="productPrice">상품가격</label>
						<span>${product.productPrice}</span>
					</div>
					
					<div class="inputArea">
						<label for="productSong">노래제목</label>
						<span>${product.productSong}</span>
					</div>
				
					<div class="inputArea">
						<label for="productDesc">상품소개</label>
						<div class="productDesc">${product.productDesc}</div>
					</div>
					
					<div class="inputArea">
						 <label for="productImg">이미지</label>
						 <p>원본 이미지</p>
						 <img src="${pageContext.request.contextPath}/${product.productImg}" class="oriImg"/>
						 
						 <p>썸네일</p>
						 <img src="${pageContext.request.contextPath}/${product.productThumbImg}" class="thumbImg"/>
					</div>
					
					<div class="inputArea">
						<button type="button" id="update_Btn" >수정</button>
						<button type="button" id="delete_Btn" >삭제</button>
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
		
	<script>
	$(document).ready(function () {
		var formObj = $("form[role='form']");
		
		$("#update_Btn").click(function () {
			formObj.attr("action", "./update");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#delete_Btn").click(function () {
			var result = confirm("정말 삭제하시겠습니까?");
			
			if (result) {
				formObj.attr("action", "./delete");
				formObj.submit();
			}
		});
	});
	
	</script>

</body>
</html>