<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title> 타이틀을 적어주세요 ! </title>
    <!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

     <!-- 외부 css 로드  -->

     
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		
		.box{
			width:100%; 
			height:700px; 
			border:#c5ced7; 
			border-radius: 30px; 
			background-color:#f8f9fa; 
		}
			
		

    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid px-4">
    	<div class="row">
    	<form action="../member/writeProcess" method="post">
    		<div class="col">
    			<div class="row">
    				<div class="col border-bottom">
    					<div class="row align-items-center">
    						<div id="logo image" class="col-1 container"><!-- 이미지 -->
    							<a href="./myBlog?stylist_no=${stylistInfo.stylist_no }"><img id="door_img" alt="" width="40" src="../resources/img/door_black.png"></a>
    						</div>
    						<div class="col"><!-- 카테고리 -->
    							<select name="c_no"  class="form-control" style="text-align : center;">
				        			<c:forEach items="${categoryList }" var="data">
					        			<option value="${data.categoryVo.c_no }">${data.categoryVo.c_name }</option>
				        			</c:forEach>
		        				</select>
    						</div> 
    						<div class="col-7 border-end"></div><!--  공백  -->
    						<div class="col "><!--  임시저장버튼  -->
    							<button type="button" class="btn btn-outline-dark">임시저장</button>
    						</div>
    						<div class="col"><!--  기록하기버튼  -->
    						<c:if test="${!empty sessionStylistInfo }">
						  		<input type="hidden" name="stylist_no" value="${stylistInfo.stylist_no }">
						  		<%-- <input type="hidden" name="c_no" value="${category.c_no }"> --%>
								<button type="submit" class="btn btn-primary">기록하기</button>
							</c:if>
    						</div>
	    				</div>
	    			</div>
	    			
	    		</div>
	    		<div class="row">
	    			<div class="col border-bottom">
	    				<div class="row " style="text-align : center;">
	    					<div class="col"><!-- 글꼴 --><i class="bi bi-fonts"></i></div>
	    					<div class="col"><!-- 형광펜 --><i class="bi bi-pen"></i></div>
	    					<div class="col"><!-- 인용구 --><i class="bi bi-quote"></i></div>
	    					<div class="col"><!-- 템플릿 --><i class="bi bi-layout-wtf"></i></div>
	    					<div class="col"><!-- 구분선 --><i class="bi bi-border-width"></i></div>
	    					<div class="col"><!-- 사진 --><i class="bi bi-image"></i></div>
	    					<div class="col"><!-- 링크 --><i class="bi bi-link-45deg"></i></div>
	    					<div class="col-3"><!-- 공백 --></div>
	    					<div class="col"><!-- 실행취소 --><i class="bi bi-arrow-90deg-left"></i></div>
	    					<div class="col"><!-- 재실행 --><i class="bi bi-arrow-90deg-right"></i></div>
	    				</div>
	    				<div class="row" style="text-align : center;">
	    					<div class="col">글꼴</div>
	    					<div class="col">형광펜</div>
	    					<div class="col">인용구</div>
	    					<div class="col">템플릿</div>
	    					<div class="col">구분선</div>
	    					<div class="col">사진</div>
	    					<div class="col">링크</div>
	    					<div class="col-3"></div>
	    					<div class="col">실행취소</div>
	    					<div class="col">재실행</div>
	    				</div>
	    			</div>
	    		</div>
    			<div class="row"> <!-- text area  -->
    				<div class="col" style="background-color:#f8f9fa ">
    					
    					<div class="row">
	    					<div class="col-2"></div><!-- 여백 -->
	    					<div class="col my-5 border"><!-- 텍스트박스 --> 
	    						<div class="row">
	    							<div class="col ms-4">
	    								<input type="text" placeholder="제목을 입력해주세요." name="blog_title" style="resize: none; background-color:#f8f9fa; border: none; width:100%; height:80px; ">
	    								<hr width="97%" color="#c5ced7">
	    							</div>
	    						</div>
	    						<div class="row">
	    							<div class="col ms-4">
	    								<textarea name="blog_content" placeholder="내용을 입력해주세요." style="resize: none; background-color:#f8f9fa; border: none; width:100%; height:700px; "></textarea>
	    							</div>
	    						</div>
	    					</div>
	    					<div class="col-2"></div><!-- 여백 -->
	    				</div>
    				</div>
    			</div>
    			</div>
    			</form>
    		</div>
    	</div>
    </div>
   
   
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>