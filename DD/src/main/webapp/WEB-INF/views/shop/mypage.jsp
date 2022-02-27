<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="../resources/css/shop/reset.css">	
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script src="../resources/js/shop/jquery.min.js"></script>
<script src="../resources/js/shop/shop.js" defer></script>

</head>
<body>
	<div id="wrap">

		<%@ include file="../include/header.jsp" %>
		
		<section id="container">
			<aside>
				<ul>
					<li>${userid.nickname}님 환영합니다.</li>
					<li><a href="../user/logout">로그아웃</a></li>
					
				</ul>
			</aside>
	
			<div id="container_box">
				<h2>결제 목록</h2>
				<div id="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck_list" />
					<label for="allCheck_list">모두 선택</label>
					<button type="button" class="selectDelete_btn">선택 삭제</button>
				</div>
				
					<c:forEach items="${addList}" var="addList">
					<input type="hidden" name="productId" value="${addList.productId}" id="productId">
					<div id="checkbox_delete">
						<div>
							<input type="checkbox" name="chBox" class="chBox" data-userPrnum="${addList.userPrnum}">
						</div>
						<div id="cartList_box">
							<div class="cart_img">
								<a href=""><img src="${pageContext.request.contextPath}/${addList.productThumbImg}"></a>
							</div>
							<p id="cart_text">
								<span>상품명: </span>${addList.productName}<br />
								<span>노래: </span>${addList.productSong}<br />
							</p>
						</div>
						<div>
							<input type="button" data-userPrnum="${buyList.userPrnum}" value="삭제" class="delete_btn" >
						</div>
					</div>
					</c:forEach>

					
			</div>
		</section>
	
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>		
		</footer>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
	
	$("#allCheck_list").click(function(){
		 var chk = $("#allCheck_list").prop("checked");
		 
		 if(chk) {
		 	$(".chBox").prop("checked", true);
		 } else {
		 	$(".chBox").prop("checked", false);
		 }
		});
	
	$(".selectDelete_btn").click(function () {
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if (confirm_val) {
			var checkArr = new Array();
			
			// 선택된 체크박스들을 배열 checkArr에 저장
			$("input[class='chBox']:checked").each(function () {
				checkArr.push($(this).attr("data-userPrnum"));
			});
			
			$.ajax({
				url: "./deletePayment",
				type: "post",
				data: {chbox : checkArr},
				success: function (result) {
					// 리턴 받은 result 값이 1이면 성공 0이면 실패
					if(result == 1) {
						location.href="./mypage";	
					} else {
						alert("삭제 실패");
					}
					
				}
			});
		}
	});
	
	
	
	 $(".delete_btn").click(function(){
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
			  var checkArr = new Array();
			   
			  checkArr.push($(this).attr("data-userPrNum"));
			              
			  $.ajax({
			  		url : "./deletePayment",
			  		type : "post",
			  		data : { chbox : checkArr },
			  		success : function(result){
			  		if(result == 1) {            
			  			location.href = "./profile";
			  		} else {
			  			alert("삭제 실패");
			  		}
			  	}
			});
		} 
	});
	
	
	</script>

</body>
</html>