<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
		<title>로그인</title>
	    <link rel="stylesheet" href="./resources/css/common.css">
	    <link rel="stylesheet" href="./resources/css/user/login.css">
	   
    </head>
	<body>
	 <section id="container">
        <div id="main_container">
            <div class="form_container">
                <div class="form">

                    <!-- logo -->
                    <div class="login_logo_location">
                        <img src="./resources/imgs/signin/DD.png" alt="DD_logo">
                    </div>    

                    <!--ID/PASS input-->
                    <form action="./login" method="post">
                        <div>
                            <input type="text" name="userid" id="userid" placeholder="이메일" required/>
                        </div>
                        <div>
                            <input type="password" name="password" id="password" placeholder="비밀번호" required />
                        </div>

                        <input type="submit" id="submit_btn" value="로그인" class="submit_btn">
                        <div class="find_pass">
                            <a href="./user/reset">비밀번호를 잊으셨나요?</a>
                        </div>
                    </form>

                    
                </div>

                <div class="bottom_box">
                    <div>
                        <span>아이디가 없으면?</span><a href="./user/signup"> 가입하기</a>
                    </div>
                </div>

            </div>
        </div>    
    </section>
	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>