<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title> QandA글쓰기 페이지 </title>
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
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="col">
	        			<div class="row my-4">
	        				<div class="col-2"  style="font-family: 'Jua', sans-serif;"><h2>게시글 작성</h2></div>
	        			</div>
	        			<div class="row my-2">
	        				<div class="col-8">
	        					<hr style="height:2px; width:100%">
	        				</div>
	        			</div>
	        			<form action="./qAndAWriteProcess" method="post" enctype="multipart/form-data">
	        			<div class="row mt-4">
	        				<div class="col-8">
	        					
		        				<div class="row my-3"  style="text-align:center">
		        					<div class="col-2 mt-2">제목</div>
		        					<div class="col-6">
		        						<input type="text" name="qAndABoard_title" style="width:100%" class="my-2"><br>
		        					</div>
	        					</div>
	        					<div class="row">
	        					<br>
	        						<textarea name="qAndABoard_content" style="width:100%; height:300px"></textarea><br>
	        						
	        					</div>
	        					
	        				</div>
	        			</div>
	        			
	        			<div class="row my-4">
	        				<div class="col-6"></div>
	        				<div class="col-1"><input type="submit" class="form-control"></div>
	        				<div class="col-1"><button type="button" class="btn btn-danger"><a href="./qAnda" style="color:white">취소</a></button></div>
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