<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
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
    <link rel="stylesheet" type="text/css" href="../resources/css/commons.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/mainPage.css">
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		body {
          background-image: linear-gradient(
              rgba(0, 0, 0, 0.8),
              rgba(0, 0, 0, 0.8)
              ), url("../resources/img/projectimg(1).png");
          background-size: cover;
          color: #fff;
 
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
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            
            <!-- 배너 -->
            <div class="row">
                <div class="col">
            </div>
             <form action="./randomBoxUpdateCardProcess" method="post" enctype="multipart/form-data">
            <div class="row">
            	<div class="col">
            	<h1>카드수정</h1>
            	<div class="row">
              		<div class="col-3">
              			<select name="randomBox_category"  class="form-control">
        					<option>카테고리를 선택해주세요</option>
        					<option value="Dandy">댄디</option>
        					<option value="Amekaji">아메카지</option>
        					<option value="Minimal">미니멀</option>
        					<option value="Casual">캐주얼</option>
        					<option value="Hiphop">힙합</option><br>
        				</select>    	
              		</div>
            	</div>
            	<div class="row">
            		<div class="col mt-3">
            			<input name="randomBox_price" type="text" value="${randomBoxUpDateData.randomBoxVo.randomBox_price}"> 원<br>
            		</div>
 
            	</div>
     	        <div class="row">
            		<div class="col mt-3">
            			<input name="randomBox_title" type="text" value="${randomBoxUpDateData.randomBoxVo.randomBox_title}" style="width:40%"><br>
            		</div>
            	</div>
            	
            	<div class="row">
            		<div class="col mt-3">
            			<textarea name="randomBox_content" style="width:100%; height:300px">${randomBoxUpDateData.randomBoxVo.randomBox_content}</textarea><br>
            			<input type="hidden" name="randomBox_no" value="${randomBoxUpDateData.randomBoxVo.randomBox_no }">
            		</div>
            	</div>
            	
            	<div class="row">
            		<div class="col mt-3">
            		<input type="file" name="randomBox_Img_no" multiple><br>
            		</div>
            		<div class="col mt-3">
            			<button type="submit">수정</button>
            			<button><a href="./randomBoxListTotal">이전</a></button>            			
            		</div>
            	</div>
            	
            </div>
            
            <!-- 슬라이드 -->
            <div class="row">
                <div class="col">
                </div>
            </div>
            
            <!-- 밑단 -->
            <div class="row" style="background-color:black">
                <div class="col">
                </div>
            </div>
            
        </div>
        </form>
    </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>