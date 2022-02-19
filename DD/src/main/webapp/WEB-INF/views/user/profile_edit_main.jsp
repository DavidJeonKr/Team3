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
    		 				<a href="./">프로필 설정</a>
    		 			</li>
    		 			<li>
    		 				<a href="./profile_edit_pass">비밀번호 변경</a>
    		 			</li>
    		 		</ul>
    		 	
    		 		<article>
    		 			<div>
    		 			</div>
    		 			<form>
    		 				<div>
    		 					<aside>
    		 						<label for="이름">이름</label>
    		 					</aside>
    		 					<div>
    		 						<input type="text" value="" required/>
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