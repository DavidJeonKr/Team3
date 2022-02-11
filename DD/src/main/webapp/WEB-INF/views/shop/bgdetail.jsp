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
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
    <title>Document</title>
</head>
<body>

    <div id="wrap">
        <%@include file="header.jsp" %>
        <div class="content">
            <div class="content_list">
                <img src="../resources/imgs/shop/background1.jpeg" alt="">
                <button>+</button>
                <span>신뢰를 상징하는 파란색!<br>
                    사람을 따듯하고 차분한 기분을 들게하여
                    마음을 냉정하게 만들어 주는
                    자체의 색이라 합니다.<br>
                    그래서 상대에게 신뢰를 주어야 할 때
                    파란색을 선택하는게 좋아요.<br>
                    논리적 판단이 필요할 때도
                    파란색은 많은 도움을 준다고 합니다!<br>
                    또 집중력을 높이는 색이라고 하니 아이들 방이나 
                    일하는 공간등을 파란색으로 꾸며주면 좋다고 합니다!
                </span>
            </div>
        </div>
		<%@include file="footer.jsp" %>
    </div>
    
</body>
</html>