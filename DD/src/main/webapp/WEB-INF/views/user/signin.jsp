<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
		<title>회원가입</title>
	    <link rel="stylesheet" href="../resources/css/common.css">
	    <link rel="stylesheet" href="../resources/css/login.css">
	    <link rel="stylesheet" href="../resources/css/signin.css">
	    	
    </head>
	<body>
	 <section id="container">
        <div id="main_container">
            <div class="form_container">
                <div class="form">

                    <!-- logo -->
                    <div class="signin_logo_location">
                        <img src="../resources/imgs/signin/DD.png" alt="DD_logo">
                    </div>    

                    <!-- details input-->
                    <form action="./signin" method="post">
                        <h2 class="signin_font">친구들과 일정을 공유하고 싶으면 가입하세요!</h2>
                        <div>
                            <input type="email" id="userid" name="userid" placeholder="이메일 주소" required />

                        </div>
                        <div>
                            <input type="password" name="password" placeholder="비밀번호" required />
                        </div>
                        <div>
                            <input type="text" name="realname" placeholder="성명" required />
                        </div>
                        <div>
                            <input type="text" name="nickname" placeholder="사용자 이름" required />
                        </div>
                        <div>
                        	
                            <input type="date" name="birthday1" required />
                        </div>
                        <div>
                            <input type="text" name="phone" placeholder="전화번호" required />
                        </div>
                        <input type="submit" id="signin_btn" value="가입" class="signin_btn">
                        
                    </form>

                    
                </div>

                <div class="bottom_box">
                    <div>
                        <span>계정이 있나요?</span><a href="./login"> 로그인</a>
                    </div>
                </div>

            </div>
        </div>    
    </section>
	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>