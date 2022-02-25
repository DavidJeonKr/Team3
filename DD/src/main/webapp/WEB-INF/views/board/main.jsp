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
<%@ include file = "../include/mainHeader.jsp" %>
    
    
    <section id="container">
    	<div id="main_container_2">
    		 <section class="b_inner">
    		 	<div class="content_main">
    		 		<div class="container" style="margin-top: 40px;">
		<div > 
			<nav class="navbar navbar-expand-sm bg-light navbar-light justify-content-end">
				<form class="form-inline " action="./search" method="get">
					<select name="type" class="form-control mr-sm-2">
                        <option value="1">제목</option>
                        <option value="2">내용</option>
                        <option value="3">제목+내용</option>
                    </select>
					<input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Search" required />
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
                                <td>
                                <a href="./detail?bno=${board.bno}">${board.title}</a>
                                 </td>
                                
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
    		 	</div>
    		 </section>
    	</div>
    </section>
    
    
	 


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 