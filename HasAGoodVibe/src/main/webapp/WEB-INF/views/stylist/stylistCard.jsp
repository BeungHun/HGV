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
                <div class="col-8">여기는 스타일리스트 카드 작성/수정 페이지 입니다.
                	<!-- 타이틀 -->
                	<div class="row">
                		<div class="col">
	                		스타일리스트 카드 작성
                		</div>
                	</div>
            		<form action="./stylistCardCreateProcess" method = "post"> 
                	<!-- 스타일리스트 카드 -->
                	<div class="row">
                		<div class="col">
	                		<div class="row">
	                			<div class="col">
	                				<h4> 스타일 카테고리 선택 </h4>
	                				<c:forEach items="${categoryList}" var="cList">
	                					<input name="card_category_nos" type="checkbox" 
	                						value="${cList.card_category_no}">${cList.card_category_name }
	                				</c:forEach>
	                			</div>
	                		</div> 
	                		<!-- 카드 태그 선택 -->
	                		<div class="row">
	                			<div class="col">
	                				<!-- AJAX로 #처리해서 등록되도록 처리하는거 작업해야함 -->
	                			</div>
	                		</div>
	                		<!-- 한 줄 소개 -->
	                		<div class="row">
	                			<div class="col d-grid">
	                				<input name="stylist_card_subtitle" type="text" placeholder="자신을 한 줄로 표현해주세요 !">
	                			</div>
	                		</div>
	                		<!-- 프로필 사진 및 일일 요청횟수 & 요청 금액 -->
	                		<div class="row">
	                			<!-- 프로필 사진 -->
	                			<div class="col">
	                				<c:choose>
		                				<c:when test="${sessionMemberInfo.member_profileimage_link == null}">
			                				<img alt="" src="../resources/img/noneProfileImg.jpg">
		                				</c:when>
		                				<c:otherwise>
		                					<img alt="" src="/uploadFiles/${sessionMemberInfo.member_profileimage_link}">
		                				</c:otherwise>
		                			</c:choose>
	                			</div>
	                			<!-- 요청횟수 & 요청금액 -->
	                			<div class="col">
	                				<div class="row" >
	                					<div class="col d-grid">
	                						<span class = "text-center input-group-text"> 일일 요청 횟수 </span>
	                						<span class = "text-center input-group-text"> 일회 요청 가격 </span>
	                					</div>
	                					<div class="col d-grid">
	                						<input name="stylist_card_onedaycount" type="text">
	                						<input name="stylist_card_price" type="text" >
	                					</div>
	                				</div>
	                			</div>
	                		</div>
	                		<!-- 소개글 -->
	                		<div class="row">
	                			<div class="col form-floating">
								  <textarea name= "stylist_card_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
								  <label for="floatingTextarea2"> Information Comment </label>
	                			</div>
	                		</div>
                		</div>
                	</div>
                	<!-- 취소 및 다음 -->
                	<div class="row">
                		<!-- 공란 -->
                		<div class="col-7">
                		</div>
                		<div class="col d-grid">
	                		<a class = "btn btn-primary" href="./mypage"> 취소 </a>
                		</div>
                		<div class="col d-grid">
	                		<button class = "btn btn-primary"> 다음 </button>
                		</div>
                	</div>
                	</form>
                </div>
                <!-- ad 영역 -->
                <div class="col">ad 영역 ..?
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