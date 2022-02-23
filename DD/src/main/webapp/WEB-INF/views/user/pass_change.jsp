<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
	<link rel="stylesheet" href="../resources/css/user/profile_edit.css">
	<link rel="stylesheet" href="../resources/css/common.css">
    <title>DD</title>
    
</head>
<body>
    <%@ include file = "../include/mainMenuHeader.jsp" %>
    
    <section id="container">
    	<div id="main_container_2">
    		 <section class="b_inner">
    		 	<div class="content_main_edit">
    		 		<ul class="edit_menu">
    		 			<li>
    		 				<div id="profile_edit">프로필 설정</div>
    		 			</li>
    		 			<li>
							<div id="pass_change">비밀번호 변경</div>
    		 			</li>
    		 		</ul>
    		 	
    		 		<article class="edit_main">
    		 			<div class="edit_userid">
    		 				<div>
    		 					<aside>
    		 						<label for="userid">이메일</label>
    		 					</aside>
    		 					<div>
    		 						<input type="text" name="userid" value="${userInfo.userid}" id="userid" disabled/>
    		 					</div>
    		 				</div>
    		 			
    		 			</div>
    		 			<form id="pass_change_form" method="post">
    		 			<input type="hidden" name="userid" value="${userInfo.userid}"/>
    		 				<div>
    		 					<aside>
    		 						<label for="pass">현재 비밀번호</label>
    		 					</aside>
    		 					<div>
    		 						<input type="password" name="pass" id="pass" required/>
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						<label for="newPass">새 비밀번호</label>
    		 					</aside>
    		 					<div>
    		 						<input type="password" name="newPass" id="newPass" required/>
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						<label for="newPassCk">새 비밀번호 확인</label>
    		 					</aside>
    		 					<div>
    		 						<input type="password" name="password" id="newPassCk" required/>
    		 						
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						
    		 					</aside>
    		 					<div>
    		 						<input type="button" value="비밀번호 변경" id="passEditBtn" > 
    		 					</div>
    		 				</div>
    		 				
    		 			</form>
    		 		</article>
    		 	</div>
    		 </section>
    	</div>
    </section>
    
    
    
    
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    // 유효성 검사 변수들
    var passCheck = false;
    var newPassCheck = false;
    var newPassCkCheck = false;
    
    // 유효성 검사 함수
    
    
    // 비밀번호 변경 버튼 클릭시
    $('#passEditBtn').click(function(){
    	var pass = $('#pass').val();
    	var newPass = $('#newPass').val();
    	var newPassCk = $('#newPassCk').val();
    	
    	if(pass==""){
    		passCheck = false;
    	}
    	if(newPass==""|| newPass.length<8){
    		newPassCheck = false;
    	}else{
    		newPassCheck = true;
    	}
    	if(newPassCk=="" || newPassCk!=newPass){
    		newPassCkCheck=false;
    	}else{
    		newPassCkCheck=true;
    	}
    	
    	if(!passCheck){
    		alert('현재비밀번호를 확인해주세요')
    	}else if(!newPassCheck){
    		alert('8자리 이상의 비밀번호를 설정해주세요')
    	}else if(!newPassCkCheck){
    		alert('두 비밀번호가 일치하는지 확인해주세요')
    	}else if(passCheck&&newPassCheck&&newPassCkCheck){
    		$("#pass_change_form").attr("action", "./pass_change");
			$("#pass_change_form").submit();
			alert("비밀번호 변경완료.")
    	}
		return false;
    	
    });
    
    
    $(document).ready(function () {
	    $('#pass').change(function (event) {
			
			var data = { pass: $('#pass').val() };
			
			$.ajax({
	    		type:"post",
	    		url:"./checkpass",
	    		data : data,
	    		success : function(result){
	    			if(result == 'success'){
	    				passCheck = true;
	    			}else{
	    				passCheck=false;
	    			}
	    		}
			});
	    });
    });
	    
    
    
        $('#profile_edit').click(function(){
        	location.href="./profile_edit_main"
        });
        
        $('#pass_change').click(function(){
        	location.href="./pass_change"
        });
        
    </script>
</body>
</html>