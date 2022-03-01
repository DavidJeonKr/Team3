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
    <link rel="shortcut icon" type="imge/x-icon" href="../resources/imgs/favicon.ico">
    <link rel="stylesheet" href="../resources/css/shop/footer.css">
    <link rel="stylesheet" href="../resources/css/shop/header.css">
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>

    <title>DD</title>
</head>
<body>
      
    <div id="wrap">
        <%@include file="../include/header.jsp" %>
        <form role="form" method="post">
        	<input type="hidden" name="productId" value="${product.productId}" id="productId">
        </form>
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
                       <th>담기</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
	                   <td><span class="song_title">TITLE</span>${product.productSong}</td>
	                   <td><input type="button" class="addCart_btn" value="+"></td>
               	   </tr>
               </tbody>
           </table>
        </div>
       	<%@include file="../include/footer.jsp" %>
		<%@include file="../include/aside.jsp" %>
       	
    </div>
    
    <script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
	  $(".addCart_btn").click(function(){
		   var productId = $("#productId").val();
			      
		   var data = {
		     productId : productId
		     };
		   
		   $.ajax({
		    url : "./addCart",
		    type : "post",
		    data : data,
		    success : function(result){
		     alert("카트 담기 성공");
		    },
		    error : function(){
		     alert("카트 담기 실패");
		    }
		   });
		  });
	
	</script>
</body>
</html>