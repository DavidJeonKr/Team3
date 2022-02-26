<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="userId">
		    <a href="./mypage"><p class="userId_text">닉네임 : ${userid.nickname}</p></a>
		    <a href="./cartList"><p class="userId_text">장바구니</p></a>
		    <a href="../user/logout"><p class="userId_text">로그아웃</p></a>
	    </div>
</body>
</html>