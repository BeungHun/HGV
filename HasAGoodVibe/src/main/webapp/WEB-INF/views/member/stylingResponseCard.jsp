<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
     
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
                <div class="col"> 스타일링 응답 쓰기 페이지입니다.
                	<!-- 대충 타이틀 -->
                	<div class="row">
                		<div class="col">
                		</div>
                	</div>
                	<!-- 본문 -->
                	<div class="row">
                		<!-- 사진 첨부 및 미리보기 -->
                		<div class="col">
                			회신사진 첨부 및 미리보기 (추후구현)
                			<img src="#">
                		</div>
                		<!-- 카테고리/내용/링크 -->
                		<div class="col">
                			<!-- 카테고리 -->
                			<div class="row">
                				<div class="col">
                					<span></span>
                				</div>
                			</div>
                			<!-- 본문 내용 -->
                			<div class="row">
                				<div class="col">
                					<div>
                						<span>${styling_ResponseVo.styling_content }</span>
                					</div>
                				</div>
                			</div>
                			<!-- 링크들 -->
                			<div class="row">
                				<div class="col">
                					<div>
	                					이거 링크 테이블 별도로 해서
    	            					사진이랑 연결해서 같이 저장하게끔 하는게 낫겠지 ?
                						<span></span>
                					</div>
                				</div>
                			</div>
                		</div>
                	</div>
                	<div class="row">
                		<!-- 공란 -->
	                	<div class="col">
	                	</div>
                		<!-- 공란 -->
	                	<div class="col">
	                	</div>
                		<!-- 공란 -->
	                	<div class="col">
	                	</div>
	                	<c:choose>
	                		<c:when test="${orderVo.order_state eq 'answer' && !empty sessionUserInfo}">
	                			<!-- 이전 -->
			                	<div class="col d-grid">
			                		<a href="../user/requestListPage?user_no=${orderVo.user_no}" class="btn btn-success"> 이전으로 </a>
			                	</div>
		                		<!-- 리뷰쓰기 -->
			                	<div class="col d-grid">
			                		<a href="../user/writeReviewPage?order_no=${orderVo.order_no}" class="btn btn-success"> 리뷰쓰기 </a>
			                	</div>
					      	</c:when>
	                		<c:when test="${orderVo.order_state eq 'answer' && !empty sessionStylistInfo}">
		                		<!-- 공란 -->
			                	<div class="col">
			                	</div>
	                			<!-- 이전 -->
			                	<div class="col d-grid">
			                		<a href="./mainPage" class="btn btn-success"> 이전으로 </a>
			                	</div>
					      	</c:when>
					      	<c:when test="${orderVo.order_state eq 'complete'}">
					      		<!-- 이전 -->
			                	<div class="col d-grid">
			                		<a href="./orderDetailPage?order_no=${orderVo.order_no}" class="btn btn-success"> 이전으로 </a>
			                	</div>
          			            <!-- 리뷰보기 -->
			                	<div class="col d-grid">
			                		<a class="btn btn-success"> 리뷰보기 </a>
			                	</div>
					      	</c:when>
					      	<c:otherwise>
					      	  	<h5> 에러 </h5>
					      	</c:otherwise>
				        </c:choose>	
                	</div>
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