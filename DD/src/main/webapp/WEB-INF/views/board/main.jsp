<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div > 
			<nav class="navbar navbar-expand-sm bg-light navbar-light justify-content-end">
				<form class="form-inline " action="">
					<select name="type" class="form-control mr-sm-2">
                        <option value="1">제목</option>
                        <option value="2">내용</option>
                        <option value="3">제목+내용</option>
                    </select>
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-dark" type="submit">Search</button>
				</form>
			</nav>
		</div>
		
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>좋아요수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList}">
                            <tr>
                                <td>${board.bno}</td>
                                <td> ${board.title}</td>
                                <td>${board.userid}</td>
                                <td>
                                    <fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd HH:mm"/>
                                </td>
                                <td>${board.view_cnt}</td>
                                <td>${board.like_cnt}</td>
                            </tr>
                        </c:forEach>
				</tbody>
			</table>

			<br/>
			<br/>
						

			<div >
				<ul class="pagination justify-content-center">
					<li class="page-item "><a class="page-link text-secondary" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link text-secondary" href="#">1</a></li>
					<li class="page-item"><a class="page-link text-secondary" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-secondary" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-secondary" href="#">Next</a></li>
				</ul>
			</div>

			<div>
				
				<button class="btn btn-dark float-right" type="submit"><a href="./insert">새 글 작성</a></button>
				<a href="./insert">새 글 작성</a>
				
				
			</div>
		</div>


	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 