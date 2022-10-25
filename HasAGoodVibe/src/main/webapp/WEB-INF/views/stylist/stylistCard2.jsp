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
    <script>
    
		//답정너 - 가져가 붙이면됨..
		function templeteAjax(){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				}
			}
			
			xhr.open("get" , "../testapi/test5"); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
			
		}

    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <jsp:include page="../commons/stylistMyPageSideNav.jsp"></jsp:include>
                <div class="col-8">여기는 스타일리스트 카드 작성/수정 상세페이지의 파일 첨부페이지 입니다.
                	<!-- 타이틀 -->
            		<form action="./CategoryRelateFile" method = "post" enctype="multipart/form-data"> 
	               		<!-- 스타일 카테고리별 사진 업로드 -->
	               		<div class="row">
              				<c:forEach items="${categoryList }" var="list">
	                			<div class="col-3">
	               					<span class = "text-center input-group-text"> ${list.cardCategoryVo.card_category_name} </span>
	                			</div>
	                			<div class="col-9">
	                				<input type="file" name = "files${list.cardCategoryVo.card_category_no}" multiple="multiple" accept="image/*">
	                				<input type="hidden" name = "card_category_relation_nos" value = "${list.cardCategoryRelationVo.card_category_relation_no}">
	                			</div>
              				</c:forEach>
	               		</div>
	                	<!-- 취소 및 다음 -->
	                	<div class="row">
	                		<!-- 공란 -->
	                		<div class="col-7">
	                		</div>
	                		<div class="col d-grid">
		                		<a class = "btn btn-primary" href="./stylistCard"> 취소 </a>
	                		</div>
	                		<div class="col d-grid">
		                		<button class = "btn btn-primary"> 다음 </button>
	                		</div>
	                	</div>
                	</form>
                	</div>
                </div>
                <!-- ad 영역 -->
                <div class="col">ad 영역 ..?
                </div>
            </div>
           </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>