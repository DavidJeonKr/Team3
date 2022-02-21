<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    		 				<div>프로필 설정</div>
    		 			</li>
    		 			<li>
							<div>비밀번호 변경</div>
    		 			</li>
    		 		</ul>
    		 	
    		 		<article class="edit_main">
    		 			<div class="edit_userid">
    		 				<div class="usericon"></div>
    		 			userid
    		 			</div>
    		 			<form action="./profile_edit_main" method="post">
    		 				<div>
    		 					<aside>
    		 						<label for="realname">이름</label>
    		 					</aside>
    		 					<div>
    		 						<input type="text" name="realname" value="" required/>
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						<label for="nickname">닉네임</label>
    		 					</aside>
    		 					<div>
    		 						<input type="text" name="nickname" value="" required/>
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						<label for="birthday">생일</label>
    		 					</aside>
    		 					<div>
    		 						<input type="date" name="birthday1" value="" required/>
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						<label for="phone">전화번호</label>
    		 					</aside>
    		 					<div>
    		 						<input type="text" name="phone" value="" required/>
    		 					</div>
    		 				</div>
    		 				<div>
    		 					<aside>
    		 						
    		 					</aside>
    		 					<div>
    		 						<input type="submit" value="수정">
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
        
    </script>
</body>
</html>