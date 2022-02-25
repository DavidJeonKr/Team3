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
   		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
   		
   		<style>
		
		</style>
	</head>
	<body>		
		<%@ include file = "../include/mainHeader.jsp" %>
    	<br/>
   		<section id="container">
    		<div id="main_container_2">
    		 <section class="b_inner">
    		 	<div class="content_main">
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
					<form id="modalForm" method="post">
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
              <label for="title">무슨 일정인가요?</label>
              <input type="text" class="form-control" name="dname" id="dname"
                placeholder="일정을 알려주세요" required autofocus />
            </div>
            <div class="form-group">
              <label for="start">시작일은 언제인가요?</label>
              <input type="date" class="form-control" name="start_date" id="start_date"
              placeholder="시작일을 언제인가요?" required /> 
            </div>
            <div class="form-group">
              <label for="end">종료일은 언제인가요?</label>
              <input type="date" class="form-control" name="end_date_fake" id="end_date_fake"
              placeholder="종료일은 언제인가요?" required /> 
              <input style="display:none" type="date" class="form-control" name="end_date" id="end_date"
              required /> 
              <!--  <input type="hidden" name="userid" value="${signInUserId}" />-->
            </div>           
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">  
          	<c:if test="${userInfo.userid == userid.userid}">  
            <button type="button" class="btn btn-danger updateBtn" id="updateBtn"
              	onclick="updateEvent()">수정</button>
           	<button type="button" class="btn btn-dark float-right deleteBtn" id="deleteBtn"
              	onclick="deleteEvent()">삭제</button>
            <button type="submit" class="btn btn-warning float-right insertBtn" id="insertBtn"
              	onclick="insertEvent()">등록</button>
            </c:if>
            
          </div>
          </form>
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
		//테스트용 아이디 띄움	
		var sessionid = '${userid.userid}';
		var userinfoid = '${userInfo.userid}';
		
		var today = new Date();
		var month = today.getMonth() + 1; //getMonth()는 9월이 8으로 나옴
		var date = today.getDate();
		var g_arg; //이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
		var calendar = null; //달력 변수
		var dno;	// 일정 DB Index 번호
		
		var startDate;	//일정 추가 시 시작일
		var end;	//일정 추가 시 종료일
		var endDate; //일정 추가 시 표시할 종료일 수정용 
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
				
				select: function(arg) {
			       
			       console.log(sessionid);
			       console.log(userinfoid);
					if(sessionid == userinfoid){
				   console.log(arg);
				  
			       $('#scheduleModal').modal({backdrop: "static"});   //id가 "insertModal"인 모달창을 열어준다.
			       }
			       $('#updateBtn', '#deleteBtn').css('display', 'none');
			       startDate = arg.startStr;		
			       $('#start_date').val(startDate);
			       console.log(startDate);			  //선택한 시작일 출력    
			       			       
			       endDate = arg.end;
			       
			       endDate.setDate(endDate.getDate()-1);
			       console.log(endDate);				       
			       function getFormatDate(endDate){
			    	    var year = endDate.getFullYear();              //yyyy
			    	    var month = (1 + endDate.getMonth());          //M
			    	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
			    	    var day = endDate.getDate();                   //d
			    	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
			    	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
			       }			       
			       endDate = getFormatDate(endDate);			       
			       $('#end_date_fake').val(endDate);		//선택한 종료일 출력
			       
			       var endReal = arg.end;				    
				    endReal.setDate(endReal.getDate()+1);	//종료일 포맷 변경
			    	function getFormatDate(endReal){
				    	var year = endReal.getFullYear();              //yyyy
				    	var month = (1 + endReal.getMonth());          //M
				    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    	var day = endReal.getDate();                   //d
				    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    	return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
				    }			       
				    endReal = getFormatDate(endReal);
				    console.log(endReal);
				    $('#end_date').val(endReal);
				    
				    
				    $('#end_date_fake').change(function(event){		//날짜 변경 반영		    	
				    	var selectDate = new Date($('#end_date_fake').val());	
					    console.log(selectDate);					   
					    selectDate.setDate(selectDate.getDate()+1);				   
					    function getFormatDate(selectDate){
					    	var year = selectDate.getFullYear();              //yyyy
					    	var month = (1 + selectDate.getMonth());          //M
					    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
					    	var day = selectDate.getDate();                   //d
					    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
					    	return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
					    }	
					    selectDate = getFormatDate(selectDate);
					    console.log(selectDate);
					    $('#end_date').val(selectDate);
				    });
				   
			     },
								
			     eventClick: function(arg) {  
			    	dno = arg.event.id;
			    	var dname = arg.event.title;
			    	var start = arg.event.start;
			    	var end = arg.event.end;
			    	
			    	$('#dname').val(dname);
			    	
			    	start.setDate(start.getDate());	//시작일 포맷 변경
			    	function getFormatDate(start) {
				    	var year = start.getFullYear();              //yyyy
				    	var month = (1 + start.getMonth());          //M
				    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    	var day = start.getDate();                   //d
				    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    	return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
				    }
			    	start = getFormatDate(start);			       
				    $('#start_date').val(start);
			    	
			    	end.setDate(end.getDate()-1);	//종료일 포맷 변경
			    	function getFormatDate(end){
				    	var year = end.getFullYear();              //yyyy
				    	var month = (1 + end.getMonth());          //M
				    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    	var day = end.getDate();                   //d
				    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    	return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
				    }			       
				    end = getFormatDate(end);			       
				    $('#end_date_fake').val(end);
			    	
			    	console.log(dno);
			    	console.log(dname);
			    	console.log(start);
			    	console.log(end);
				    $('#scheduleModal').modal();
				    $('#dname').val(dname)
				    $('#start_date').val(start);
				    $('#end_date_fake').val(end);
				    
				    var endReal = arg.event.end;
				    
				    endReal.setDate(endReal.getDate());	//종료일 포맷 변경
			    	function getFormatDate(endReal){
				    	var year = endReal.getFullYear();              //yyyy
				    	var month = (1 + endReal.getMonth());          //M
				    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    	var day = endReal.getDate();                   //d
				    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    	return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
				    }			       
				    endReal = getFormatDate(endReal);
				    console.log(endReal);
				    $('#end_date').val(endReal);
				    
				    $('#end_date_fake').change(function(event){		//날짜 변경 시 반영		    	
				    	var selectDate = new Date($('#end_date_fake').val());	
					    console.log(selectDate);					   
					    selectDate.setDate(selectDate.getDate()+1);				   
					    function getFormatDate(selectDate){
					    	var year = selectDate.getFullYear();              //yyyy
					    	var month = (1 + selectDate.getMonth());          //M
					    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
					    	var day = selectDate.getDate();                   //d
					    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
					    	return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
					    }	
					    selectDate = getFormatDate(selectDate);
					    console.log(selectDate);
					    $('#end_date').val(selectDate);
				    });
				    
				    
			     },
			     
			     eventDrop: function (arg) {	//이벤트 드래그드랍 시 호출될 함수			    	 
			    	 if(sessionid == userinfoid){
			    	 $('#scheduleModal').modal(arg);
			    	 }
			     },
			     
			     eventResize: function (arg) {	//이벤트 사이즈 변경 시(일정변경) 호출될 함수
			    	 if(sessionid == userinfoid){
			    	 $('#scheduleModal').modal(arg);
			    	 }
			     },
			     			
				 events : 					
					[						
					<c:forEach items="${schedule}" var="s">
					{
						id: '${s.dno}',
						title: '${s.dname}',
					    start: '${s.start_date}',
					    end: '${s.end_date}'					 
					},
					</c:forEach>
					]
				
			});
			calendar.render();
		});		
		
		//모달초기화
		function initModal(modal, arg) {
		    $("#dname").val("");		   	   
		    $("." + modal).modal("hide");
		   
		}
		<%--모달 datepicker
		$(function(){
			$("#start", "#end").datepicker();
			
		}); --%>
			
		//Modal 버튼 클릭 함수
		function insertEvent() {
			var dname = $('#dname').val();
			if (dname == '') {
				alert('일정 이름을 입력해주세요');
				$('#dname').focus();
				return;
			}
			
			var start_date = document.querySelector('#start_date').val;
			console(start_date);
			if (start_date == 0) {
				alert('시작일을 선택해주세요');
				return;
			}
			
			var end_date = $('#end_date').val();
			if (end_date == 0) {
				alert('종료일을 선택해주세요');
				return;
			}
		}
			
			//$('#insertBtn').click(function(){				
			//	$("#modalForm").attr("action", "")	
			//});

			
			
			
			function deleteEvent(){
				console.log("일정 삭제 중");
				if(confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type: "GET",
					url: "delete?dno=" + dno,
					success:function(){
						console.log("삭제완료");
						alert("선택하신 일정이 삭제되었습니다.");
						location.href='http://localhost:8181/dd/diary/calendar';
					}										
				});
				} else {
					return;
				
				}
			}
			
			function updateEvent(){
				console.log("일정 수정 중");
				var data = 
				{
					dno : dno,
					dname : $('#dname').val(),
					start_date : $('#start_date').val(),
					end_date : $('#end_date').val()	
				}	//컨트롤에 넘길 데이터이름 : 데이터(input에 들어간 값)
				if(confirm("정말 수정하시겠습니까?")) {
				$.ajax({
					type: "POST",
					url: "update",
					data: data,		
					success:function() {
						console.log("수정 완료");
						alert("선택하신 일정이 수정되었습니다.");
						location.href='http://localhost:8181/dd/diary/calendar';
					}										
				});	
				} else {
					return;
				}
			}
			
	</script>
		
	</body>
</html>