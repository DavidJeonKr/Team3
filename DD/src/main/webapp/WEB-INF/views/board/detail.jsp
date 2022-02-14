<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

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
	
	<div class="container" style="margin-top: 40px;">
		
		
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<h4 style="margin-right: 40px;">글 상세보기</h4>
			<ul class="navbar-nav">
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;" ><a class="nav-link" href="./main">게시판 목록</a></li>
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;"><a class="nav-link" href="./update?bno=${board.bno}">수정</a></li>
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;"><a class="nav-link" href="#">삭제</a></li>
			</ul>
			
			<div class="nav" style="margin-left: 300px">
				<button type="button" class="btn btn-dark" style="margin-left: 100px; ">
					<i  class="fas fa-thumbs-up"></i>
				</button>
			</div>
		</nav>

		<br/>
		
		
		
			
		<div>
			<form>
				<!-- /board/insert POST submit -->
				<div class="row">
					<label for="title" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;">제목</label> 
					<div class="col-11">
						<input type="text" id="title" class="form-control-plaintext" name="title" value="${board.title}" style="font-size: 17px; font-weight: 600; padding:0px;" required readonly />
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
					
					<label for="like_cnt" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;" >좋아요</label> 
					<div class="col-1">
						<input type="text" id="like_cnt" class="form-control-plaintext" name="like_cnt" value="${board.like_cnt}" style="font-size: 12px; font-weight: 600;" readonly>
					</div>
				</div>
				
				<div class="row" >
					<label for="userid" class="col-1 col-form-label" style="font-size: 12px; font-weight: 600;">작성자</label> 
					<div class="col-2">
						<input type="text" id="userid" class="form-control-plaintext" name="userid" value="${board.userid}" style="font-size: 12px; font-weight: 600;" required readonly>
					</div>
				</div>
				<hr>
				
				<div class="row" style="margin: 10px; margin-bottom: 50px; height:400px;">
					
					<textarea class="form-control-plaintext" rows="5" name="content" required readonly>${board.content}</textarea>
					
				</div>
				
			
                    
				
			</form>
		</div>
		

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 