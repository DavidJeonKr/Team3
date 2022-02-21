<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>shop page</title>
    <link rel="stylesheet" href="../resources/css/shop/reset.css">
    <link rel="stylesheet" href="../resources/css/shop/shop.css">
    <link rel="stylesheet" href="../resources/css/shop/footer.css">
    <link rel="stylesheet" href="../resources/css/shop/header.css">
    
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
    
    <style>
    #wrap footer {
    	margin-top: 200px;
    }
    </style>

</head>
<body>

    <div id="wrap">
		<%@include file="../include/header.jsp" %>
		<div class="main_content">
			<div class="left_img">
			<ul>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[2].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[2].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[2].productName}</span>
				</div>
					
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[3].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[3].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[3].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[4].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[4].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[4].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[5].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[5].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[5].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[6].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[6].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[6].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[8].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[8].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[8].productName}</span>
				</div>
				</li>
			</ul>
			</div>
	        <div id="slider">
	            <ul class="slide">
	                <li><img src="../resources/imgs/shop/slide1.png" alt=""></li>
	                <li><img src="../resources/imgs/shop/slide2.png" alt=""></li>
	                <li><img src="../resources/imgs/shop/slide3.png" alt=""></li>
	            </ul>
	        </div>
        </div>
        <div id="line"></div>
        <div id="main">
            <div class="inner">
                <section class="con1 clear">
                    <div class="content_menu">
                        <h2 class="con1_title">Music</h2>
                        <p class="more"><a href="./music">more</a></p>
                    </div>
                    <ul class="hotList clear">      
                        <li>
                            <div class="imgbox">
                               <a href="./musicdetail?n=${list[7].productId}"><img src="${pageContext.request.contextPath}/${list[7].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[7].productId}"><h4>${list[7].productName}</h4>
                            								   장르: JPOP <br>
                            								  <p class="songtitle">title<p><p>Clock Strikes</p><br>
                            								  2022. 1. 5.</a></span></li>
                        <li>
                            <div class="imgbox">
                              <a href="./musicdetail?n=${list[1].productId}"><img src="${pageContext.request.contextPath}/${list[1].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[1].productId}"><h4>${list[1].productName}</h4>
                            								   장르: JPOP <br>
                            								  <p class="songtitle">title<p><p>Lemon</p><br>
                            								  2022. 1. 10.</a></span></li>
                        <li>
                            <div class="imgbox">
                               <a href="./musicdetail?n=${list[0].productId}""><img src="${pageContext.request.contextPath}/${list[0].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[0].productId}"><h4>${list[0].productName}</h4>
                            								   장르: 록/메탈, 일렉트로니카, POP <br>
                            								  <p class="songtitle">title<p><p>Let It Be</p><br>
                            								  2022. 1. 4.</a></span></li>
        
                    </ul>                    
					
						
					
                </section>
                <section class="con2 clear">
                    <div class="content_menu">
                        <h2 class="con2_title">Background</h2>
                        <p class="more"><a href="./background">more</a></p>
                    </div>    
                    <ul class="originalList clear">                        
                    
                        <li>
                            <div class="imgbox">
                               <a href="./bgdetail?n=${list[9].productId}"><img src="${pageContext.request.contextPath}/${list[9].productThumbImg}" alt="originalImg1"></a>
                            </div>
                            <span class="minititle">Blue</span></li>
                        <li>
                            <div class="imgbox">
                               <a href="bgdetail?n=${list[10].productId}"><img src="${pageContext.request.contextPath}/${list[10].productThumbImg}" alt="originalImg2"></a>
                            </div>
                            <span class="minititle">Red</span></li>
                        <li>
                            <div class="imgbox">
                               <a href="bgdetail?n=${list[11].productId}"><img src="${pageContext.request.contextPath}/${list[11].productThumbImg}" alt="originalImg3"></a>
                            </div>
                            <span class="minititle">Green</span></li>
                    </ul>                    
                </section>
            </div>
        </div>
		<%@include file="../include/footer.jsp" %>
		 <div class="userId">
	    사용자 아이디
	    <a href="./cartList">장바구니</a>
	     </div>
	     
    </div>
   
</body>

</html>