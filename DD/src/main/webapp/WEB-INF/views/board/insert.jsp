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
	 <!-- 전체 section으로 묶음-->
    <section id="container">
        <!-- 상단 메뉴 바 -->
        <header id="header">
            <section class="h_inner">
                <h1 class="logo">
                    <a href="index.html">
                        <div class="logo_location">
                            <img src="../resources/imgs/main/DD.png" alt="DD" class="DDlogo">
                        </div>
                    </a>            
                </h1>
                
                <!-- 검색 창-->
                <div class="search_field">
                    <input type="text" placeholder="검색" tabindex="0">
                    <div class="fake_field">
                        <span class=sprite_small_search_icon></span>
                        <span>검색</span>
                    </div>
                </div>

                <div class="right_icons">
                    <a href="index.html"><div class="sprite_home_icon"></div></a>
                    <a href="./shop/main"><img src="../resources/imgs/main/shop.jpg" alt="shop" class="shop"></a>
                    <div class="dropdown">
                        
                        <div onclick="myFunction()" class="sprite_setting_icon"></div>
                        
                        <div id="myDropdown" class="dropdown-content">
                          <a href="#">setting</a>
                          <a href="#">LogOut</a>
                        </div>
                      </div>
                </div>
            </section>
        </header>

        <!-- 메인 내용-->
        <div id="main_container">
            <section class="b_inner">
                <div class="hori_cont">
                    <div class="profile_wrap">
                        <div class="profile_img">
                            <img src="../resources/imgs/main/profile.jpg" alt="기본사진">
                        </div>
                    </div>

                    <div class="detail">
                        <div class="top">
                            <div class="nickname">닉네임</div>
                            <a href="profile_edit.html" class="profile_edit">프로필 편집</a>
                        </div>

                        <ul class="middle">
                            <li>
                                <span>게시판</span> 3
                            </li>
                            <li>
                                <a href="friend.html">일촌</a> 3
                            </li>
                            <li>
                               	 비스켓 3
                            </li>
                        </ul>
                        <div class="bottom">
                            <div class="real_name">
                                real_name
                            </div>
                            
                        </div>
                    </div>

                    <div class="main_right">
                        <div class="music_player">
                         	   음악 플레이어
                        </div>
                    </div>
                </div>

                <div class="content_main">
                    <div class="content_bar">
                        <a href="index" class="home">홈</a>
                        <a href="./diary/main" class="diary">다이어리</a>	<%-- 다이어리 이동 --%>
                        <a href="#" class="picture">사진첩</a>
                        <a href="./board/main" class="board">게시판</a>
                    </div>
			
	</div>
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
                        <input type="text" class="form-control" name="userid" value="admin" required readonly />
                        <p>나중에 이 부분 숨길부분 /일단 admin으로 고정-> userid</p>
                </div>
                    
				<div>
					<input type="submit" value="작성 완료">
				</div>
			</form>
		</div>
	</div>
	

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