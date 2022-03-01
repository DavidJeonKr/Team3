<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
	<title>DD</title>
	<link rel="stylesheet" href="../resources/css/photo/new_post.css">
    <link rel="stylesheet" href="../resources/css/photo/common.css">
	<link>
	</head>
<body>

	<%@ include file="../include/mainMenuHeader.jsp"%>
	
    <!-- 사진 업로드 화면 -->
    
    <div id="main_container">
            <div class="post_form_container">
            <form class="post_form" method="post" enctype="multipart/form-data" autocomplete="off">
                <div class="title">
                    NEW POST
                </div>
                
                <div class="preview">
                    <div class="upload">
                        	
                            <!-- TODO 이미지 추가 javascript 추가하기 -->
                            <!--  <p style="text-align: center;">포스트 이미지 추가</p> -->
                            <div class="select_img"><img src="" style="max-width: 300px; max-height: 300px;" /></div>
                    </div>
                </div>
                <p>
                   <input type="file" name="file" id="file_id" required="required">
                </p>
                <!-- userid 세션으로 받아서 수정 -->
               <!--   <input type="text" name="userid" id="userid" value="${userInfo.userid}"> -->
                <div class="content_container">
                    <textarea name="content" id="content_id" rows="5" cols="40"></textarea>
                </div>

                <input class="submit_btn" type="submit" value="저장">
            <div>
			</div>
            </form>
        </div>
    </div>
	<script	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $("#file_id").change(function(){
        	   if(this.files && this.files[0]) {
        	    var reader = new FileReader;
        	    reader.onload = function(data) {
        	     $(".select_img img").attr("src", data.target.result).width(500);        
        	    }
        	    reader.readAsDataURL(this.files[0]);
        	   }
          });
    </script>

</body>
</html>