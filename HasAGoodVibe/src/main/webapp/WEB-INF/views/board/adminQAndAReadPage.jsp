<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

			<div class="row">
				<div class="col">여기는 관리자용 Q&A 입니다.</div>

			</div>
		</div>
	</div>

	<!--게시판 리스트 -->
	<div>
		
		<div class="row">
			<div class="col-3"></div>
			
			<div class="col-5">
				<div class="row">
					<div class="col mt-4" ><h1>${data.qandABoardVo.qAndABoard_title}</h1></div>
				</div>
				<div class="row">
					<div class="col"><h3><i class="bi bi-person"></i> ${data.memberVo.member_nick}</h3></div>
					<div class="col" style="text-align:right;"><fmt:formatDate value="${data.qandABoardVo.qAndABoard_writedate }" pattern="yy년MM월dd일"/> 조회수 ${data.qandABoardVo.qAndABoard_readcount}</div>
				</div>
				
				<div class="row">
					 <hr class="my-2">
       					  <h1 class="display-1"></h1>
				</div>
				<div class="row">
					<div class="col" style="min-height: 15em;">${data.qandABoardVo.qAndABoard_content}</div>
				
				<div class="row">
					<div class="col">
       					  <hr class="my-1">
       					  <h1 class="display-1"></h1>
					  	<form action="../comment/WriteCommentProcess?qAndABoard_no=${data.qandABoardVo.qAndABoard_no }" method="post">
    					<textarea name="qAndAComment_content"></textarea>
    
							<c:if test="${!empty adminInfo }">
    						<button type="submit">댓글쓰기</button>
  							</c:if>
  						</form>
					</div>
				</div>
				
				
				</div>
				
				<div class="row"></div>
		
				<div class="row">
				
       			 <hr class="my-1">
       					 <h1 class="display-1"></h1>
					<div class="col"><h3>댓글</h3></div>
						 <hr class="my-2">
       					  <h1 class="display-1"></h1>
				<div class="row">
					<div class="col">
				<c:forEach items="${commentDataList }" var="commentData">
					<c:if test="${data.qandABoardVo.qAndABoard_no == commentData.qandAcommentVo.qAndABoard_no }">
						<div class="row">
							<div class="col"><h4><i class="bi bi-person"></i> ${commentData.adminVo.admin_nick }</h4></div>
							<div class="col" style="text-align:right;"><fmt:formatDate value="${commentData.qandAcommentVo.qAndAComment_writedate }" pattern="yy년MM월dd일"/></div>
						</div>
						<div class="row">
							<div class="col">${commentData.qandAcommentVo.qAndAComment_content }</div>
						</div>
						 
					</c:if>
				</c:forEach>
				</div>
				</div>
				</div>
			</div>
		
			<div class="col-2"></div>
		</div>
	</div>

	<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>

</html>