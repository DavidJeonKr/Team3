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
    <link rel="stylesheet" href="../resources/css/shop/musicdetail.css">
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
            <div class="main_img">
                <img src="${pageContext.request.contextPath}/${product.productImg}" alt="">
            </div>
            <div>
				${product.productDesc}
            </div>
        </div>
        <div class="list">
            <h3>수록곡</h3>
           <table>
               <thead>
                   <tr>
                       <th>곡정보</th>
                       <th>다운</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
	                   <td><span class="song_title">TITLE</span>${product.productSong}</td>
	                   <td><a href="">+</a></td>
               	   </tr>
               </tbody>
           </table>
        </div>
       	<%@include file="../include/footer.jsp" %>
    </div>
    
    <script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
	
	</script>
</body>
</html>