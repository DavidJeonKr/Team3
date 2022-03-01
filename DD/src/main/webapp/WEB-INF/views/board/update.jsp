<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DD</title>
<link rel="shortcut icon" href="../resources/imgs/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/common.css">

</head>
<body>

<%@ include file = "../include/mainHeader.jsp" %>
    
    
    <section id="container">
    	<div id="main_container_2">
    		 <section class="b_inner">
    		 	<div class="content_main">
    		 		<div class="container" style="margin-top: 40px;">
		
		
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<h4 style="margin-right: 40px;">글 수정</h4>
			<ul class="navbar-nav">
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;" ><a class="nav-link" href="./main?userid=${userInfo.userid}">게시판 목록</a></li>
				<!--  
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;"><a class="nav-link" id="menu-delete" href="./delete?bno=${board.bno}&userid=${userInfo.userid}">삭제</a></li>
				-->
			</ul>
			
			
		</nav>

		<br/>
		
		
		
			
		<div>
			<form action="./update" method="post">
				<div style="display: none;">
					<input type="number" name="bno" value="${board.bno}" readonly/>
				</div>
				
				<div class="row">
					<label for="title" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;">제목</label> 
					<div class="col-11">
						<input type="text" id="title" class="form-control" name="title" value="${board.title}" style="font-size: 17px; font-weight: 600; padding:0px;" required  />
					</div>
				</div>
				
				<div class="row">
					<label for="regdate" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;">작성일</label> 
					<div class="col-5">
						<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd HH:mm" var="last_update_time"/>
						<input type="text" id="regdate" class="form-control-plaintext" name="regdate" 
					    	   value="${last_update_time}" 
					    	   style="font-size: 15px; font-weight: 600;" readonly>
					</div>
					
					<div class="col-2">
						
					</div>
					
					<label for="view_cnt" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;" >조회수</label> 
					<div class="col-1">
						<input type="text" id="view_cnt" class="form-control-plaintext" name="view_cnt" value="${board.view_cnt}" style="font-size: 12px; font-weight: 600;" readonly>
					</div>
					<!--  
					<label for="like_cnt" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;" >좋아요</label> 
					<div class="col-1">
						<input type="text" id="like_cnt" class="form-control-plaintext" name="like_cnt" value="${board.like_cnt}" style="font-size: 12px; font-weight: 600;" readonly>
					</div>
					-->
				</div>
				
				<div class="row" >
					<label for="userid" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;">작성자</label> 
					<div class="col-2">
						<input type="text" id="userid" class="form-control-plaintext" name="userid" value="${board.userid}" style="font-size: 12px; font-weight: 600;" required readonly>
					</div>
				</div>
				<hr>
				
				<div class="row" style="margin: 10px; margin-bottom: 50px; height:400px;">
					
					<textarea class="form-control" rows="5" name="content" required >${board.content}</textarea>
					
				</div>
				
				<div>
					<input type="submit" class="btn btn-dark" style="margin-left: 400px; margin-bottom: 35px;" value="수정완료" />
				</div>
                    
				
			</form>
		</div>
		

	</div>
    		 	</div>
    		 </section>
    	</div>
    </section>
    
    
	 

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<!--  
	<script>
		$(document).ready(function() {
			$('#menu-delete').click(function(event) {
				event.preventDefault(); // 링크를 클릭했을 때의 기본 동작인 요청 보내기를 하지 않음.
				var result = confirm('정말 삭제할까요?');
				if (result) { // 사용자가 YES를 선택했을 때
					location = $(this).attr('href'); // 원래 이동하려고 했던 요청 주소로 요청 보내기.
				}
			});
		
		});
	</script>
	-->
</body>
</html> 