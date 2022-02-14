<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta charset="UTF-8">
		<title>DD</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" /> 		
   		<link rel="stylesheet" href="../resources/css/common.css">
   		<link rel="stylesheet" href="../resources/css/diary.css">
   		<script src="../resources/js/diary.js"></script>
   		<script src="../resources/js/ko.js"></script>
   		
   		<style>
		
		</style>
	</head>
	<body>		
		<!-- 달력 출력 위치 -->
		<div id="calendar"></div>
		
		<!-- Bootstrap JavaScript 파일 링크 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- 달력 출력 스크립트 (Fullcalendar) -->
		<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				headerToolbar : { // 헤더에 표시할 툴 바
					start : 'prev next today',
					center : 'title',
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
				//initialDate: '2022-01-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				nowIndicator: true, // 현재 시간 마크
				locale: 'ko' // 한국어 설정
			});
			calendar.render();
		});
		
		</script>
	</body>
</html>