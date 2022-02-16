<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>		
		<meta charset="UTF-8">
		<title>DD</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" /> 		
   		<link rel="stylesheet" href="../resources/css/common.css">
   		<link rel="stylesheet" href="../resources/css/diary/diary.css">
   		<script src="../resources/js/diary/diary.js"></script>
   		<script src="../resources/js/diary/ko.js"></script>
   		<!-- Bootstrap JavaScript 파일 링크 -->
   		<link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
   		<!-- JQuery -->
   		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
   		
   		
   		<style>
		
		</style>
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
                            <img src="resources/imgs/main/DD.png" alt="DD" class="DDlogo">
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
                    <a href="./shop/main"><img src="resources/imgs/main/shop.jpg" alt="shop" class="shop"></a>
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
                            <img src="resources/imgs/main/profile.jpg" alt="기본사진">
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
                        <a href="./diary/calendar" class="diary">다이어리</a>	<%-- 다이어리 이동 --%>
                        <a href="#" class="picture">사진첩</a>
                        <a href="./board/main" class="board">게시판</a>
                    </div>
				<br/>
                	<!-- 달력 출력 위치 -->
					<div style="text-align: center; width: 100%;" 
							id="calendar">
					</div>
                </div>

            </section>
        </div>
    </section>
    
    
    <!-- Modal -->		
		<!-- 밑의 id 값을 토대로 모달을 호출하게 된다.--> 
  		<div class="modal fade insertModal" id="scheduleModal" role="dialog">     		
    		<div class="modal-dialog">
				<div class="modal-content">
     		 	<!-- Modal Header -->
         			 <div class="modal-header">
           				 <h4 class="modal-title">일정 등록</h4>
            				<button type="button" class="close"
              					onclick="initModal('insertModal', g_arg)"
            				> &times;
            				</button>
         			</div>    
        <!-- Modal body -->
          <div class="modal-body">
            <div class="form-group">
              <label for="title">일정 메모:</label>
              <input type="textbox" class="form-control" name="dname" id="dname"
                placeholder="무슨 일정인가요?" required autofocus />
            </div>
            <div class="form-group">
              <label for="start">시작일:</label>
              <input type="date" class="form-control" name="start_date" id="start_date" required /> 
            </div>
            <div class="form-group">
              <label for="end">종료일:</label>
              <input type="date" class="form-control" name="end_date" id="end_date" required /> 
            </div>           
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">            
            <button type="button" class="btn btn-danger rejectBtn"
              onclick="updateEvent('insertModal', g_arg)">수정</button>
            <button type="button" class="btn btn-dark float-right deleteBtn"
              onclick="deleteEvent('insertModal', g_arg)">삭제</button>
            <button type="button" class="btn btn-warning float-right insertBtn"
              onclick="insertEvent()">등록</button>
          </div>
        </div>
      </div>
    </div>     
				
	<!-- 드롭다운 스크립트 -->
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
    
	<!-- 달력 출력 스크립트 (Fullcalendar) -->
	<script>	
		
		var userid = $('#userid').text();
		console.log(userid);
		var today = new Date();
		var month = today.getMonth() + 1; //getMonth()는 9월이 8으로 나옴
		var date = today.getDate();
		var g_arg; //이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
		var calendar = null; //달력 변수
		//var todayStr = today.getFullYear() + "-" + stringFormat(month) + "-" + stringFormat(date);
		
		$(document).ready(function() {	
		//document.addEventListener('DOMContentLoaded', function() {
			//var userid = $('#userid').val();
			var calendarEl = document.getElementById('calendar');
			calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				
				headerToolbar: {
			        left: 'prevYear,prev,next,nextYear today',
			        center: 'title',
			        right: 'dayGridMonth,dayGridWeek,dayGridDay'
			    },
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
				//initialDate: '2022-01-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				selectMirror: true,
				navLinks: true,	//날짜 클릭 가능
				droppable : true,
				editable : true,
				nowIndicator : true, // 현재 시간 마크
				locale : 'ko', // 한국어 설정	
				dayMaxEvents: true,
				weekNumbers: true,	// 몇 번째 주인지 표시
			    //weekNumberCalculation: 'ISO',
				
				select: function(arg) {
			       console.log(arg);
			       $('#scheduleModal').modal();   //id가 "insertModal"인 모달창을 열어준다. 			       
			       
			        calendar.unselect()
			      },
			      eventClick: function(arg) {
			    	console.log(arg);
				    $('#scheduleModal').modal();
			      },
				
				events : 
					
					[						
					<c:forEach items="${schedule}" var="s">
					{
						title: '${s.dname}',
					    start: '${s.start_date}',
					    end: '${s.end_date}'					 
					},
					</c:forEach>
					]
					
			      <%--
					function getAllDiary() {
					$.getJSON('/ex02/diary/calendar/'+userid, function(respText){
						$('#calendar').empty();
						var list = '';
						$(respText).each(function() {
							list +=								
							'{' 
							+ 'title: ' + this.dname + ','
							+ 'start: ' + this.start_date + ','
							+ 'end: ' + this.end_date +					 
							'}';
							
						});
						$('#calendar').html(list);
					});
					
				}
				getAllDiary();
				--%>
			});
			calendar.render();
		});		
		
		//모달초기화
		  function initModal(modal, arg) {
		    $("." + modal + " #title").val("");
		    $("." + modal + " #start_date").val("");
		    $("." + modal + " #end_date").val("");		   
		    $("." + modal).modal("hide");
		    g_arg = null;
		  }
		
		
		//Modal 버튼 클릭 함수
		function insertEvent() {
			var dname = $('#dname').val();
			if (dname == '') {
				alert('일정 이름을 입력해주세요');
				$('#dname').focus();
				return;
			}
			
			var start_date = $('#start_date').val();
			if (start_date == 0) {
				alert('시작일을 선택해주세요');
				return;
			}
			
			var end_date = $('#end_date').val();
			if (end_date == 0) {
				alert('종료일을 선택해주세요');
				return;
			}
			
			$.ajax({				
				// 요청 주소
				url: '/diary/calendar',
				// 요청 타입
				type: 'POST',
				// 요청 HTTP 헤더
				headers: {
						'Content-Type': 'application/json',
						'X-HTTP-Method-Override': 'POST'
				},
				//요청에 포함되는 데이터 (JSON 문자열)
				data: JSON.stringify({
					'dname': dname,
					'start_date': start_date,
					'end_date': end_date					
				}),
				// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백함수
				success: function (resp){
					console.log(resp);
					//$('#rtext').val();
					//getAllDiary();
					calendar.rendar();// 댓글 목록 업데이트
				}			
				
			});
			
			
		}
		
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
	</body>
</html>