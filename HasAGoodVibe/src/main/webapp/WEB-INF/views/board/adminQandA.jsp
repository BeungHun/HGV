<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>타이틀을 적어주세요 !</title>
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
			<jsp:include page="../commons/adminheader.jsp"></jsp:include>
			<div class="row">
				<div class="col mt-4">
					<h1>관리자 Q&A</h1>
				</div>
			</div>
		</div>


		<!--게시판 리스트 -->

		<a href="./adminQandA">처리중인 QnA</a> 
		<a>&nbsp; |&nbsp; </a>
		<a href="./adminQandAComplete">완료된QnA</a>


		<div class="row">

			<div class="col mt-4">
				<div class="row">
					<div class="col-1">번호</div>
					<div class="col-2">작성자</div>
					<div class="col">제목</div>
					<div class="col-2">처리현황</div>
					<div class="col-1">조회</div>
					<div class="col-2">작성일</div>
				</div>
				<div class="row">
					<div class="col">
						<hr class="my-1">
						<h1 class="display-1"></h1>
					</div>
				</div>
				<c:forEach items="${qandADataList}" var="qandAData">
					<c:if test="${empty qandAData.qandACommentVo}">
						<div class="row">
							<div class="col-1">${qandAData.qandABoardVo.qAndABoard_no}</div>
							<div class="col-2">
								<a href="./adminQAndAReadPage?qAndABoard_no=${qandAData.qandABoardVo.qAndABoard_no}">${qandAData.memberVo.member_nick}</a>
							</div>
							<div class="col">
								<a href="./adminQAndAReadPage?qAndABoard_no=${qandAData.qandABoardVo.qAndABoard_no}">${qandAData.qandABoardVo.qAndABoard_title}</a>
							</div>
							<div class="col-2">처리중</div>
							<div class="col-1">${qandAData.qandABoardVo.qAndABoard_readcount}</div>
							<div class="col-2">
							<fmt:formatDate
								value="${qandAData.qandABoardVo.qAndABoard_writedate}"
								pattern="yy년MM월dd일" />
						</div>
						</div>
						<div class="row">
							<div class="col">
								<hr class="my-1">
								<h1 class="display-1"></h1>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

	</div>

	</div>
	<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>

</html>