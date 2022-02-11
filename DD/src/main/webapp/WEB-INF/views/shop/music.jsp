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
    <link rel="stylesheet" href="../resources/css/shop/music.css">
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
    <title>Document</title>
</head>
<body>
    

    <div id="wrap">
        <%@include file="header.jsp" %>
        <div class="content">
            <h2 class="title">최신 앨범</h2>
            <div class="content_list">
                <a href="./musicdetail"><img src="../resources/imgs/shop/cover1.jpg" alt=""></a>
                <span>
                    <h4>人生×僕＝</h4>
                    Clock Strikes<br>
                    One Ok Rock<br>
                    2013.03.06
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/cover2.jpg" alt=""></a>
                <span>
                    <h4>STRAY SHEEP</h4>
                    Kanden<br>
                    Kenshi Yonezu<br>
                    2020.08.05
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/cover3.jpg" alt=""></a>
                <span>
                    <h4>Abbey Road (Remastered)</h4>
                    Come Together<br>
                    The Beatles<br>
                    1969.09.26
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/cover4.jpg" alt=""></a>
                <span>
                    <h4>Greatest Hits</h4>
                    When I Come Around<br>
                    Green Day<br>
                    2017.11.17
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/cover5.jpg" alt=""></a>
                <span>
                    <h4>Does This Look Infected?</h4>
                    Still Waiting<br>
                    Sum 41<br>
                    2002.11.25
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/cover6.jpg" alt=""></a>
                <span>
                    <h4>Pablo Honey</h4>
                    Creep<br>
                    Radiohead<br>
                    1993.04.20
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/slide1.jpeg" alt=""></a>
                <span>
                    <h4>Don't Look Back In Anger</h4>
                    Don't Look Back In Anger<br>
                    Oasis<br>
                    2014.10.27
                </span>
            </div>
            <div div class="content_list">
                <a href=""><img src="../resources/imgs/shop/cover7.jpg" alt=""></a>
                <span>
                    <h4>이상기후</h4>
                    낯선 열대<br>
                    쏜애플<br>
                    2014.06.12
                </span>
            </div>
        </div>
		<%@include file="footer.jsp" %>
    </div>
</body>
</html>