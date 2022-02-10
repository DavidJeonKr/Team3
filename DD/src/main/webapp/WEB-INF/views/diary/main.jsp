<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<%-- Diary 다이어리 main page --%>
	<%-- 다이어리 메뉴 클릭 시 응답되는 View --%>
	<head>
		<meta charset="UTF-8">
		<title>DD</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" /> 		
   		<link rel="stylesheet" href="../resources/css/common.css">
   		<link rel="stylesheet" href="../resources/css/diary.css">
   		<script src="../resources/js/diary.js"></script>
   		<script>

  document.addEventListener('DOMContentLoaded', function() {
	 
	var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
      {
          title: 'All Day Event',
          start: '2022-02-01'
        },
        {
          title: 'Long Event',
          start: '2022-02-07',
          end: '2022-02-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2022-02-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2022-02-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2022-02-11',
          end: '2022-02-13'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T10:30:00',
          end: '2020-09-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2022-02-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2022-02-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2022-02-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2022-02-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2022-02-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url : 'https://www.google.com/',          
          start: '2022-02-28'
        }
      ]
    });

    calendar.render();
  });

		</script>
		<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

		</style>
		
		
	</head>
	<body>		
		<!-- 전체 section으로 묶음-->
    <section id="container">
        <!-- 상단 메뉴 바 -->
        <header id="header">
            <section class="h_inner">
                <h1 class="logo">
                    <a href="../index.html">
                        <div class="logo_location">
                            <img src="../resources/imgs/DD.png" alt="DD" class="DDlogo">
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
                    <a href="../index.html"><div class="sprite_home_icon"></div></a>
                    <a href="../shop.html"><img src="../resources/imgs/shop.jpg" alt="shop" class="shop"></a>
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
                            <img src="../resources/imgs/profile.jpg" alt="기본사진">
                        </div>
                    </div>

                    <div class="detail">
                        <div class="top">
                            <div class="nickname">닉네임</div>
                            <a href="../profile_edit.html" class="profile_edit">프로필 편집</a>
                        </div>

                        <ul class="middle">
                            <li>
                                <span>게시판</span> 3
                            </li>
                            <li>
                                <a href="../friend.html">일촌</a> 3
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

                    <div clas="main_right">
                        <div class="music_player">
                         	   음악 플레이어
                        </div>
                    </div>
                </div>

                <div class="content_main">
                    <div class="content_bar">
                        <a href="../index" class="home">홈</a>
                        <a href="main" class="diary">다이어리</a>	<%-- 다이어리 이동 --%>
                        <a href="#" class="picture">사진첩</a>
                        <a href="../board/main" class="board">게시판</a>
                    </div>
				<br>
                    <div> <!--컨텐트 들어갈 div-->
						<div id='calendar'></div>
						
						
                    </div>
                </div>

            </section>
        </div>
    </section>
		
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