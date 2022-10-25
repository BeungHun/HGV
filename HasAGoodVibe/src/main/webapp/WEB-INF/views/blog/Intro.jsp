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


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid px-4">
    	<jsp:include page="./blogHeader.jsp"></jsp:include>

					<div class="row">
                        <div class="col">
                            <!-- 블로그 만들기 -->
                            <div class="row my-3">
                                <div class="col px-0 bolder">
                                    <!-- 이미지 로우 -->
                                    <div class="row my-2">
                                        <div class="col">
                                            <img class="imgLow img-fluid rounded" src="../resources/img/blogMain1.png">
                                        </div>
                                    </div>
                                    <!-- TITLE 로우 -->
                                    <!-- text-truncate  :: 칸 넘어서는 ... -->
                                    <div class="row my-2">
                                        <div class="col-8 fs-4 fw-bold text-danger text-truncate">
                                            내 관심사를 내 스타일대로 
                                        </div>
                                        
                                    </div>
                                    <!-- 태그내용 -->
                                    <div class="row my-2">
                                        <div class="col fs-6 text-secondary">
                                            독특하고 멋진 블로그를 간단히 만들어보세요.
                                        </div>
                                    </div>
                                    
                                    <!-- 버튼 -->
                                    <div class="row my-2">
                                        <div class="col d-grid">
                                            <a href="createCategory" class="btn btn-outline-primary">블로그 만들기</a>
                                        </div>
                                    </div>

				<jsp:include page="./blogBottom.jsp"></jsp:include>
		    </div>
		   </div>
   
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>
