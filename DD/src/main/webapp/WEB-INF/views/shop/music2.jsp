<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css">
    <link rel="shortcut icon" type="imge/x-icon" href="../resources/imgs/favicon.ico">
    <link rel="stylesheet" href="../resources/css/shop/reset.css">
    <link rel="stylesheet" href="../resources/css/shop/music.css">
    <link rel="stylesheet" href="../resources/css/shop/footer.css">
    <link rel="stylesheet" href="../resources/css/shop/header.css">
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
    <title>DD</title>
    
</head>
<body>
    

    <div id="wrap">
        <%@include file="../include/header.jsp" %>
        <div class="content">
            <h2 class="title">최신 앨범</h2>           
            <c:forEach items="${musicList}" var="musicList" begin="1" end="8">
            <div class="content_list">
                <a href="./musicdetail?n=${musicList.productId}"><img src= "${pageContext.request.contextPath}/${musicList.productThumbImg}" alt=""></a>
                <div>
                   ${musicList.productDesc}
                </div>
            </div>
            </c:forEach>
        </div>
		<%@include file="../include/footer.jsp" %>
    </div>
</body>
</html>