<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DD</title>

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

		<nav class="navbar navbar-expand-sm bg-light navbar-light" style="padding-left: 0px;">
			<h4 style="margin-right: 40px;">새 글 작성</h4>
			
			<ul class="navbar-nav">
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;" ><a class="nav-link" href="#">게시판 목록</a></li>
				
			</ul>
		</nav>

		<br />

		<div>
			<form method="post" class="needs-validation" novalidate>
				<!-- /board/insert POST submit -->
				<div class="form-group">
					<label for="title">title:</label> 
					<input type="text" class="form-control" name="title" placeholder="제목 입력" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				
				<div class="form-group">
					<label for="content">content:</label>
					<textarea class="form-control" rows="5" name="content" placeholder="내용 입력" required></textarea>
					<div class="valid-feedback">Valid.</div>
      				<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				
				<div class="form-group w-25" > <!-- style="display: none;" -->
						<label for="userid">userid:</label>
                        <input type="text" class="form-control" name="userid" value="${userid.userid}" required readonly />
                        <p>나중에 이 부분 숨길부분 /일단 admin으로 고정-> userid</p>
                </div>
                    
				<div>
					<input type="submit" value="작성 완료">
				</div>
			</form>
		</div>
	</div>
    		 	</div>
    		 </section>
    	</div>
    </section>
    
    
	 
	

	<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 