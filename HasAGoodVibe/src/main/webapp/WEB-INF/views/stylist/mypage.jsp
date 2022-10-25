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
    <script src="../resources/js/moneyPattern.js"></script>
    <script>
	 	function completeUpdateProfileImg() {
	 		updateImgFrm.submit();
		}
	 
    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <jsp:include page="../commons/stylistMyPageSideNav.jsp"></jsp:include>
                <div class="col-8">여기는 스타일리스트 마이페이지 입니다.
                	<div class="row">
                		<!-- 프로필 사진 -->
                		<div id = "memberPofileImg" class="col d-grid">
                			<c:choose>
                				<c:when test="${sessionMemberInfo.member_profileimage_link == null}">
	                				<img alt="" src="../resources/img/noneProfileImg.jpg">
                				</c:when>
                				<c:otherwise>
                					<img alt="" src="/uploadFiles/${sessionMemberInfo.member_profileimage_link}">
                				</c:otherwise>
                			</c:choose>
                			<c:choose>
                				<c:when test="${updateProfileImg==true}">
		                			<form id= "updateImgFrm" action="../member/updateProfileImg" method = "post" enctype="multipart/form-data"> 
		                				<input type="file" name = "file" accept="image/*"><br>
			                			<a class="btn btn-success" href="../member/cancelUpdateProfileImg"> 수정 취소</a> 
			                			<a class="btn btn-success" onclick="completeUpdateProfileImg()"> 수정 완료 </a>
		                			</form>
                				</c:when>
                				<c:otherwise>
		                			<a class="btn btn-success" href="../member/updateProfileImgButton"> 수정 </a>
                				</c:otherwise>
                			</c:choose>
                		</div>
                		<!-- 마이페이지 메인 --> 
                		<div class="col">
	                		<!-- 고객 인사 -->
                			<div class="row">
                				<!-- 회원 닉네임 -->
                				<div class="col">
                					<span> ${sessionMemberInfo.member_nick } 님 안녕하세요. </span>
                				</div>
                			</div>
                			<div class="row">
                				<!-- 방문 기록 안내  -->
                				<div class="col">
                					<span> 몇 번째 홈페이지 방문입니다. 다시 찾아주셔서 감사합니다. </span>
                				</div>
                			</div>
                			<div class="row">
                				<!-- TEST :: 적립금 확인 -->
                				<div class="col">
                					<span> TEST :: 적립금 : </span><span class="money">${sessionMemberInfo.member_cash }</span>
                				</div>
                			</div>
                		</div>
                	</div>
                	<!-- 회원 정보 정리 및 한눈에 보기 -->
                	<div class="row">
                		<!-- 새로운 요청 -->
                		<div class="col">
							<div class="row">
								<!-- 아이콘 -->
								<div class="col">
									<i class="bi bi-check-circle"></i>
									<br>
									<span>새로운 요청</span>
								</div>
							</div>                			
							<div class="row">
								<!-- 현황 -->
								<div class="col">
									<a><span>OO</span> <span>건</span></a>
								</div>
							</div>                			
                		</div>
                	</div>
                </div>
                
                <!-- 광고 영역 -->
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