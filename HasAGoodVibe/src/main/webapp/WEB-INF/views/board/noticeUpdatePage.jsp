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
	        			<div class="row my-4">
	        				<div class="col-2"  style="font-family: 'Jua', sans-serif;"><h2>게시글 작성</h2></div>
	        			</div>
	        			<div class="row my-2">
	        				<div class="col-8">
	        					<hr style="height:2px; width:100%">
	        				</div>
	        			</div>
	        			<form action="./noticeUpdateProcess" method="post">
	        			<div class="row mt-4">
	        				<div class="col-8">
	        					<div class="row">
		        					 <div class="col-2 mt-1" style="text-align:center">카테고리</div>
		        					 <div class="col-2">
		        					 	<select class="form-select" name="notice_category" style="width:200px">
		        					 	<option selected value="Notice">공지사항</option>
		        					 	<option value="Event">이벤트</option>
		        						<option value="CustomerCenter">고객센터</option>
		        					 	</select>
		        					</div>
		        					<div class="row my-3"  style="text-align:center">
			        					<div class="col-2 mt-2">제목</div>
			        					<div class="col-6">
			        						<input type="text" name="notice_title" style="width:100%" class="my-2" value="${noticeVo.notice_title }"><br>
			        					</div>
	        						</div>
	        						<div class="row">
		        					 &nbsp<br>
		        						<textarea name="notice_content" style="width:100%; height:300px">${noticeVo.notice_content }</textarea><br>
		        						<input type="file" name="notice_files" multiple accept="image/*" class="mt-3">
		        						<input type="hidden" name="notice_no" value="${noticeVo.notice_no }">
		        					</div>
	        					
	        				</div>
	        				
	        			</div>
	        			<div class="row my-4">
	        				<div class="col-6"></div>
	        				<div class="col-1"><input type="submit" class="form-control"></div>
	        				<div class="col-1"><button type="button" class="btn btn-danger"><a href="./notice" style="color:white">취소</a></button></div>
	        			</div>
	        			</form>
	        		</div>
	        	</div>
	        </div>
	     </div>
</body>
</html>