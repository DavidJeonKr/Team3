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
		<link rel="shortcut icon" href="../resources/imgs/favicon.ico">
		<link rel="stylesheet" href="../resources/css/user/signin.css">
	    <link rel="stylesheet" href="../resources/css/common.css">
	    <link rel="stylesheet" href="../resources/css/user/login.css">
	    
	    	
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
                    <form id="signin_form" method="post">
                        <h2 class="signin_font">친구들과 일정을 공유하고 싶으면 가입하세요!</h2>
                        <div>
                            <input type="text" class="userid" name="userid" placeholder="이메일 주소" required />
                        </div>
                        <span class="email_input_re_1">사용 가능한 이메일 입니다.</span>
                        <span class="email_input_re_2">이메일이 이미 존재합니다.</span>
                        <span class="email_input_re_3">이메일을 입력해주세요.</span>
                        <span class="email_input_re_4">올바르지 못한 이메일 형식입니다.</span>
                        
                        <div class="mail_check">
	                        <div>
	                            <input type="text" class="mail_check_input" placeholder="이메일 인증번호" disabled="disabled" required />
	                        </div>
	                        <div class="mail_check_button">
								<span>인증번호전송</span>
							</div>
						</div>
                        <span class="email_check_re_1">인증번호가 일치합니다.</span>
                        <span class="email_check_re_2">인증번호를 다시 확인해주세요..</span>
                        
                        <div>
                            <input type="password" class="pwd" name="password" placeholder="비밀번호" required />
                        </div>
                        <span class="pw_input">8자리 이상의 비밀번호를 입력</span>
                        <div>
                            <input type="password" class="pwd_ck" placeholder="비밀번호 확인" required />
                        </div>
                        
						<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
						<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
						
                        <div>
                            <input type="text" class="realname" name="realname" placeholder="성명" required />
                            <span class="realname_ck">이름을 입력해주세요.</span>
                        </div>
                        
                        
                        <div>
                            <input type="text" class="nickname" name="nickname" placeholder="닉네임" required />
                            <span class="nickname_ck">닉네임을 입력해주세요.</span>
                        </div>
                        
                        
                        <div>
                        	<span class="birthday_ck">생일을 입력해주세요.</span>
                            <input type="date" class="birthday" name="birthday1" required />
                        </div>
                        
                        <div>
                            <input type="text" class="phone" name="phone" placeholder="전화번호" required />
                            <span class="phone_ck">전화번호를 입력해주세요.</span>
                        </div>
                        
                        
                        <input type="button" id="signin_btn" value="가입" class="signin_btn">
                         
                    </form>


                    
                </div>

                <div class="bottom_box">
                    <div>
                        <span>계정이 있나요?</span><a href="../"> 로그인</a>
                    </div>
                </div>

            </div>
        </div>    
    </section>
	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    
    var code = ""; //이메일 전송 인증번호 저장을 위한 코드
    
    // 유효성 검사
    var emailCheck = false;		// 이메일 중복검사
    var mailnumCheck = false; 	// 이메일 인증 확인
    var pwdCheck = false; 		// 비번 자리수 확인(8자리 이상)
    var pwckcorCheck =false; 	// 비번 재확인
    var nameCheck = false; 		// 이름 확인
    var nickCheck = false;		// 닉네임 확인
    var birthCheck = false;		// 생일 확인
    var phoneCheck = false;		// 전화번호란 확인
	
    // 가입 버튼
    $('.signin_btn').click(function(){
    	
    	/* input 값 */
    	var name = $('.realname').val();		// 이름 입력란
    	var nick = $('.nickname').val();		// 닉네임 입력란
    	var birthday = $('.birthday').val();	// 생일 입력란
    	var phone = $('.phone').val();			// 전화번호 입력란
    	
    	// 유효성 검사
    	
    	//이름 유효성 검사
    	if(name == ""){
    		$('.realname_ck').css('display', 'block');
    		nameCheck = false;
    	}else{
    		$('.realname_ck').css('display', 'none');
    		nameCheck = true;
    	}
    	
    	// 닉네임 유효성 검사
    	if(nick == ""){
    		$('.nickname_ck').css('display', 'block');
    		nickCheck = false;
    	}else{
    		$('.nickname_ck').css('display', 'none');
    		nickCheck = true;
    	}
    	
    	// 생일 유효성 검사
    	if(birthday == ""){
    		$('.birthday_ck').css('display', 'block');
    		birthCheck = false;
    	}else{
    		$('.birthday_ck').css('display', 'none');
    		birthCheck = true;
    	}
    	
    	// 전화번호 유효성 검사
    	if(phone == ""){
    		$('.phone_ck').css('display', 'block');
    		phoneCheck = false;
    	}else{
    		$('.phone_ck').css('display', 'none');
    		phoneCheck = true;
    	}
    	
    	if(emailCheck && pwckcorCheck && pwckcorCheck && mailnumCheck && nameCheck && nickCheck && birthCheck && phoneCheck){
    		$("#signin_form").attr("action", "./signup");
			$("#signin_form").submit();	
    	}
    	return false;
    	
    });
    
    
    // 이메일 중복 검사
    $('.userid').on("propertychange change keyup paste input", function(){
    	
    	var userid = $('.userid').val(); // email에 입력되는 값
    	var data = {userid : userid}  // '컨트롤에 넘길 데이터 이름' : '데이터(.userid에 입력되는 값)'
    	
    	
    	$.ajax({
    		type:"post",
    		url:"./checkid",
    		data : data,
    		success : function(result){
    		
    		if(!mailFormCheck(userid)){
    			$('.email_input_re_1').css('display','none');
    			$('.email_input_re_2').css('display','none');
    			$('.email_input_re_3').css('display','none');
    			$('.email_input_re_4').css('display','block');
    			emailCheck = false;
    		}	else if(result == 'empty'){
    			$('.email_input_re_1').css('display','none');
    			$('.email_input_re_2').css('display','none');
    			$('.email_input_re_3').css('display','block');
    			$('.email_input_re_4').css('display','none');
    			emailCheck = false;
    		}else if(result == 'notFound'){
        		$('.email_input_re_1').css('display','block');
        		$('.email_input_re_2').css('display','none');
        		$('.email_input_re_3').css('display','none');
        		$('.email_input_re_4').css('display','none');
        		emailCheck = true;
        	}else{
        		$('.email_input_re_1').css('display','none');
        		$('.email_input_re_2').css('display','block');
        		$('.email_input_re_3').css('display','none');
        		$('.email_input_re_4').css('display','none');
        		emailCheck = false;
        		}	
    		}
    	});
    	
    });
    
    // 인증번호 이메일 전송
    $(".mail_check_button").click(function(){
    	var email = $('.userid').val(); // 입력한 이메일
    	var checkBox = $('.mail_check_input'); // 인증번호 입력란
    	
    	if(mailFormCheck(email)){
    		alert("이메일이 전송 하였습니다. 이메일을 확인해주세요.")
    	}else{
    		alert("올바르지 못한 이메일 형식입니다.");
    		return false
    	}
    	
    	$.ajax({
    		type:"GET",
    		url:"mailCheck?email=" + email,
    		success:function(data){
    			
    			checkBox.attr("disabled", false);
    			code = data;
    		}
    	});
    });
    
    /* 인증번호 비교 */
    $(".mail_check_input").blur(function(){
    	var inputCode = $(".mail_check_input").val();		// 입력코드	
    	
    	if(inputCode == code){							// 일치할 경우
    		$('.email_check_re_1').css('display','block');
    		$('.email_check_re_2').css('display','none');
    		mailnumCheck = true;
    	} else {											// 일치하지 않을 경우
    		$('.email_check_re_1').css('display','none');
    		$('.email_check_re_2').css('display','block');
    		mailnumCheck = false;
    	}	
    	
    });
    	
    // 비밀번호 길이 확인
    $('.pwd').on("propertychange change keyup paste input", function(){
    	var pw = $('.pwd').val();
    	if(pw.length >= 8){
    		$('.pw_input').css('display','none');
    		pwdCheck = true;
    	}else{
    		$('.pw_input').css('display','block');
    		pwdCheck = false;
    	}
    });
    	
    
    // 비밀번호 확인 일치 요효성 검사
    $('.pwd_ck').on("propertychange change keyup paste input", function(){
        	
       	var pw = $('.pwd').val();
       	var pwck = $('.pwd_ck').val();
       	
       	if(pw == pwck){
     		$('.pwck_input_re_1').css('display','block');
            $('.pwck_input_re_2').css('display','none');
            pwckcorCheck = true;
		}else{
           	$('.pwck_input_re_1').css('display','none');
           	$('.pwck_input_re_2').css('display','block');
           	pwckcorCheck = false;
        }	
    });	
    
    /* 입력 이메일 형식 유효성 검사 */
    function mailFormCheck(email){
   	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   	return form.test(email);
   }
    </script>
	</body>
</html>