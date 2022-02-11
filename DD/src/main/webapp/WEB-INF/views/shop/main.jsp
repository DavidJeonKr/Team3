<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>shop page</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css">
    <link rel="stylesheet" href="../resources/css/shop/reset.css">
    <link rel="stylesheet" href="../resources/css/shop/shop.css">
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>

</head>
<body>

    <div id="wrap">
		<%@include file="header.jsp" %>
        <div id="slider">
            <ul class="slide">
                <li><img src="../resources/imgs/shop/slider1.jpg" alt=""></li>
                <li><img src="../resources/imgs/shop/background2.jpg" alt=""></li>
                <li><img src="../resources/imgs/shop/background3.jpg" alt=""></li>
            </ul>
        </div>
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
                               <a href="./musicdetail"><img src="../resources/imgs/shop/cover1.jpg" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle">One Ok Rock</span></li>
                        <li>
                            <div class="imgbox">
                              <a href=""><img src="../resources/imgs/shop/cover2.jpg" alt="hotProgramImg2"></a>
                            </div>
                            <span class="minititle">Kenshi Yonezu</span></li>
                        <li>
                            <div class="imgbox">
                               <a href=""><img src="../resources/imgs/shop/cover3.jpg" alt="hotProgramImg3"></a>
                            </div>
                            <span class="minititle">The Beatles</span></li>
                        <li>
                            <div class="imgbox">
                               <a href=""><img src="../resources/imgs/shop/cover4.jpg" alt="hotProgramImg4"></a>
                            </div>
                            <span class="minititle">GreenDay</span></li>
                        <li>
                            <div class="imgbox">
                               <a href=""><img src="../resources/imgs/shop/cover5.jpg" alt="hotProgramImg5"></a>
                            </div>
                            <span class="minititle">SUM41</span></li>
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
                               <a href="./bgdetail"><img src="../resources/imgs/shop/background1.jpeg" alt="originalImg1"></a>
                            </div>
                            <span class="minititle">Blue</span></li>
                        <li>
                            <div class="imgbox">
                               <a href=""><img src="../resources/imgs/shop/background2.jpg" alt="originalImg2"></a>
                            </div>
                            <span class="minititle">Red</span></li>
                        <li>
                            <div class="imgbox">
                               <a href=""><img src="../resources/imgs/shop/background3.jpg" alt="originalImg3"></a>
                            </div>
                            <span class="minititle">Green</span></li>
                        <li>
                            <div class="imgbox">
                               <a href=""><img src="../resources/imgs/shop/background4.png" alt="originalImg4"></a>
                            </div>
                            <span class="minititle">Yellow</span></li>
                        <li>
                            <div class="imgbox">
                              <a href=""><img src="../resources/imgs/shop/background5.png" alt="originalImg5"></a>
                            </div>
                            <span class="minititle">Purple</span></li>
                    </ul>                    
                </section>
            </div>
        </div>
		<%@include file="footer.jsp" %>
    </div>

</body>

</html>