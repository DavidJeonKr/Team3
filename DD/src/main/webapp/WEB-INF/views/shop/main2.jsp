<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>shop page</title>
    <link rel="stylesheet" href="../resources/css/shop/reset.css">
    <link rel="stylesheet" href="../resources/css/shop/shop.css">
    <link rel="stylesheet" href="../resources/css/shop/footer.css">
    <link rel="stylesheet" href="../resources/css/shop/header.css">
    
    <script src="../resources/js/shop/jquery.min.js"></script>
    <script src="../resources/js/shop/shop.js" defer></script>
     
    <style>
    #wrap footer {
    	margin-top: 170px;
    }
    </style>

</head>
<body>

    <div id="wrap">
		<%@include file="../include/header.jsp" %>
		<div class="main_content">
			<div class="left_img">
			<ul>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[2].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[2].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[2].productName}</span>
				</div>
					
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[3].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[3].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[3].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[4].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[4].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[4].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[5].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[5].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[5].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[6].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[6].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[6].productName}</span>
				</div>
				</li>
				<li>
				<div class="minititle">
					<a href="./musicdetail?n=${list[8].productId}"><img class="main_img" src="${pageContext.request.contextPath}/${list[8].productThumbImg}" alt="hotProgramImg1"></a>
					<span class="minititle">${list[8].productName}</span>
				</div>
				</li>
			</ul>
			</div>
	        <div id="slider">
	            <ul class="slide">
	                <li><img src="../resources/imgs/shop/slide1.png" alt=""></li>
	                <li><img src="../resources/imgs/shop/slide2.jpg" alt=""></li>
	                <li><img src="../resources/imgs/shop/slide3.jpg" alt=""></li>
	            </ul>
	        </div>
        </div>
        <div id="line"></div>
        <div id="main">
            <div class="inner">
                <section class="con1 clear">
                    <div class="content_menu">
                        <h2 class="con1_title">최신 앨범</h2>
                        <p class="more"><a href="#">more</a></p>
                    </div>
                    <ul class="hotList clear">      
                        <li>
                            <div class="imgbox">
                               <a href="./musicdetail?n=${list[7].productId}"><img src="${pageContext.request.contextPath}/${list[7].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[7].productId}"><h4>${list[7].productName}</h4>
                            								   
                            								  <p class="songtitle">title<p><p>${list[7].productSong}</p><br>
                            								  2022. 2. 20.</a></span></li>
                        <li>
                            <div class="imgbox">
                              <a href="./musicdetail?n=${list[1].productId}"><img src="${pageContext.request.contextPath}/${list[1].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[1].productId}"><h4>${list[1].productName}</h4>
                            								  
                            								  <p class="songtitle">title<p><p>${list[1].productSong}</p><br>
                            								  2022. 2. 15.</a></span></li>
                        <li>
                            <div class="imgbox">
                               <a href="./musicdetail?n=${list[0].productId}""><img src="${pageContext.request.contextPath}/${list[0].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[0].productId}"><h4>${list[0].productName}</h4>
                            								  
                            								  <p class="songtitle">title<p><p>${list[0].productSong}</p><br>
                            								  2022. 2. 10.</a></span></li>
        
                    </ul>                    
					
						
					
                </section>
                <section class="con2 clear">
                    <div class="content_menu">
                        <h2 class="con2_title">인기 앨범</h2>
                        <p class="more"><a href="#">more</a></p>
                    </div>    
                    <ul class="originalList clear">                        
                    
                        <li>
                            <div class="imgbox">
                               <a href="./musicdetail?n=${list[9].productId}"><img src="${pageContext.request.contextPath}/${list[9].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[9].productId}"><h4>${list[9].productName}</h4>
                            								   
                            								  <p class="songtitle">title<p><p>${list[9].productSong}</p><br>
                            								  2022. 1. 5.</a></span></li>
                        <li>
                            <div class="imgbox">
                              <a href="./musicdetail?n=${list[10].productId}"><img src="${pageContext.request.contextPath}/${list[10].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[10].productId}"><h4>${list[10].productName}</h4>
                            								  
                            								  <p class="songtitle">title<p><p>${list[10].productSong}</p><br>
                            								  2022. 1. 10.</a></span></li>
                        <li>
                            <div class="imgbox">
                               <a href="./musicdetail?n=${list[11].productId}""><img src="${pageContext.request.contextPath}/${list[11].productThumbImg}" alt="hotProgramImg1"></a>
                            </div>
                            <span class="minititle"><a href="./musicdetail?n=${list[11].productId}"><h4>${list[11].productName}</h4>
                            								  
                            								  <p class="songtitle">title<p><p>${list[11].productSong}</p><br>
                            								  2022. 1. 4.</a></span></li>
                    </ul>                    
                </section>
            </div>
        </div>
		<%@include file="../include/footer.jsp" %>
		<%@include file="../include/aside.jsp" %>
		<div class="search">
			<form action="./search" method="get">
				<input type="text" name="keyword" id="search_box"  placeholder="검색어 입력" />
				
			</form>
			<div class="ranking">
			<table>
				<tr>
					<td><div class="ranking_text"><span>1 </span><a href="./musicdetail?n=${list[0].productId}"><img class="ranking_img" src="${pageContext.request.contextPath}/${list[0].productThumbImg}"></a> <a href="">${list[0].productName}</a></div></td>
				</tr>
				<tr>
					<td><div class="ranking_text"><span>2 </span><a href="./musicdetail?n=${list[8].productId}"><img class="ranking_img" src="${pageContext.request.contextPath}/${list[8].productThumbImg}"></a> <a href="">${list[8].productName}</a></div></td>
				</tr>
				<tr>
					<td><div class="ranking_text"><span>3 </span><a href="./musicdetail?n=${list[2].productId}"><img class="ranking_img" src="${pageContext.request.contextPath}/${list[2].productThumbImg}"></a> <a href="">${list[2].productName}</a></div></td>
				</tr>
				<tr>
					<td><div class="ranking_text"><span>4 </span><a href="./musicdetail?n=${list[5].productId}"><img class="ranking_img" src="${pageContext.request.contextPath}/${list[5].productThumbImg}"></a> <a href="">${list[5].productName}</a></div></td>
				</tr>
				<tr>
					<td><div class="ranking_text"><span>5 </span><a href="./musicdetail?n=${list[1].productId}"><img class="ranking_img" src="${pageContext.request.contextPath}/${list[1].productThumbImg}"></a> <a href="">${list[1].productName}</a></div></td>
				</tr>
							
			</table>
			</div>
		</div>
		
		<div id="modal" class="modal-overlay">
			<div class="modal-window">
				<div class="content">
					<img alt="" src="../resources/imgs/shop/modal.png">
					<img alt="" src="../resources/imgs/shop/modal2.png">
				</div>
				<div class="close-area">닫기</div>
			</div>
		</div>
	     
    </div>
    
     <script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
		$(document).ready(function () {
			$(".close-area").click(function () {
				$("#modal").hide();
			});
		});
		
		
	</script>
   
</body>

</html>