<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
	<link rel="stylesheet" href="../resources/css/starRating.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">s
     
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../resources/js/moneyPattern.js"></script>
    <script>



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <div class="col">
                	<!-- 타이틀 -->	
                	<div class="row">
                		<div class="col">
                			리뷰 쓰기 
                		</div>
                	</div>
                	<!-- 스타일리스트 프로필 // 스타일 카테고리/별점 -->	
                	<div class="row">
                		<div class="col">
                			<c:choose>
                				<c:when test="${sessionMemberInfo.member_profileimage_link == null}">
	                				<img alt="" src="../resources/img/noneProfileImg.jpg">
                				</c:when>
                				<c:otherwise>
                					<img src="/uploadFiles/${memberVo.member_profileimage_link}">
                				</c:otherwise>
                			</c:choose>
                		</div>
                		<div class="col">
                			스타일리스트 ${memberVo.member_nick } 님의 
                		</div>
                		<div class="col">
                			(스타일 카테고리) 스타일링은 어떠세요 ??
                		</div>
                	</div>
            		<form action="./writeReviewProcess" id="myform" method = "post" enctype="multipart/form-data">
            			<input name="styling_no" type="hidden" value="${styling_ResponseVo.styling_no }"> 
	                	<!-- 별점 -->	
	                	<div class="row">
	                		<div class="col">
								<fieldset>
									<span class="text-bold">별점을 선택해주세요</span>
									<input type="radio" name="styling_review_starRatring" value="5" id="rate1"><label
										for="rate1">★</label>
									<input type="radio" name="styling_review_starRatring" value="4" id="rate2"><label
										for="rate2">★</label>
									<input type="radio" name="styling_review_starRatring" value="3" id="rate3"><label
										for="rate3">★</label>
									<input type="radio" name="styling_review_starRatring" value="2" id="rate4"><label
										for="rate4">★</label>
									<input type="radio" name="styling_review_starRatring" value="1" id="rate5"><label
										for="rate5">★</label>
								</fieldset>
	                		</div>
	                	</div>
	                	<!-- 본문 -->
	                	<div class="row">
	                		<div class="col">
	                			<div class="col form-floating">
								  <textarea name= "styling_review_content" class="form-control" placeholder="Leave a comment here" id="reviewContents" style="height: 100px"></textarea>
								  <label for="reviewContents"> Review Comment </label>
	                			</div>
	                		</div>
	                	</div>
	                	<!-- 파일첨부 -->
	                	<div class="row">
	                		<div class="col">
	               				<input type="file" name = "files" multiple="multiple" accept="image/*">
               				</div>
            			</div>
		               	<!-- 취소 및 다음 -->
		               	<div class="row">
		               		<!-- 공란 -->
		               		<div class="col-7">
		               		</div>
		               		<div class="col d-grid">
		                		<a class = "btn btn-primary" href="../stylingResponseCard?order_no=${orderVo.order_no}"> 취소 </a>
		               		</div>
		               		<div class="col d-grid">
		                		<button class = "btn btn-primary"> 완료 </button>
		               		</div>
		               	</div>
                	</form>
                </div>
            </div>
        </div>
    </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>