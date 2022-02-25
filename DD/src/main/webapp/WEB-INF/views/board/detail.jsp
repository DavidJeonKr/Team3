<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

<%@ include file = "../include/mainHeader.jsp" %>
    
    
    <section id="container">
    	<div id="main_container_2">
    		 <section class="b_inner">
    		 	<div class="content_main">
    		 		<div class="container" style="margin-top: 40px;">
		
		
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<h4 style="margin-right: 40px;">글 상세보기</h4>
			<ul class="navbar-nav">
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;" ><a class="nav-link" href="./main">게시판 목록</a></li>
				<c:if test="${userInfo.userid == userid.userid}">  
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;"><a class="nav-link" href="./update?bno=${board.bno}">수정</a></li>
				<li class="nav-item" style="font-size: 14px; margin-right: 20px;"><a class="nav-link" id="menu-delete" href="./delete?bno=${board.bno}">삭제</a></li>
				</c:if>
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
				<div>
                    <input type="hidden" id="bno" value="${board.bno}" />
                </div>
				
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
				
				<div class="row" style="margin: 10px; margin-bottom: 10px; height:300px;">
					
					<textarea class="form-control-plaintext" rows="5" name="content" required readonly>${board.content}</textarea>
					
				</div>
				
		
			</form>
		</div>
		<hr/>
		<div>
			<p class="text-center">댓글 남기기</p>
		</div>
		<hr/>
			
		<div>			
			<input type="text" id="rcontent" name="rcontent" placeholder="댓글 입력"  />
                <%-- 로그인한 사용자 아이디를 input의 값으로 설정 --%>
                <input type="text" id="reply_userid" name="userid" value="${userid.userid}" readonly />
                <button id="btn_create_reply" class="btn btn-dark">등록</button>
                
		</div>
		<!--  
		  <div class="row">
			<div class="col-sm-8">			
				<textarea style="height:50px" class="form-control" rows="5" id="comment" name="text"></textarea>
			</div>
			<div class="col-sm-1">
				<input  style="height:50px;" type="text" id="reply_userid" name="userid" value="${userInfo.userid}" readonly />
			</div>
			<div class="col-sm-2">
				<button id="btn_create_reply" class="btn btn-dark">등록</button>
			</div>
		-->	
			
			
		</div>
		
		<hr/>
           
            <div id="replies">
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
	  <script>
        $(document).ready(function () {
        	// input[id="bno"] 요소의 value 속성값을 읽음.
        	var boardNo = $('#bno').val();
        	
        	// 게시글 번호(boardNo)에 달려 있는 모든 댓글 목록을 읽어오는 Ajax 함수 정의(선언)
        	function getAllReplies() {
        		// $.getJSON(요청URL, 콜백 함수): URL로 Ajax GET 요청을 보내고 
        		// JSON 문자열을 응답으로 전달받아서 처리하는 함수.
                $.getJSON('/dd/replies/all/' + boardNo, function (respText) {
                    // console.log(data);
                    // respText: REST Controller가 보내준 JSON 형식의 문자열 - 댓글들의 배열(array)
                    
                    $('#replies').empty(); // div[id="replies"]의 모든 하위 요소들을 삭제
                    
                    var list = ''; // div[id="replies"]의 하위 요소(HTML 코드)를 작성할 문자열.
                    
                    // 배열 respText의 원소들을 하나씩 꺼내서 콜백 함수를 호출.
                    $(respText).each(function () {
                    	var date = new Date(this.regdate); // JavaScript Date 객체 생성
                    	var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
                    	list += '<div class="reply_item">'
                    		   + '<input type="text" id="cno" name="cno" value="'
                    		   + this.cno
                    		   + '" readonly />'
                    		   + '<input type="text" id="rcontent" name="rcontent" value="'
                    		   + this.rcontent
                    		   +'" />'
                    		   + '<input type="text" id="userid" name="userid" value="'
                    		   + this.userid
                    		   + '" readonly />'
                    		   + '<input type="text" id="regdate" name="regdate" value="'
                    		   + dateStr
                    		   + '" readonly />';
                    	if (this.userid == '${userid.userid}') { 
                    		list += '<button class="reply_update">수정</button>'
                    			  + '<button class="reply_delete">삭제</button>';
                    	}
                    	list += '</div>';
                    });
                    
                    // 완성된 HTML 문자열(list)를 div[id="replies"]의 하위 요소로 추가
                    $('#replies').html(list);
                    
                }); // end getJSON()
        	
        	} // end getAllReplies()
        	
        	getAllReplies(); // 함수 호출
        	
        	// 댓글 작성 완료 버튼 클릭 이벤트 처리
        	$('#btn_create_reply').click(function (event) {
        		// 댓글 내용을 읽음
        		var replyText = $('#rcontent').val();
        		if (replyText == '') { // 입력된 댓글 내용이 없으면
        			alert('댓글 내용을 입력하세요...');
        			$('#rcontent').focus();
        			return; // 콜백 함수 종료
        		}
        		
        		// 댓글 작성자 아이디
        		var replier = $('#reply_userid').val();
        		
        		// 댓글 insert 요청을 Ajax 방식으로 보냄.
        		$.ajax({
        			// 요청 주소
        			url: '/dd/replies',
        			// 요청 타입
        			type: 'POST',
        			// 요청 HTTP 헤더
        			headers: {
        				'Content-Type': 'application/json',
        				'X-HTTP-Method-Override': 'POST'
        			},
        			// 요청에 포함되는 데이터(JSON 문자열)
        			data: JSON.stringify({
        				'bno': boardNo,
        				'rcontent': replyText,
        				'userid': replier
        			}),
        			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
        			success: function (resp) {
        				console.log(resp);
        				$('#rcontent').val('');
        				getAllReplies();  // 댓글 목록 업데이트
        			}
        		});
        	});
        	
        	// 수정, 삭제 버튼에 대한 이벤트 리스너는 버튼들이 만들어진 이후에 등록이 되어야 함!
        	$('#replies').on('click', '.reply_item .reply_update', function () {
        		// 수정 버튼이 포함된 div 요소에 포함된 rno와 rtext를 찾아서 Ajax PUT 요청을  보냄.
        		
        		// $(this): 클래스 속성이 reply_update인 버튼 요소.
        		var cno = $(this).prevAll('#cno').val();
        		var rcontent = $(this).prevAll('#rcontent').val();
        		
        		$.ajax({
        			// 요청 URL
        			url: '/dd/replies/' + rno,
        			// 요청 방식
        			type: 'PUT',
        			// 요청 패킷 헤더
        			headers: {
        				'Content-Type': 'application/json',
        				'X-HTTP-Method-Override': 'PUT'
        			},
        			// 요청 패킷 데이터
        			data: JSON.stringify({'rcontent': rcontent}),
        			// 성공 응답 콜백 함수
        			success: function () {
        				alert(cno + ' 댓글 수정 성공!');
        				getAllReplies(); // 댓글 목록 업데이트
        			}
        		});
        	});
        	
        	// 댓글 삭제 버튼
        	$('#replies').on('click', '.reply_item .reply_delete', function (event) {
        		var cno = $(this).prevAll('#cno').val();
        		var result = confirm(cno + '번 댓글을 정말 삭제할까요?');
        		if (result) { // 확인(Yes) 버튼을 클릭했을 때
        			$.ajax({
        				// 요청 URL
        				url: '/dd/replies/' + cno,
        				// 요청 타입
        				type: 'DELETE',
        				// 요청 헤더
        				headers: {
        					'Content-Type': 'application/json',
        					'X-HTTP-Method-Override': 'DELETE'
        				},
        				// 성공 응답 콜백 함수
        				success: function () {
        					alert(cno + '번 댓글 삭제 성공!');
        					getAllReplies();
        				}
        			});
        		}
        	});
        	
        });
        </script>
	
</body>
</html> 