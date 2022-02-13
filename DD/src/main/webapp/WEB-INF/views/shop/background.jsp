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
    <link rel="stylesheet" href="../resources/css/shop/background.css">
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
    <title>Document</title>
</head>
<body>
    <div id="wrap">
        <%@include file="header.jsp" %>
        <div class="content">
            <div class="content_list">
                <a href="./bgdetail"><img src="../resources/imgs/shop/background1.jpeg" alt=""></a>
                <span>
                    <h4>blue</h4>
                    안전, 신뢰의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background2.jpg" alt=""></a>
                <span>
                    <h4>red</h4>
                    열정, 강렬한 느낌의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background3.jpg" alt=""></a>
                <span>
                    <h4>green</h4>
                    자연, 평화로운 느낌의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background4.png" alt=""></a>
                <span>
                    <h4>yellow</h4>
                    낙천적, 긍정적인 느낌의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background5.png" alt=""></a>
                <span>
                    <h4>purple</h4>
                    상상력, 창의적인 느낌의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background6.jpg" alt=""></a>
                <span>
                    <h4>orange</h4>
                    행복, 친근함의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background7.jpg" alt=""></a>
                <span>
                    <h4>pink</h4>
                    평온한 느낌의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background8.jpg" alt=""></a>
                <span>
                    <h4>brown</h4>
                    정직, 성실한 느낌의 색
                </span>
            </div>
            <div class="content_list">
                <a href=""><img src="../resources/imgs/shop/background9.png" alt=""></a>
                <span>
                    <h4>gray</h4>
                    절충의 색
                </span>
            </div>
        </div>
		<%@include file="footer.jsp" %>
    </div>


</body>
</html>