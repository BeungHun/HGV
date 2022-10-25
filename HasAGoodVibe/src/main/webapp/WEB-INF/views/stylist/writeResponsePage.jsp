<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <div class="col"> 스타일링 응답 쓰기 페이지입니다.
                	<!-- 대충 타이틀 -->
                	<div class="row">
                		<div class="col">
                		</div>
                	</div>
                	<!-- 요청 정보 -->
                	<div class = "row">
                		<div class = "col">
		                	<!-- 스타일리스트 프로필사진//스타일리스트 닉네임/카테고리/태그 -->
		                	<div class="row mb-2 border-bottom">
		                		<div class = "col text-center">
									<c:choose>
		                				<c:when test="${memberVo.member_profileimage_link == null}">
			                				<img id = "mainPageProfileImg" class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
		                				</c:when>
		                				<c:otherwise>
		                					<img id = "mainPageProfileImg" class="img-fluid center-block" src="/uploadFiles/${memberVo.member_profileimage_link}">
		                				</c:otherwise>
		               				</c:choose>
								</div>
								<!-- 요청 사항 파일첨부 -->
		                		<div class="col">
		                			요청사항 파일첨부 추후 구현 예정
		                		</div>
								<div class="col-6">
									<div class="row">
										<div class="col text-center">
											<span> 요청 일자 </span>										
										</div>
										<div class="col text-center">
											<span><fmt:formatDate value="${orderVo.order_date}" pattern="yy.MM.dd"/></span>										
										</div>
									</div>
				                	<!-- 유저 스펙 -->
				                	<div class="row">
				                		<div class = "col-6 text-center">
					                		<img class="img-fluid center-block" src="../resources/img/orderSize.jpg">
										</div>
										<div class="col-6">
											<div class="row">
												<div class="col text-center">
													<span>신장 : </span>
												</div>
												<div class="col text-center">
													<span>${orderVo.order_heigth }</span>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<span>체중 : </span>
												</div>
												<div class="col text-center">
													<span>${orderVo.order_weight }</span>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<span>상의 : </span>
												</div>
												<div class="col text-center">
													<span>${orderVo.order_top }</span>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<span>하의 : </span>
												</div>
												<div class="col text-center">
													<span>${orderVo.order_bottom }</span>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<span>신발 : </span>
												</div>
												<div class="col text-center">
													<span>${orderVo.order_shoes }</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 요청사항 기재 -->
				                	<div class="row">
				                		<div class="col">
			                				<span>요청 내용</span>
				                		</div>
				                	</div>
				                	<div class="row">
				                		<div class="col">
			                				<span>${orderVo.order_content }</span>
				                		</div>
				                	</div>
								</div>
							</div>
                		</div>
                	</div>
                	
                	<!-- 본문 -->
                	<form action="./stylingResponseProcess" method="post">
                		<input type="hidden" name="order_no" value="${orderVo.order_no}">
	                	<div class="row">
	                		<!-- 사진 첨부 및 미리보기 -->
	                		<div class="col">
	                			회신사진 첨부 및 미리보기 (추후구현)
	                		</div>
	                		<!-- 카테고리/내용/링크 -->
	                		<div class="col">
	                			<!-- 카테고리 -->
	                			<div class="row">
	                				<div class="col">
	                					
	                				</div>
	                			</div>
	                			<!-- 본문 내용 -->
	                			<div class="row">
	                				<div class="col">
	                					<div class="form-floating">
										  <textarea name = "styling_content" class="form-control" 
										  			placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
										  <label for="floatingTextarea2">Comment</label>
										</div>
	                				</div>
	                			</div>
	                			<!-- 링크들 -->
	                			<div class="row">
	                				<div class="col">
	                					이거 링크 테이블 별도로 해서
	                					사진이랑 연결해서 같이 저장하게끔 하는게 낫겠지 ?
	                					<div class="form-floating">
										  <textarea name = "" class="form-control" 
										  			placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
										  <label for="floatingTextarea2">Link</label>
										</div>
	                				</div>
	                			</div>
	                		</div>
	                	</div>
	                	<div class="row">
	                		<!-- 공란 -->
		                	<div class="col">
		                	</div>
	                		<!-- 공란 -->
		                	<div class="col">
		                	</div>
	                		<!-- 공란 -->
		                	<div class="col">
		                	</div>
	                		<!-- 이전 -->
		                	<div class="col d-grid">
		                		<a href="./orderDetailPage?order_no=${orderVo.order_no}" class="btn btn-success"> 이전으로 </a>
		                	</div>
	                		<!-- 임시저장 -->
		                	<div class="col d-grid">
		                		<a class="btn btn-success"> 임시저장(추후구현) </a>
		                	</div>
	                		<!-- 송부하기 -->
		                	<div class="col d-grid">
		                		<button class="btn btn-success"> 송부하기 </button>
		                	</div>
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