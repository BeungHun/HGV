<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>QandA 상세보기</title>
<!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<!-- 외부 css 로드  -->
 <link rel="stylesheet" type="text/css" href="../resources/css/commons.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/mainPage.css">

<style>
#logo_img {
	height: 100px;
	width: 160px;
	object-fit: cover;
}

a {
	text-decoration-line: none;
}

</style>
<!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
</script>
</head>

<body>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container-fluid">
			<jsp:include page="../commons/header.jsp"></jsp:include>

		</div>
	</div>

	<!--게시판 리스트 -->
	<div>
		
		<div class="row">
			<div class="col-2"></div>
			
			<div class="col">
				<div class="row">
					<div class="col mt-4" >
					<c:if test="${!empty sessionMemberInfo && sessionMemberInfo.member_no == randomBoxdata.memberVo.member_no}">
					<a href="./randomBoxdeleteProcess?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }"><button type="button" class="btn btn-light" >삭제</button></a>
					<a href="./randomBoxUpdateCard?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }"><button type="button" class="btn btn-light" >수정</button></a>
					</c:if>
					</div>
				</div>
				
				<div class="row">
					<div class="col mt-3">
					<c:choose>
             			<c:when test="${randomBoxdata.memberVo.member_profileimage_link == null}">
       						<img class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
              			</c:when>
              			<c:otherwise>
              				
              				<img class="img-fluid center-block" src="/uploadFiles/${randomBoxdata.memberVo.member_profileimage_link}"
              				style="width:28em; height:28em" >
              				
              			</c:otherwise>
             		</c:choose>
					</div>
					<div class="col mt-3" >
					<div class="row">
						<div class="col">
							<h3>${randomBoxdata.randomBoxVo.randomBox_title }</h3>
						</div>
					</div>
					<div class="row">
						<div class="col mb-1">
						 <hr class="my-1">
       				<h1 class="display-1"></h1>
						</div>
					</div>
					<div class="row">
						<div class="col-4">
						<h5>판매자</h5>
						</div>
						<div class="col">
						<i class="bi bi-person"></i> ${randomBoxdata.memberVo.member_nick }
						</div>
					</div>
					<div class="row">
						<div class="col-4">
						<h5>카테고리</h5>
						</div>
						<div class="col">
							${randomBoxdata.randomBoxVo.randomBox_category}
						</div>
					</div>
					
					
					<div class="row">
						<div class="col mb-4">
						 <hr class="my-2">
       				<h1 class="display-1"></h1>
						</div>
					</div>
					<div class="row">
						<div class="col-5 mt-4">
						<h3>판매가격</h3>				
						</div>
						<div class="col mt-4">
						<h5 style="text-align:center; color:red">${randomBoxdata.randomBoxVo.randomBox_price}원</h5>					
						</div>
					</div>
					<div class="row">
						<div class="col-9">
							<a href="./randomBoxStore?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }"><span class="d-grid gap-2"><button type="button" class="btn btn-outline-danger">구매하기</button></span></a>
						</div>
						<div class="col">
							<a href="./randomBoxListTotal"><button type="button" class="btn btn-outline-danger" >목록</button></a>
						</div>
					</div>
					</div>
				</div>
				
				<div class="row">
					 <hr class="my-2">
       					  <h1 class="display-1"></h1>
				</div>
				<div class="row">
					<div class="col" style="min-height: 15em;">${randomBoxdata.randomBoxVo.randomBox_content }</div>
					<input type="hidden" name="randomBox_no" value="${randomBoxdata.randomBoxVo.randomBox_no }">
				</div>
				
				<div class="row"></div>
		
				<div class="row">
					 <hr class="my-1">
	       			 <h1 class="display-1"></h1>
	       			
					<div class="col"><h3>RandomBox Sample</h3></div>
						 <hr class="my-2">
       					  <h1 class="display-1"></h1>
					<div class="row">
						<div class="col" style="text-align:center;">
							<c:forEach items="${randomBoxdata.randomBox_ImgVoList }" var="randomBox_ImgVo">
							<div class="row">
								<div class="col mt-2"><img src="/uploadFiles/${randomBox_ImgVo.randomBox_Img_link }"><br></div>
							</div>
		           			</c:forEach>
						</div>
					</div>
				</div>
			</div>
		
			<div class="col-2"></div>
		</div>
	</div>
	<div class="row">
		<div class="col" style="min-height: 15em;"></div>
	</div>
	

	
	<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>

</html>