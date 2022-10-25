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
    		<div class="row">
    			<div class="col">
    			<form action="./insertCategoryProcess" method="get">
    				<div class="row">
    					<div class="col-2"></div>
    					<div class="col border-bottom">
    						<div class="row align-items-center">
    							<div class="col">
    								<a type="button" onclick="location.href='./myBlog?stylist_no=${sessionStylistInfo.stylist_no}'"><i class="bi bi-x-lg fs-4"></i></a>
    							</div>
    							<div class="col-9 fs-5" style="text-align : center">서랍 추가하기</div>
    							
    							<div class="col fs-5" style="text-align : center">
    							
    								<input type="hidden" name="stylist_no" value="${sessionStylistInfo.stylist_no}">
    								<button type="submit" class="btn btn-light">완료</button>
    							</div>
    						</div>
    					</div>
    					<div class="col-2"></div>
    				</div>
    				<div class="row my-2">
    					<div class="col-2"></div>
    					<div class="col ms-3">
    						<h5>서랍 이름</h5>
    					</div>
    					<div class="col-2"></div>
    				</div>
    				<div class="row my-2">
    					<div class="col-2"></div>
    					<div class="col ms-3">
	        				<input type="text" placeholder="서랍 이름을 입력해주세요." name="c_name" style="resize: none; background-color:none;  width:90%; height:40px "> 
	        			</div>
	        			<div class="col-2"></div>
	        		</div>	
	        		<div class="row  my-3">
	        			<div class="col-2"></div>
	        			<div class="col ms-3">
	        				<h5>공개 설정</h5>
	        			</div>
	        			<div class="col-2"></div>
	        		</div>
	        		<div class="row my-3">
	        			<div class="col-2"></div>
	        			<div class="col ms-3">
	        				<div class="row">
	        					<div class="col-10 border-bottom ms-3 ">
	        						나만 보기
	        					</div>
	        					<div class="col">
	        						<input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1" value="" aria-label="..." style="color: black">
	        					</div>
	        					<div class="col-3"></div>
	        				</div>	        				
	        			</div>
	        			<div class="col-2"></div>
	        		</div>
	        		<div class="row my-3">
	        			<div class="col-2"></div>
	        			<div class="col  ms-3">
	        				<div class="row">
	        					<div class="col-10 border-bottom ms-3 ">
	        						친구에게만 공개
	        					</div>
	        					<div class="col">
	        						<input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1" value="" aria-label="..." style="color: black">
	        					</div>
	        					<div class="col-3"></div>
	        				</div>	        				
	        			</div>
	        			<div class="col-2"></div>
	        		</div>
	        		<div class="row my-3">
	        			<div class="col-2"></div>
	        			<div class="col  ms-3">
	        				<div class="row">
	        					<div class="col-10 border-bottom ms-3 ">
	        						전체 공개
	        					</div>
	        					<div class="col">
	        						<input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1" value="" aria-label="..." style="color: black">
	        					</div>
	        					<div class="col-3"></div>
	        				</div>	        				
	        			</div>
	        			<div class="col-2"></div>
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