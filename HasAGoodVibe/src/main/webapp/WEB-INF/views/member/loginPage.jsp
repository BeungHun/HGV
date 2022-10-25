<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title> 타이틀을 적어주세요 ! </title>
    <link rel="stylesheet" type="text/css" href="../resources/css/common.css">
    <!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

     <!-- 외부 css 로드  -->
	<link rel="stylesheet" href="../resources/css/common.css">
     
    <style>
    	.login_box{
    		max-width: 600px;
    	}
    	
    	
    		
    		
    	


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    
    


    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
           	<!-- 로그인 박스 -->
            <div class="row pt-3">
            	<div class="col"></div>
                <div class="col-7 login_box main_content p-3">
                	<!-- 로고 및 타이틀 -->
		           	<div class="row py-3">
                		<div class="col">
                			<i class="bi bi-emoji-laughing"></i>
                			<span> Has a Good Vibes </span>
                		</div>
                	</div>
                	<!-- 배너 이미지 -->
		           	<div class="row py-1">
		           		<div class="col-1"></div>
                		<div class="col d-grid">
                			<img src="../resources/img/HGV_banner.png" width="500px" height="500px">
                		</div>
                	</div>
		           	<!-- 아이디 비밀번호 입력 -->
		           	<form action="./loginProcess" method="post">
	                	<div class="row">
	                		<div class = "col-1 pe-3 fs-3">
	                			<i class="bi bi-person-circle"></i>
	                		</div>
	                		<div class="col ps-3 form-control-lg d-grid">
	                			<input name="member_id" type="text" placeholder="아이디를 입력해주세요.">
	                		</div>
	                	</div>
	                	<div class="row">
	                		<div class = "col-1 pe-3 fs-3">
	                			<i class="bi bi-file-lock"></i>
	                		</div>
	                		<div class="col ps-3 form-control-lg d-grid">
	                			<input name="member_pw" type="password" placeholder="비밀번호를 입력해주세요.">
	                		</div>
	                	</div>
			           	<!-- 로그인 버튼 -->
	                	<div class="row py-2">
	                		<div class="col d-grid">
	                			<button class = "btn btn-primary">로그인</button>
	                		</div>
	                	</div>
		           	</form>
		           	<!-- 회원가입 & 아이디 비밀번호 찾기 -->
                	<div class="row rink_box py-2 text-center text-decoration-none">
                		<div class="col">
                			<a class = "text-secondary" href="./#"> 아이디 찾기 </a>
                		</div>
                		<div class="col">
                			<a class = "text-secondary" href="./#"> 비밀번호 찾기 </a>
                		</div>
                		<div class="col">
                			<a class = "text-secondary" href="./registerPage"> 회원가입 </a>
                		</div>
                	</div>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>

</html>