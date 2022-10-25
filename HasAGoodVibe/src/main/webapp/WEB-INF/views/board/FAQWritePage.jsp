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
    <!-- 구글 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
     <!-- 외부 css 로드  -->

     
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		.container {
			 display : grid;
		}
		
		a{
			text-decoration-line:none;
		}
		
		hr{
			height:10px;
			background-color:black;
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
		<jsp:include page="../commons/adminheader.jsp"></jsp:include>
	        <!-- 메인 컨텐츠 -->
	        <div class="row">
	        		<div class="col">
	        			<div class="row mt-4">
	        				<div class="col-2"  style="font-family: 'Jua', sans-serif;"><h3>FAQ작성</h3></div>
	        			</div>
	        			<div class="row mt-2">
	        				<div class="col-8">
	        					<hr style="height:2px">
	        				</div>
	        			</div>
	        			<form action="./FAQWriteProcess" method="post">
	        			<div class="row mt-4">
	        				<div class="col-8">
	        					<div class="row">
		        					 <div class="col-2 mt-1">카테고리</div>
		        					 <div class="col-2">
		        					 	<select class="form-select" name="faq_category" style="width:200px">
		        					 	<option selected value="결제">결제</option>
		        					 	<option value="회원">회원</option>
		        						<option value="문의">문의</option>
		        			 			<option value="게시판">게시판</option>
		        						<option value="매칭">매칭</option>
		        				 		<option value="신고">신고</option>
		        						<option value="마이페이지">마이페이지</option>
		        						<option value="일정">일정</option>
		        					 	</select>
		        					</div>
		        				 </div>
		        				<div class="row my-3">
		        					<div class="col-2 mt-2">제목</div>
		        					<div class="col-6">
		        						<input type="text" name="faq_title" style="width:100%" class="my-2"><br>
		        					</div>
	        					</div>
	        					<div class="row">
	        					 &nbsp<br>
	        						<textarea name="faq_content" style="width:100%; height:300px"></textarea><br>
	        					</div>
	        				</div>
	        				
	        			</div>
	        			<div class="row my-4">
	        				<div class="col-6"></div>
	        				<div class="col-1"><input type="submit" class="form-control"></div>
	        				<div class="col-1"><button type="button" class="btn btn-danger"><a href="./FAQPage" style="color:white">취소</a></button></div>
	        			</div>
	        			</form>
	        		</div>
	        	</div>
	        </div>
	     </div>
</body>
</html>