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
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>

    <title>Document</title>
</head>
<body>
    
    <div id="wrap">
        <%@include file="../include/header.jsp" %>
        <div class="content">
            <div class="main_img">
                <img src="../resources/imgs/shop/cover1.jpg" alt="">
            </div>
            <div>
                <h2>人生 x 僕 = / Jinsei Kakete Bokuwa (인생 곱하기 나는)</h2>
                <h4>ONE OK ROCK</h4><br>
                <span>발매일 2013.03.06</span><br>
                <span>장르 J-POP</span><br>
                <span>발매사 A-Sketch</span><br>
                <span>기획사 AMUSE Inc.</span><br>
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
                       <td>The Beginning</td>
                       <td><a href="">+</a></td>
                   </tr>
                   <tr>
                    <td><span class="song_title">TITLE</span> Clock Strikes</td>
                    <td><a href="">+</a></td>
                </tr>
                <tr>
                    <td>Smiling Down</td>
                    <td><a href="">+</a></td>
                </tr>
                <tr>
                    <td>Deeper Deeper</td>
                    <td><a href="">+</a></td>
                </tr>
                <tr>
                    <td>Be The Light</td>
                    <td><a href="">+</a></td>
                </tr>
               </tbody>
           </table>
        </div>
       	<%@include file="../include/footer.jsp" %>

    </div>
</body>
</html>