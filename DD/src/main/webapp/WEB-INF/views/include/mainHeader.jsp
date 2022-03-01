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
	rel="stylesheet"/>
    <title>DD</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    
     <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"
    />
    <link rel="stylesheet" href="../resources/css/music/style.css" />
    
    
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
                            <img src="../resources/imgs/main/DD.png" alt="DD" class="DDlogo">
                        </div>
                    </a>            
                </h1>
                
                <!-- 검색 창-->
                <div id="autocomplete" class="search_field">
                    <input type="text" placeholder="검색" tabindex="0" id="search">
                    <div class="fake_field">
                        <span class=sprite_small_search_icon></span>
                        <span>검색</span>
                    </div>
                     <div id="searchBox"> 
                    	<div id="searchVal"><!-- ajax로 불러올 검색결과 --></div>
                    </div>
                </div>
               
                <div class="right_icons">
                    <a href="../diary/calendar?userid=${userid.userid}"><div class="sprite_home_icon"></div></a>
                    <a href="../shop/main2"><img src="../resources/imgs/main/shop.jpg" alt="shop" class="shop"></a>
                    <div class="dropdown">
                        <div onclick="myFunction()" class="sprite_setting_icon"></div>
                        <div id="myDropdown" class="dropdown-content">
                          <a href="../user/profile_edit_main">프로필 설정</a>
                          <a href="../user/logout">로그아웃</a>
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
                            <img src="../resources/imgs/main/profile.jpg" alt="기본사진">
                        </div>
                    </div>

                    <div class="detail">
                        <div class="top">
                            <div class="nickname">${userInfo.nickname}</div>
                            <c:if test="${userInfo.userid == userid.userid}">	
                            	<a href="../user/profile_edit_main" class="profile_edit">프로필 편집</a>
                            </c:if>
                            
                            <c:if test="${userInfo.userid != userid.userid}">
                            	<button id="followBtn"></button>
                            </c:if>
                        </div>

                        <ul class="middle">
                            <li>
                                <span id="followerModal">팔로워 ${userInfo.followercnt}</span> 
                            </li>
                            <li>
                                <span id="followModal">팔로우 ${userInfo.followcnt}</span> 
                            </li>
                            <li>
                               	 비스켓 ${userInfo.biscuit}
                            </li>
                        </ul>
                        <div class="bottom">
                            <div class="real_name">
                                <span>${userInfo.realname}</span>
                            </div>
                           
                        </div>
                    </div>

                    <div class="main_right">
                        
                        	<div class="music-container" id="music-container">
							      <div class="music-info">
							        <h4 id="title"></h4>
							        <div class="progress-container" id="progress-container">
							          <div class="progress" id="progress"></div>
							        </div>
							      </div>
							
							      <audio src="../resources/music/Dynamite.mp3" id="audio"></audio>
							
							      <div class="img-container">	
							        <img src="../resources/music/images/Dynamite.jpg" alt="music-cover" id="cover" />
							      </div>
							      <div class="navigation">
							        <button id="prev" class="action-btn">
							          <i class="fas fa-backward"></i>
							        </button>
							        <button id="play" class="action-btn action-btn-big">
							          <i class="fas fa-play"></i>
							        </button>
							        <button id="next" class="action-btn">
							          <i class="fas fa-forward"></i>
							        </button>
							      </div>
							    </div>
                        
                    </div>
                </div>

                <div class="content_main_bar">
                    <div class="content_bar">
                        <a href="../diary/calendar?userid=${userInfo.userid}" class="diary">다이어리</a>	<%-- 다이어리 이동 --%>
                        <a href="../photo/main?userid=${userInfo.userid}" class="picture">사진첩</a>
                        <a href="../board/main?userid=${userInfo.userid}" class="board">게시판</a>
                    </div>

                    <div> <!--컨텐트 들어갈 div-->
						
                    </div>
    				    <!-- FollowModal -->		
						<!-- 밑의 id 값을 토대로 모달을 호출하게 된다.--> 
				  		<div class="modal fade insertModal" id="FModal" role="dialog">     		
				    		<div class="modal-dialog">
								<div class="modal-content">
									
				     		 	<!-- Modal Header -->
				         			 <div class="modal-header">
				           				 <h4 class="modal-title">팔로잉</h4>
				            				<button type="button" class="close"
				              					onclick="initModal('insertModal', g_arg)"
				            				> &times;
				            				</button>
				         			</div>    
				        <!-- Modal body -->
				          <div class="modal-body">          
				            <div class="form-group">
				            	<div class="followList"></div>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>  
				    
				    
				    <!-- FollowerModal -->		
						<!-- 밑의 id 값을 토대로 모달을 호출하게 된다.--> 
				  		<div class="modal fade insertModal" id="FerModal" role="dialog">     		
				    		<div class="modal-dialog">
								<div class="modal-content">
									
				     		 	<!-- Modal Header -->
				         			 <div class="modal-header">
				           				 <h4 class="modal-title text-center">팔로워</h4>
				            				<button type="button" class="close"
				              					onclick="initModal('insertModal', g_arg)"
				            				> &times;
				            				</button>
				         			</div>    
				        <!-- Modal body -->
				          <div class="modal-body">          
				            <div class="form-group">
				             	<div class="followerList"></div>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>  
				     
                </div>
                    
            </section>
            
        </div>
        
        
        
    </section>
    </header>
    
    
    
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js">
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js">
	</script>
	<script src="../resources/js/music/script.js"></script>
	
    <script>
    $(document).ready(function () {
    	// 팔로우 버튼 클릭시 모달 창 열고 팔로우한 사람들 보이게 하기
    	$('#followModal').click(function(){
    		
    		$('#FModal').modal();
    		var followid = '${userInfo.userid}';
    		
    		$.getJSON('/dd/follow/followid/' + followid, function(respText){
				var list= '';
				
				$(respText).each(function(){
					
					
					list += '<div class="allFollowContet">'
						+ '<div class="followName">'
						+'<a href="/dd/diary/calendar?userid='
						+ this.userid
						+'">'
						+'<div class="followRealname">'
						+ this.realname				
						+ '</div>'
						+ '</a>'
						+'<div class="folowNickname">'
						+ this.nickname	
						+ '</div>'
						+'</div>';
						console.log(this.userid);
						if('${userid.userid}' != this.userid){
							list+='<div id="follow_item_'+this.userid+'">';
							if(followCk(this.userid)=="follow"){
								
								list+='<button onclick="followModalClick(true, \'' + this.userid + '\',\''+this.userid+'\')", class="followBtnModal">언팔로우</button>';
							}else{
								list+='<button onclick="followModalClick(false, \'' + this.userid + '\',\''+this.userid+'\')", class="followBtnModal">팔로우</button>';
							}
							list+='</div>';
						}
						list+='</div>';
						
						
				});
				$('.followList').html(list);
				
			});
    
    	});
    	
    	
    	// 팔로워 버튼 클릭시 모달 창 열고 팔로우한 사람들 보이게 하기
    	$('#followerModal').click(function(){
    		
    		$('#FerModal').modal();
    		var followerid = '${userInfo.userid}';

    		$.getJSON('/dd/follow/followerid/' + followerid, function(respText){
				var list= '';
				$(respText).each(function(){
					list += '<div class="allFollowContet">'
						+ '<div class="followName">'
						+'<a href="/dd/diary/calendar?userid='
						+ this.userid
						+'">'
						+'<div class="followRealname">'
						+ this.realname				
						+ '</div>'
						+ '</a>'
						+'<div class="folowNickname">'
						+ this.nickname	
						+ '</div>'
						+'</div>';
					if('${userid.userid}' != this.userid){
						list+='<div id="follow_item_'+this.userid+'">';
						
						if(followCk(this.userid)=="follow"){
							list+='<button onclick="followModalClick(true, \'' + this.userid + '\',\''+this.userid+'\')", class="followBtnModal">언팔로우</button>';
						}else{
							list+='<button onclick="followModalClick(false, \'' + this.userid + '\',\''+this.userid+'\')", class="followBtnModal">팔로우</button>';
						}
						list+='</div>';
					}
					list+='</div>';
						
						
						

				});
				$('.followerList').html(list);
				
			});
    		
    	});
    	
    	// 현제 페이지에 따라 css 적용하기
    	var str = window.location.pathname.slice(4,5)
    	if(str == "d"){
    		$('.diary').css({
    			"color" : "black",
    			"border-top" : "solid 1px black"
    		});
    	}else if(str=="b"){
    		$('.board').css({
    			"color" : "black",
    			"border-top" : "solid 1px black"
    		});
    	}else if(str=="p"){
    		$('.picture').css({
    			"color" : "black",
    			"border-top" : "solid 1px black"
    		});
    	}
    	console.log();
    	
    	
    	// 팔로우 확인하기
    	data={followerid:'${userInfo.userid}'}
    	$.ajax({
    		url: '/dd/follow/check/',
    		type: 'POST', 
    		data: data,
    		success: function (result) {
    			if(result == "follow"){
    				$('#followBtn').text('언팔로우');
    			}else{
    				$('#followBtn').text('팔로우');
    			}
    		}
    	});
    	
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
		
		// 타겟영역을 제외하고 클릭했을 시 검색창 숨기기
		$('body').on('click', function(e){
		   if(e.target.className!="searchBox"){
			   console.log("클릭");
			   $('#searchBox').css({
					"display":"none" 
				 });
		   } 
		});

		
		$('#search').on("change keyup paste", function(){
			 $('#searchBox').css({
				"display":"block" 
			 });
			var search = $('#search').val();
			$.getJSON('/dd/search/search/' + search, function(respText){
				var list= '';
				$(respText).each(function(){
					list += '<a href="/dd/diary/calendar?userid='
						+ this.userid
						+'">'
						+ '<div class="searchAll">'
						+'<div class="sprite_search_icon"></div>'
						+'<div class="nameFiled">'
						+'<div id="searchRealName">'
						+ this.realname				
						+ '</div>'
						+'<div id="searchNickName">'
						+ this.nickname	
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</a>';
						
				});
				console.log(list);
				$('#searchVal').html(list);
			});
			
		});
		
		// 팔로우 버튼 클릭시
		$('#followBtn').click(function(){
			if($('#followBtn').text() == '팔로우'){
				follow(true);
			}else{
				follow(false);
			}
		});
		
		// 모달에서 팔로우 여부 확인하기
		function followCk(e){
			var re;
			data={followerid:e}
	    	$.ajax({
	    		url: '/dd/follow/check/',
	    		type: 'POST', 
	    		data: data,
	    		async: false,
	    		success: function (result) {
	    			if(result == "follow"){
	    				re = result;
	    			}else{
	    				re = result;
	    			}
	    		}
	    	});
			console.log(re);
			return re;
		}
		
		
		
		
		function follow(check){
			var link = document.location.href;
			data={followerid:'${userInfo.userid}'}
			if(check){
				$.ajax({
		    		url: '/dd/follow/add/',
		    		type: 'POST', 
		    		data: data,
		    		success: function (result) {
		    			if(result == "FollowOk"){
		    				$('#followBtn').text('언팔로우');
		    				location.href = link;
		    			}
		    		}
		    	});
			}else{
				$.ajax({
		    		url: '/dd/follow/delete/',
		    		type: 'POST', 
		    		data: data,
		    		success: function (result) {
		    			if(result == "UnFollowOk"){
		    				$('#followBtn').text('팔로우');
		    				location.href = link;
		    			}
		    		}
		    	});
			}
			
		}
		
		// 모달 닫기 버튼 클릭
		function initModal(modal, arg) {
		    $("." + modal).modal("hide");
		}
				
    });
    
	// 모달에서 버튼 팔로우/팔로워 버튼 클릭시 
	function followModalClick(check, userid, i){
		
		if(check){
			var follow_item_el;
			$.ajax({
	    		url: '/dd/follow/delete/',
	    		type: 'POST', 
	    		data: data,
	    		async: false,
	    		success: function (result) {
	    			if(result == "UnFollowOk"){
	    				location.href = document.location.href;
	    			}
	    		}
	    	});	
		}else{
			$.ajax({
	    		url: '/dd/follow/add/',
	    		type: 'POST', 
	    		data: data,
	    		async: false,
	    		success: function (result) {
	    			if(result == "FollowOk"){
	    				location.href = document.location.href;
	    			}
	    		}
	    	});
		}
	}

	
    </script>
</body>
</html>