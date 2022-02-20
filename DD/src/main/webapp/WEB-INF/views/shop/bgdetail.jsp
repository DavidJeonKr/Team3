<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css">
    <link rel="stylesheet" href="../resources/css/shop/reset.css">
    <link rel="stylesheet" href="../resources/css/shop/bgdetail.css">
    <link rel="stylesheet" href="../resources/css/shop/footer.css">
    <link rel="stylesheet" href="../resources/css/shop/header.css">
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
    <title>Document</title>
</head>
<body>

    <div id="wrap">
        <%@include file="../include/header.jsp" %>
        <input type="hidden" name="n" value="${product.productId}">
        <div class="content">
            <div class="content_list">
                <img src="${pageContext.request.contextPath}/${product.productThumbImg}" alt="">
              
                <span>${product.productDesc}</span>                
                <div class="bg_select"> 
                <button>장바구니 담기</button>
                </div>
            </div>
        </div>
		<%@include file="../include/footer.jsp" %>
    </div>
    
</body>
</html>