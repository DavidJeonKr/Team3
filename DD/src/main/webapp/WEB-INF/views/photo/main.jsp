<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="../resources/imgs/favicon.ico">
<link rel="stylesheet" href="../resources/css/photo/common.css">
<link rel="stylesheet" href="../resources/css/photo/a.css">

<title>DD</title>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="../include/mainHeader.jsp"%>

	<!-- 사진추가 버튼 -->
	<div class="addphoto_container">
		<div class="addphoto_right">
			<!-- TODO: css 입히기-->
			<div>
				<button class="addphotobtn" type="button"
					onclick="location.href='../photo/new_post?userid=${userInfo.userid}'">
					<img id="img_btn" src="../resources/imgs/photo/add_btn.png">
				</button>
			</div>

		</div>
	</div>

	<!-- 반복문 -->
	<c:forEach var="photo" items="${photo}" varStatus="status">
		<section id="main_container1">
			<div class="inner">
				<div class="contents_box">
					<article class="contents">
						<header class="top">
							<div class="user_container">
								<div class="profile_img">
									<img src="../resources/imgs/photo/profile.jpg" alt="프로필이미지">
								</div>
								<div class="user_name">
									<!-- TODO: 이름 받기 -->
									<div class="nick_names">${userInfo.nickname}</div>
									<!-- 꼭 필요 없을 듯 -->
									<div class="country s_text">Seoul, South Korea</div>
								</div>

							</div>

							<!-- TODO: 삭제 버튼 만들기 -->
							<div>
								<%-- <button class="addphotobtn" type="button" onclick="location.href='../photo/delete?userid=${userInfo.userid}&ptno=${photo.ptno}'"> --%>
								<button class="addphotobtn" type="button"
									onclick="location.href='../photo/delete?userid=${userInfo.userid}&ptno=${photo.ptno}'">
									<img id="img_btn" src="../resources/imgs/photo/delete_btn.png">
								</button>
							</div>
						</header>
						<div class="img_section">
							<div class="trans_inner">
								<!--  <input type="hidden" name="ptno" id="ptno" value="${photo.ptno}"> -->
								<!-- 사진 업로드된 사진 -->
								<div>
									<img src="${pageContext.request.contextPath}/${photo.filename}">
								</div>
							</div>
						</div>

						<!-- 버튼 클릭시 java script 빨간색 하트로 변경 -->
						<div class="bottom_icons">
							<div class="left_icons">
								<div class="heart_btn">
									<img src="../resources/imgs/photo/heart.png" class="heart_btn">
								</div>
							</div>
						</div>


						<!-- like_cnt 한번만 받아도 됨-->
						<div id="like_count" class="likes">
							좋아요 <span id="sp_like_count">00</span>개
						</div>

						<!-- comment -->
						<div class="comment_container">
							<div class="comment" id="comment-list-ajax-post37">
								<div class="comment-detail">
									<!-- TODO: nickname=userid -> bold stylee 입히기 -->
									<div id="nickname" class="nick_name"></div>

									<div id="replies" class="replies"></div>
								</div>
							</div>
							<div class="small_heart">
								<div class="sprite_small_heart_icon_outline"></div>
							</div>
						</div>
						<fmt:formatDate value="${photo.regdate}"
							pattern="yyyy/MM/dd HH:mm:ss" var="last_update_time" />
						<!-- 댓글 regdate -->
						<div id="timer" class="timer"></div>

						<div class="comment_field" id="add-comment-post37">
							<!-- comment content -->
							<input type="text" name="rpcontent" id="rpcontent"
								class="rpcontent" placeholder="댓글달기...">
							<!-- TODO: 지워도 됨 -->
							<input type="hidden" id="ptno_trance" name="ptno_trance"
								class="ptno_class" value="${photo.ptno}" /> <input
								type="hidden" id="reply_userid" name="userid"
								value="${userInfo.userid}">
							<div id="btn" class="upload_btn" data-no="${photo.ptno}">게시</div>
						</div>
					</article>
				</div>
			</div>

		</section>
		<script>
				// var photoNo = ${photo.ptno}; // 92 -> 91이 나오는 이유는?
				var photoNo = new Array();

				photoNo.push(${photo.ptno});
				
				console.log(photoNo);
				
				//var photoNo = $('#ptno_trance').val();
				var likeCnt = ${photo.like_cnt};
				console.log(photoNo);
				
				function getAllReplies() {
					//var photoNo = ${photo.ptno};
					console.log("getAllReplies() ---------안에 "+ photoNo);
					//var photoNo = $('#ptno_trance').val();
					//console.log(date.getTime());
					$.getJSON('/dd/preplies/all/' + photoNo, function(data) {
					console.log(data);
					console.log("getAllReplies() 안에 : " + photoNo);
					
					$("#replies").empty();
					$('#nickname').empty();
					$('#like_count').empty();
					
					var idlist = '';
					var rplist = '';
					var timelist = '';
					var likelist = '';
					
					// likecount, regdate는 1개씩만 출력하고 싶음..
					$(data).each(function() {
						//console.log("data.each:" +  date);
						//console.log("photoNo: "+ photoNo);
						//시간
						//var date = new Date(date);
						
						
						// 닉네임
						idlist += '<div id="nickname" class="nick_name">'
							+ this.userid
							+ '</div>';
						// 댓글
						rplist += '<div id="replies" class="replies">'
							+ this.rpcontent
							+ '</div>';
						// 시간
//						timelist = '<div>'
//						+ dateStr
//						+'</div>';
						// 좋아요 수
						likelist = '<div> 좋아요'
						+ '<span id=span id="sp_like_count"> '
						+ likeCnt
						+ '개'
						+ '</div>';
					});
					$(".nick_name").html(idlist);
					$(".replies").html(rplist);
					// $(".timer").html(timelist);
					$('.likes').html(likelist);
					console.log("photoNo: last: "+ photoNo);
				});
				}
				getAllReplies();
	</script>
	</c:forEach>
	<script>
	//댓글 작성 이벤트
	//TODO: 한번만 작성 -> ptno 읽어 오고 그 번호에 맞는 왜? 한번만 실행되지?
	//$('#btn').click(function (event) {
	$(".upload_btn").click(function (event) {
		console.log($('.upload_btn').data('no'));
		var photoNoTest = $('#ptno_trance').val(); // 92가 뜸?
		console.log("photoTest: " +photoNoTest);
		console.log("PhotoNo: " +photoNo);
		var replyText = $('#rpcontent').val();
		if(replyText == '') {
			alert('내용을 입력하세요');
			$('#rpcontent').focus();
			return;
		}
		
		// 댓글 작성자 아이디 닉네임 -->>>>>>>>>>>>>>> 가져오기
		var replier = $('#reply_userid').val();
		
		// 댓글 insert 요청을 Ajax 방식으로 보냄.
		// 애초에 만들어 질 때 ptno가 들어옴.. 마지막 1개만 들어옴 어떻게 해야 할까?
		$.ajax({
			// 요청 주소
			url: '/dd/preplies',
			// 요청 타입
			type: 'POST',
			// 요청 HTTP 헤더
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'POST'
			},
			
			// 요청에 포함되는 데이터(JSON 문자열)
			data: JSON.stringify({
				'ptno': photoNoTest,
				'rpcontent': replyText,
				'userid': replier
			}),
			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
			success: function (resp) {
				console.log(resp);
				$('#rpcontent').val('');
				getAllReplies();  // 댓글 목록 업데이트
			}
		});
	});
	</script>
	<script>
	var date1 = "${last_update_time}";
	var date = new Date(date1);
	var resultdate = date.getTime();
	function timeForToday(resultdate) {
		const today = new Date();
        const timeValue = new Date(resultdate);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금전';
        if (betweenTime < 60) {
            return betweenTime + '분전';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour + '시간전';
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+ '일전';
        }

        return Math.floor(betweenTimeDay / 365) + '년전';
 	}
	var dateStr = timeForToday(resultdate);
	//$("#timer").empty();
	var timelist = '';
	timelist += '<div>'
	+ dateStr
	+'</div>';
	$(".timer").append(timelist);
	console.log(dateStr);
	</script>



</body>
</html>