<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
		<title>비밀번호 재설정</title>
	    <link rel="stylesheet" href="../resources/css/common.css">
	    <link rel="stylesheet" href="../resources/css/reset.css">
    </head>
	<body>
	 <section id="container">
        <div id="main_container">
            <div class="form_container">
                <div class="form">

                    <!-- logo -->
                    <div class="lock_icon_location">
                        <img src="../resources/imgs/lock_icon.jpg" alt="lock_icon">
                    </div>    

                    <!-- details input-->
                    <form action="#" method="post">
                        <h4 class="ask_reset">로그인에 문제가 있나요?</h4>
                        <div class="inform_reset">이메일 주소를 입력하시면 새로운<br> 비밀번호를 보내드립니다.</div>
                        <div>
                            <input type="email" id="userid" name="userid" placeholder="이메일 주소">

                        </div>
                       
                        <input type="submit" id="reset_btn" value="비밀번호 보내기" class="reset_btn">
                        
                    </form>

                    <div class="middle_line">
                        <div class="line"></div>
                        <div class="or">또는</div>
                        <div class="line"></div>
                    </div>
                    <div class="signin_page">
                        <a href="./signin">새 계정 만들기</a>
                    </div>

                    
                    
                </div>
                <div class="form_bottom">
                    <a href="./login"> 
                        <div class="click_login">
                            로그인으로 돌아가기
                        </div>
                    </a>
                </div>
            </div>
        </div>    
    </section>
	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>