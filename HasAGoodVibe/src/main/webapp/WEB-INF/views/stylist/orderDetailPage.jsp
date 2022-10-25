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
		
		#mainPageProfileImg{
			height: 300px;
            width: 200px;
            object-fit: cover;  
            margin: auto 0;        
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
                <div class="col">
                	<!-- 누구에게 어떤 카테고리의 스타일을 요청하는지 확인 문구 -->
                	<div class="row">
                		<div class="col">
                			<h4>"${memberVo.member_nick}" 님으로부터 </h4>
                			<h4>"스타일 카테고리" 의 스타일링을 요청 받았습니다 !</h4>
                		</div>
                	</div>
                	<!-- 스타일리스트 프로필사진//스타일리스트 닉네임/카테고리/태그 -->
                	<div class="row">
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
						<div class="col-6">
							<div class="row">
								<div class="col text-center">
									<h5> 현재 상태 </h5>										
								</div>
								<div class="col text-center">
									 <c:choose>
								      	<c:when test="${orderVo.order_state eq 'order'}">
									      	<h5> 요청 </h5>
								      	</c:when>
								      	<c:when test="${orderVo.order_state eq 'reject'}">
									      	<h5> 반려 </h5>
								      	</c:when>
								      	<c:when test="${orderVo.order_state eq 'accept'}">
									      	<h5> 진행중 </h5>
								      	</c:when>
								      	<c:when test="${orderVo.order_state eq 'answer'}">
									      	<h5> 스타일링 완료 </h5>
								      	</c:when>
								      	<c:when test="${orderVo.order_state eq 'complete'}">
									      	<h5> 리뷰 완료 </h5>
								      	</c:when>
								      	<c:otherwise>
								      	  	<h5> 에러 </h5>
								      	</c:otherwise>
								      </c:choose>										
								</div>
							</div>
							<div class="row">
								<div class="col text-center">
									<span> 요청 일자 </span>										
								</div>
								<div class="col text-center">
									<span><fmt:formatDate value="${orderVo.order_date}" pattern="yy.MM.dd"/></span>										
								</div>
							</div>
							<div class="row">
								<div class="col text-center">
									<span> 요청 비용 </span>										
								</div>
								<div class="col text-center">
									<span class="money">${orderVo.order_saleprice }</span>										
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
					<!-- 요청 사항 파일첨부 -->
                	<div class="row">
                		<div class="col">
                			요청사항 파일첨부 추후 구현 예정
                		</div>
                	</div>
					<!-- 취소/완료 버튼 -->
                	<div class="row">
                		<!-- 공란 -->
                		<div class="col-6">
                		</div>
                		<c:choose>
					      	<c:when test="${orderVo.order_state eq 'order'}">
					      		<!-- 뒤로가기 -->
		                		<div class="col d-grid">
		                			<a href="./receivedRequestList?stylist_no=${sessionStylistInfo.stylist_no}" class="btn btn-success"> 뒤로가기 </a>
		                		</div>
						      	<!-- 반려 -->
		               			<div class="col">
		               				<form action="./orderRejectProcess" method="post">
		               					<div class="d-grid">
				                			<input type="hidden" name="order_no" value="${orderVo.order_no }">
				                			<button class="btn btn-success"> 거절하기 </button>
		               					</div>
		               				</form>
		               			</div>
		                		<!-- 수락 -->
		               			<div class="col">
		               				<form action="./orderAcceptProcess" method="post">
		               					<div class="d-grid">
				                			<input type="hidden" name="order_no" value="${orderVo.order_no }">
				                			<button class="btn btn-success"> 수락하기 </button>
		               					</div>
		               				</form>
		               			</div>
					      	</c:when>
					      	<c:when test="${orderVo.order_state eq 'reject'}">
						      	<!-- 공란 -->
		                		<div class="col">
		                		</div>
						      	<!-- 공란 -->
		                		<div class="col">
		                		</div>
						      	<!-- 뒤로가기 -->
		                		<div class="col d-grid">
		                			<a href="./receivedRequestList?stylist_no=${sessionStylistInfo.stylist_no}" class="btn btn-success"> 뒤로가기 </a>
		                		</div>
					      	</c:when>
					      	<c:when test="${orderVo.order_state eq 'accept'}">
					      		<!-- 공란 -->
		                		<div class="col">
		                		</div>
						      	<!-- 뒤로가기 -->
		                		<div class="col d-grid">
		                			<a href="./receivedRequestList?stylist_no=${sessionStylistInfo.stylist_no}" class="btn btn-success"> 뒤로가기 </a>
		                		</div>
		                		<!-- 스타일링 보내기 -->
		               			<div class="col">
		               				<form action="./writeResponsePage?order_no=${orderVo.order_no}">
		               					<div class="d-grid">
				                			<input type="hidden" name="order_no" value="${orderVo.order_no }">
				                			<button class="btn btn-success"> 회신 카드쓰기 </button>
		               					</div>
		               				</form>
		               			</div>
					      	</c:when>
					      	<c:when test="${orderVo.order_state eq 'answer'}">
						      	<!-- 공란 -->
		                		<div class="col">
		                		</div>
						      	<!-- 뒤로가기 -->
		                		<div class="col d-grid">
		                			<a href="./receivedRequestList?stylist_no=${sessionStylistInfo.stylist_no}" class="btn btn-success"> 뒤로가기 </a>
		                		</div>
		                		<!-- 보낸 스타일링 -->
		               			<div class="col">
		               				<form>
		               					<div class="d-grid">
				                			<input type="hidden" name="order_no" value="${orderVo.order_no }">
				                			<button class="btn btn-success"> 보낸답변 </button>
		               					</div>
		               				</form>
		               			</div>
					      	</c:when>
					      	<c:when test="${orderVo.order_state eq 'complete'}">
						      	<!-- 공란 -->
		                		<div class="col">
		                		</div>
						      	<!-- 뒤로가기 -->
		                		<div class="col d-grid">
		                			<a href="./receivedRequestList?stylist_no=${sessionStylistInfo.stylist_no}" class="btn btn-success"> 뒤로가기 </a>
		                		</div>
		                		<!-- 리뷰보러가기 -->
		               			<div class="col">
		               				<form>
		               					<div class="d-grid">
				                			<input type="hidden" name="order_no" value="${orderVo.order_no }">
				                			<button class="btn btn-success"> 리뷰보기 </button>
		               					</div>
		               				</form>
		               			</div>
					      	</c:when>
					      	<c:otherwise>
					      	  	<h5> 에러 </h5>
					      	</c:otherwise>
				        </c:choose>
                	</div>
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