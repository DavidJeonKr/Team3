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
	    <link rel="stylesheet" href="../resources/css/user/reset.css">
    </head>
	<body>
	 <section id="container">
        <div id="main_container">
            <div class="form_container">
                <div class="form">

                    <!-- logo -->
                    <div class="lock_icon_location">
                        <img src="../resources/imgs/signin/lock_icon.jpg" alt="lock_icon">
                    </div>    

                    <!-- details input-->
                    <form action="reset" method="post">
                        <h4 class="ask_reset">로그인에 문제가 있나요?</h4>
                        <div class="inform_reset">이메일 주소를 입력하시면 새로운<br> 비밀번호를 보내드립니다.</div>
                        <div>
                            <input type="text" class="email" id="userid" name="userid" placeholder="이메일 주소">
                        </div>
                        <span class="email_conf_1">등록된 이메일 입니다.</span>
                        <span class="email_conf_2">등록되지 않은 이메일 입니다..</span>
                        <span class="email_conf_3">이메일을 입력해주세요.</span>
                       
                        <input type="button" id="reset_btn" value="비밀번호 보내기" class="reset_btn" disabled />
                        
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
                    <a href="../"> 
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
    <script>
    /* 이메일 확인 */
    $(".email").on("propertychange change keyup paste input", function(){
    	var userid = $('.email').val(); // 입력된 값
    	var data = {userid : userid}
    	
    	$.ajax({
    		type:"post",
    		url : "./checkid",
    		data : data,
    		success : function(result){
    			if(result == "empty"){
    				$('.email_conf_1').css('display','none');
        			$('.email_conf_2').css('display','none');
        			$('.email_conf_3').css('display','block');
        			$('.reset_btn').attr("disabled", true);
    			}else if(result == "find"){
    				$('.email_conf_1').css('display','block');
        			$('.email_conf_2').css('display','none');
        			$('.email_conf_3').css('display','none');
        			$('.reset_btn').attr("disabled", false);
    			}else{
    				$('.email_conf_1').css('display','none');
        			$('.email_conf_2').css('display','block');
        			$('.email_conf_3').css('display','none');
        			$('.reset_btn').attr("disabled", true);
    			}
    		}
    	});
    	
    });
    
    /* 비밀번호 이메일로 보내기 */
    $(".reset_btn").click(function(){
		var email = $(".email").val(); //입력한 이메일
		
		$.ajax({
			type:"GET",
			url:"passReset?email=" + email,
			success:function(data){
				alert("이메일이 전송 하였습니다. 이메일을 확인해주세요.");
			}
					
		});
    	
    });
    
    </script>
	</body>
</html>