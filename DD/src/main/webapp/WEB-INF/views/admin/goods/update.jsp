<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../resources/css/shop/reset.css">
<link rel="stylesheet" href="../../resources/css/admin/main.css">
<script src="../../resources/js/shop/jquery.min.js"></script>
<script src="../../resources/js/shop/shop.js" defer></script>
<script src="../../resources/ckeditor/ckeditor.js"></script>

</head>
<body>

	<div id="wrap">
	
		<%@ include file="../include/header.jsp" %>
	
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div>
		</nav>
		
		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
			<div id="container_box">
				<h2>상품 수정</h2>
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<input type="hidden" name="productId" value="${product.productId}">
				
					<div class="inputArea">
						<label>1차 분류</label>
						<select class="category1">
							 <option value="">전체</option>
						</select>		
						 
						<label>2차 분류</label>
						<select class="category2" name="cateCode">
							 <option value="">전체</option>
						 </select>				
					</div> 
					<div class="inputArea">
						<label for="productName">상품명</label>
						<input type="text" id="productName" name="productName" value="${product.productName}" />
					</div>
					
					<div class="inputArea">
						<label for="productPrice">상품가격</label>
						<input type="text" id="productPrice" name="productPrice" value="${product.productPrice}" />
					</div>
				
					<div class="inputArea">
						<label for="productDesc">상품소개</label>
						<textarea rows="5" cols="50" id="productDesc" name="productDesc" >${product.productDesc}</textarea>
						<script>
							 var ckeditor_config = {
								 resize_enaleb : false,
								 enterMode : CKEDITOR.ENTER_BR,
								 shiftEnterMode : CKEDITOR.ENTER_P,
								 filebrowserUploadUrl : "./ckUpload"
							 };
						 
							CKEDITOR.replace("productDesc", ckeditor_config);
						</script>
					</div>
					
					<div class="inputArea">
						 <label for="productImg">이미지</label>
						 <input type="file" id="productImg" name="file" />
						 <div class="select_img">
							 <img src="${pageContext.request.contextPath}/${product.productImg}" />
							 <input type="hidden" name="productImg" value="${product.productImg}">
							 <input type="hidden" name="productThumbImg" value="${product.productThumbImg}">
						 </div>
						 
						 <!-- 현재 프로젝트의 실제 경로 -->
						 <%=request.getRealPath("/") %>		 		
					</div>
					
					<div class="inputArea">
						<button type="submit" id="update_Btn">완료</button>
						<button type="button" id="back_Btn">취소</button>
					</div>
					
					</form>
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

	
		$("#back_Btn").click(function () {
			location.href = "./detail?n=" +${product.productId};
		});
		
		
		$("#productImg").change(function(){
			if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			    	$(".select_img img").attr("src", data.target.result).width(500);        
				}
 					reader.readAsDataURL(this.files[0]);
			}
		});		
		
		var regExp = /[^0-9]/gi;
		
		$("#productPrice").keyup(function(){ numCheck($(this)); });
	
		function numCheck(selector) {
			var tempVal = selector.val();
			selector.val(tempVal.replace(regExp, ""));
		}
		
		// 컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);
	
		var cate1Arr = new Array();
		var cate1Obj = new Object();
	
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		 
			if(jsonData[i].cateNum == "1") {
				cate1Obj = new Object();  //초기화
				cate1Obj.cateCode = jsonData[i].cateCode;
				cate1Obj.cateName = jsonData[i].cateName;
				cate1Arr.push(cate1Obj);
			}
		}
	
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")
	
		for(var i = 0; i < cate1Arr.length; i++) {
		 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
		      + cate1Arr[i].cateName + "</option>"); 
		}
		
	
		$("#productImg").change(function(){
			if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			    	$(".select_img img").attr("src", data.target.result).width(500);        
				}
 					reader.readAsDataURL(this.files[0]);
			}
			
			
		});
				
		$(document).on("change", "select.category1", function(){

			 var cate2Arr = new Array();
			 var cate2Obj = new Object();
			 
			 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			 for(var i = 0; i < jsonData.length; i++) {
			  
				 if(jsonData[i].cateNum == "2") {
					 cate2Obj = new Object();  //초기화
					 cate2Obj.cateCode = jsonData[i].cateCode;
					 cate2Obj.cateName = jsonData[i].cateName;
					 cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			   
					 cate2Arr.push(cate2Obj);
			 		}		
			 }
			 
			 var cate2Select = $("select.category2");

			 cate2Select.children().remove();

			 $("option:selected", this).each(function(){
			  
				  var selectVal = $(this).val();  
				  cate2Select.append("<option value='" + selectVal + "'>전체</option>");
				 
			  
				  for(var i = 0; i < cate2Arr.length; i++) {
					  if(selectVal == cate2Arr[i].cateCodeRef) {
						  cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
				         + cate2Arr[i].cateName + "</option>");
					 }
				 }
			  
			 });	 
		});
		
		var select_cateCode = '${product.cateCode}';
		var select_cateCodeRef = '${product.cateCodeRef}';
		var select_cateName = '${product.cateName}';
		console.log("select_cateCode = " + select_cateCode);
		console.log("select_cateCodeRef = " + select_cateCodeRef);
		if(select_cateCodeRef != null && select_cateCodeRef != "") {
			
			console.log("값이 없으면");
			
			$(".category1").val(select_cateCodeRef);
			$(".category2").val(select_cateCode);
			$(".category2").children().remove();
			$(".category2").append("<option value='"
									+ select_cateCode + "'>" + select_cateName + "</option>");
			
			
		} else {
			
			console.log("값이 있으면");
			
			$(".category1").val(select_cateCode);
			//$(".category2").val(select_cateCode);
			$(".category2").append("<option value='"
					+ select_cateCode + "' selected='selected'>전체</option>");
		}
		
	</script>
</body>
</html>