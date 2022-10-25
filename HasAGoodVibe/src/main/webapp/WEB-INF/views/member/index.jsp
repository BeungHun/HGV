<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title> 타이틀을 적어주세요 ! </title>
    <!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <!-- 외부 css 로드  -->
    <link rel="stylesheet" type="text/css" href="../resources/css/index/indexStyle.css">
    <style>
        body {
            background-image: linear-gradient(
                rgba(0, 0, 0, 0.8),
                rgba(0, 0, 0, 0.8)
                ), url("../resources/img/projectimg(1).png");
            background-size: cover;
        }
 		
    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../resources/js/main.js"></script>

    <!-- 외부 js 로드  -->
    <script>
        
    
    
    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
        	
            <!-- 중앙 글씨 -->
            <div id="myPageContent" class="row" style="padding-bottom: 55em">
                <div class="col"> 
                    <section id="home">
                        <div id="textSlider" class="row">
                            <div class="col-5  iamCol">
                                <p>새로운</p>
                                <p>스타일링의</p>
                                <p>시작</p>
                            </div>
                            <div class="col-7 slideCol">
                                <div class="scroller">
                                    <div class="inner">
                                        <p>더 빛나는</p>
                                        <p>당신을 위하여</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mouse">
                            <div class="scroll"></div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row" >
                <div class="col">
                    <div class="mouse">
                        <div class="scroll"></div>
                    </div>
                </div>
            </div>
            
            <!-- 메인 -->
            <div class="row main_content" style="margin-top: 3em;">
                <div class="col">
                    <div class="row">
                        <div class="col imageBox_full">
                            <img src="../resources/img/index/guide1.PNG">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col imageBox_full">
                            <img src="../resources/img/index/guide2.PNG">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 text-center" style="float: none; margin:0 auto;">
                            <a href="../member/loginPage">이용하기</a>
                        </div>
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