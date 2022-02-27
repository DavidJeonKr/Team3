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
    <title>DD</title>
    <link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>

<header>
    <!-- 전체 section으로 묶음-->
    <section id="container">
        <!-- 상단 메뉴 바 -->
        <header id="header">
            <section class="h_inner">
                <h1 class="logo">
                    <a href="../diary/calendar?userid=${userid.userid}">
                        <div class="logo_location">
                            <img src="/dd/resources/imgs/main/DD.png" alt="DD" class="DDlogo">
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
                    <a href="../diary/calendar?userid=${userid.userid}"><div class="sprite_home_icon"></div></a>
                    <a href="../shop/main2"><img src="../resources/imgs/main/shop.jpg" alt="shop" class="shop"></a>
                    <div class="dropdown">
                        <div onclick="myFunction()" class="sprite_setting_icon"></div>
                        <div id="myDropdown" class="dropdown-content">
                          <a href="./profile_edit_main">프로필 설정</a>
                          <a href="../user/logout">로그아웃</a>
                        </div>
                      </div>
                </div>
            </section>
        </header>

        <!-- 메인 내용-->
        <div id="main_container">
            <section class="b_inner">
                    <div> <!--컨텐트 들어갈 div-->
						
                    </div>
                </div>

            </section>
            
        </div>
    </section>
    </header>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        /* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.sprite_setting_icon')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
    </script>
</body>
</html>